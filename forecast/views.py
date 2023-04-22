import base64
import json
import os
from io import BytesIO

from django.http import HttpResponse
from django.shortcuts import render

from forecast import StackingLearning

from django.views.decorators.csrf import csrf_exempt
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import MinMaxScaler
from keras.models import Sequential
from keras.layers import LSTM, Dense, Dropout, GRU
from django.shortcuts import redirect
from keras.models import load_model
from sklearn.ensemble import GradientBoostingRegressor
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score

algorithm = [
    'LSTM', 'GBDT', 'GRU'
]
file_path = ''
model_list = []
features = []


@csrf_exempt
def index(request):
    global algorithm, file_path, model_list, features
    model_list = os.listdir("model")
    features = request.POST['features']
    features = features.replace('"', '').replace("'", '').replace('[', '').replace(']', '').split(',')
    for i in range(len(features)):
        features[i] = features[i].strip()
    context = {
        "model": model_list,
        "features": features,
        "algorithm": algorithm,
        "file_path": request.POST['file_path'],
    }
    file_path = request.POST['file_path']
    return render(request, 'forecast/index.html', context)


@csrf_exempt
def xunlian(request):
    if 'train' in request.POST:
        # 获取模型的名称，以便针对选取的模型进行训练
        model_name = request.POST.get("model_name")
        target_feature = request.POST.get("target_feature")
        train_features = request.POST.get("train_features")

        print("收到前台传来的模型训练指令！")
        # train_fea = request.POST.get('train_features')
        # print("train_feature:", train_fea)
        # target_fea = request.POST.get('target_feature')
        print("train_features:", train_features)
        if model_name == 'GBDT':
            plt, mae, mse = gbdt(file_path)
            print('模型训练成功！')

            buffer = BytesIO()
            plt.savefig(buffer)
            plot_data = buffer.getvalue()
            imb = base64.b64encode(plot_data)
            ims = imb.decode()
            imd = "data:image/png;base64," + ims
            mae = round(mae, 2)
            mse = round(mse, 2)

            # return HttpResponse(imd, content_type='image/png')
            message = {"image_path": imd, "mae": mae, "mse": mse, "model":model_list, "features":features, "algorithm":algorithm, "file_path":file_path}
            return render(request, 'forecast/index.html', message)

        else:
            plt, mae, mse = model(model_name, file_path)
            print('模型训练成功！')

            buffer = BytesIO()
            plt.savefig(buffer)
            plot_data = buffer.getvalue()
            imb = base64.b64encode(plot_data)
            ims = imb.decode()
            imd = "data:image/png;base64," + ims
            mae = round(mae, 2)
            mse = round(mse, 2)

            # return HttpResponse(imd, content_type='image/png')
            message = {"image_path": imd, "mae": mae, "mse": mse, "model":model_list, "features":features, "algorithm":algorithm, "file_path":file_path}
            return render(request, 'forecast/index.html',message)
    elif 'result' in request.POST:
        model_name = request.POST.get("model_name")

        print("直接查看结果！")
        if model_name == 'GBDT':
            plt, mae, mse = gbdt(file_path)

            buffer = BytesIO()
            plt.savefig(buffer)
            plot_data = buffer.getvalue()
            imb = base64.b64encode(plot_data)
            ims = imb.decode()
            imd = "data:image/png;base64," + ims
            mae = round(mae, 2)
            mse = round(mse, 2)

            # return HttpResponse(imd, content_type='image/png')
            message = {"image_path": imd, "mae": mae, "mse": mse, "model":model_list, "features":features, "algorithm":algorithm, "file_path":file_path}
            return render(request, 'forecast/index.html', message)
        elif model_name is None:
            message_error = '请重新选择模型！'
            print(message_error)
            return render(request, 'forecast/index.html', {"message_error": message_error})

        else:
            plt, mae, mse = chakan(model_name, file_path)

            buffer = BytesIO()
            plt.savefig(buffer)
            plot_data = buffer.getvalue()
            imb = base64.b64encode(plot_data)
            ims = imb.decode()
            imd = "data:image/png;base64," + ims
            mae = round(mae, 2)
            mse = round(mse, 2)

            # return HttpResponse(imd, content_type='image/png')
            message = {"image_path": imd, "mae": mae, "mse": mse, "model":model_list, "features":features, "algorithm":algorithm, "file_path":file_path}
            return render(request, 'forecast/index.html', message)
    else:
        message_error = '请重新选择模型！'
        print(message_error)
        return render(request, 'forecast/index.html', {"message": message_error})

def model(model_name, file_path):
    df = pd.read_excel(file_path)
    df = df[['日期', '平均批发价：牛肉', '平均批发价：羊肉', '平均批发价：鸡蛋']]

    # 将日期转换为时间戳，并将其设置为索引
    df['date'] = pd.to_datetime(df['日期'])
    df.set_index('date', inplace=True)

    # 创建特征矩阵和目标向量
    X = df[['平均批发价：鸡蛋', '平均批发价：羊肉']].values
    y = df[['平均批发价：牛肉']].values

    # 对数据进行归一化处理
    scaler = MinMaxScaler(feature_range=(0, 1))
    X = scaler.fit_transform(X)
    y = scaler.fit_transform(y)

    # 分割数据集为训练集和测试集
    train_size = int(len(X) * 0.8)

    X_train, X_test = X[0:train_size, :], X[train_size:len(X), :]
    y_train, y_test = y[0:train_size, :], y[train_size:len(X), :]

    # 将数据集转换为适合LSTM模型的形状 [样本数，时间步数，特征数]
    def create_dataset(X, y, time_steps=1):
        Xs, ys = [], []
        for i in range(len(X) - time_steps):
            v = X[i:(i + time_steps)]
            Xs.append(v)
            ys.append(y[i + time_steps])
        return np.array(Xs), np.array(ys)

    time_steps = 18

    X_train, y_train = create_dataset(X_train, y_train, time_steps)
    X_test, y_test = create_dataset(X_test, y_test, time_steps)

    # %%
    # 定义LSTM模型
    model = Sequential()
    if model_name =='LSTM':
        model.add(LSTM(units=64, input_shape=(time_steps, 2)))
    elif model_name == 'GRU':
        model.add(GRU(units=64, input_shape=(time_steps, 2)))
    model.add(Dropout(0.5))
    model.add(Dense(units=1))
    model.compile(optimizer='adam', loss='mean_squared_error')
    # 训练模型
    model.fit(X_train, y_train, epochs=50, batch_size=32)
    # 保存模型
    # model.save("LSTM.h5")
    #
    # from keras.models import load_model
    # model = load_model('LSTM.h5')
    # 进行预测
    y_pred = model.predict(X_test)

    # 将归一化的预测结果反转回原始值
    y_test = scaler.inverse_transform(y_test)
    y_pred = scaler.inverse_transform(y_pred)

    from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score
    # 计算预测值与真实值之间的平均绝对误差（MAE）
    mae = mean_absolute_error(y_test, y_pred)
    # 计算预测值与真实值之间的均方误差（MSE）
    mse = mean_squared_error(y_test, y_pred)
    # 输出评估结果
    print("Mean Absolute Error: {:.2f}".format(mae))
    print("Mean Squared Error: {:.2f}".format(mse))

    # 绘制原始结果和预测结果的对比图
    y_test_1 = np.delete(y_test, range(42, 54), axis=0)
    y_pred_1 = np.delete(y_pred, range(0, 42), axis=0)
    y_test_shiji = np.concatenate((y_test_1, y_pred_1), axis=0)

    plt.clf()
    plt.rcParams['font.sans-serif'] = ['SimHei']
    plt.plot(y_test, label='Actual Price')
    plt.plot(y_test_shiji, label='Predicted Price')
    plt.legend()
    plt.title('价格预测')
    plt.xlabel('商品时间顺序')
    plt.ylabel('牛肉批发价')
    return plt, mae, mse
    # plt.show()

def chakan(model_name, file_path):
    df = pd.read_excel(file_path)
    df = df[['日期', '平均批发价：牛肉', '平均批发价：羊肉', '平均批发价：鸡蛋']]

    # 将日期转换为时间戳，并将其设置为索引
    df['date'] = pd.to_datetime(df['日期'])
    df.set_index('date', inplace=True)

    # 创建特征矩阵和目标向量
    X = df[['平均批发价：鸡蛋', '平均批发价：羊肉']].values
    y = df[['平均批发价：牛肉']].values

    # 对数据进行归一化处理
    scaler = MinMaxScaler(feature_range=(0, 1))
    X = scaler.fit_transform(X)
    y = scaler.fit_transform(y)

    # 分割数据集为训练集和测试集
    train_size = int(len(X) * 0.8)

    X_train, X_test = X[0:train_size, :], X[train_size:len(X), :]
    y_train, y_test = y[0:train_size, :], y[train_size:len(X), :]

    # 将数据集转换为适合LSTM模型的形状 [样本数，时间步数，特征数]
    def create_dataset(X, y, time_steps=1):
        Xs, ys = [], []
        for i in range(len(X) - time_steps):
            v = X[i:(i + time_steps)]
            Xs.append(v)
            ys.append(y[i + time_steps])
        return np.array(Xs), np.array(ys)

    time_steps = 18

    X_train, y_train = create_dataset(X_train, y_train, time_steps)
    X_test, y_test = create_dataset(X_test, y_test, time_steps)

    # %%
    # 定义LSTM模型
    model = Sequential()
    print("model_name", model_name)
    model = load_model('model/'+model_name+'.h5')
    # 进行预测
    y_pred = model.predict(X_test)

    # 将归一化的预测结果反转回原始值
    y_test = scaler.inverse_transform(y_test)
    y_pred = scaler.inverse_transform(y_pred)

    # 计算预测值与真实值之间的平均绝对误差（MAE）
    mae = mean_absolute_error(y_test, y_pred)
    # 计算预测值与真实值之间的均方误差（MSE）
    mse = mean_squared_error(y_test, y_pred)
    # 输出评估结果
    print("Mean Absolute Error: {:.2f}".format(mae))
    print("Mean Squared Error: {:.2f}".format(mse))

    # 绘制原始结果和预测结果的对比图
    y_test_1 = np.delete(y_test, range(42, 54), axis=0)
    y_pred_1 = np.delete(y_pred, range(0, 42), axis=0)
    y_test_shiji = np.concatenate((y_test_1, y_pred_1), axis=0)

    plt.clf()
    plt.rcParams['font.sans-serif'] = ['SimHei']
    plt.plot(y_test, label='Actual Price')
    plt.plot(y_test_shiji, label='Predicted Price')
    plt.legend()
    plt.title('价格预测')
    plt.xlabel('商品时间顺序')
    plt.ylabel('牛肉批发价')
    return plt, mae, mse

def gbdt(filepath):
    df = pd.read_excel(filepath)
    df = df[['日期', '平均批发价：牛肉', '平均批发价：羊肉', '平均批发价：鸡蛋']]

    # 将日期转换为时间戳，并将其设置为索引
    df['date'] = pd.to_datetime(df['日期'])
    df.set_index('date', inplace=True)

    # 创建特征矩阵和目标向量
    X = df[['平均批发价：鸡蛋', '平均批发价：羊肉']].values
    y = df[['平均批发价：牛肉']].values

    # 对数据进行归一化处理
    scaler = MinMaxScaler(feature_range=(0, 1))
    X = scaler.fit_transform(X)
    y = scaler.fit_transform(y)

    # 分割数据集为训练集和测试集
    train_size = int(len(X) * 0.8)

    X_train, X_test = X[0:train_size, :], X[train_size:len(X), :]
    y_train, y_test = y[0:train_size, :], y[train_size:len(X), :]

    # 定义GBDT模型
    model = GradientBoostingRegressor(n_estimators=100, learning_rate=0.08, max_depth=1, random_state=0,
                                      loss='squared_error')

    # 训练模型
    model.fit(X_train, y_train)

    # 保存模型
    import pickle
    pickle.dump(model, open('GBDT.pkl', 'wb'))

    # 加载模型
    loaded_model = pickle.load(open('GBDT.pkl', 'rb'))

    # 进行预测
    y_pred = model.predict(X_test)

    # 将归一化的预测结果反转回原始值
    y_test = scaler.inverse_transform(y_test)
    y_pred = y_pred.reshape(-1, 1)
    y_pred = scaler.inverse_transform(y_pred)

    # 计算预测值与真实值之间的平均绝对误差（MAE）
    mae = mean_absolute_error(y_test, y_pred)
    # 计算预测值与真实值之间的均方误差（MSE）
    mse = mean_squared_error(y_test, y_pred)

    # 输出评估结果
    print("Mean Absolute Error: {:.2f}".format(mae))
    print("Mean Squared Error: {:.2f}".format(mse))

    # 绘制原始结果和预测结果的对比图

    y_test = y_test[0:55]
    y_test_1 = np.delete(y_test, range(42, 54), axis=0)
    y_pred_1 = np.delete(y_pred, range(0, 42), axis=0)
    y_test_shiji = np.concatenate((y_test_1, y_pred_1), axis=0)
    y_test_shiji = y_test_shiji[0:55]

    plt.clf()
    plt.rcParams['font.sans-serif'] = ['SimHei']
    plt.plot(y_test, label='Actual Price')
    plt.plot(y_test_shiji, label='Predicted Price')
    plt.legend()
    plt.title('价格预测')
    plt.xlabel('商品时间顺序')
    plt.ylabel('牛肉批发价')
    return plt, mae, mse



def train_model(request):
    if request.method == "POST":
        body = request.POST
        features = json.loads(body["features"])
        for i in range(len(features)):
            features[i] = features[i].strip()
        # features = features.replace('"', '')
        # features = features.replace('[', '')
        # features = features.replace(']', '')
        # features = features.split(',')
        algorithm = body["algorithm"]
        file_path = body["file_path"]
        target = body["target"]
        model = StackingLearning.stacking_exe(algorithm, features, file_path, target)
        model.train()
        cwd = os.getcwd()
        model_list = os.listdir(cwd + "/model")
        model.save("model/stackingmodel" + str(len(model_list)))
        return HttpResponse()


def get_result(request):
    if request.method == "POST":
        body = request.POST
        filename = body['model']
        features = json.loads(body["features"])
        for i in range(len(features)):
            features[i] = features[i].strip()
        algorithm = body["algorithm"]
        target = body["target"]
        file_path = body["file_path"]
        model = StackingLearning.stacking_exe(algorithm, features, file_path, target)
        model.load("model/" + filename)
        buffer = BytesIO()
        plt = model.get_img()
        plt.savefig(buffer)
        plot_data = buffer.getvalue()
        imb = base64.b64encode(plot_data)
        ims = imb.decode()
        imd = "data:image/png;base64," + ims
        return HttpResponse(imd, content_type='image/png')
