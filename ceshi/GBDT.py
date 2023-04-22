import pandas as pd
import numpy as np
from sklearn.preprocessing import MinMaxScaler
from sklearn.ensemble import GradientBoostingRegressor
from sklearn.metrics import mean_absolute_error, mean_squared_error
import matplotlib.pyplot as plt

# 读取数据
df = pd.read_excel(r'D:\jianzhi\eighth\price_changes.xlsx')
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
model = GradientBoostingRegressor(n_estimators=100, learning_rate=0.08, max_depth=1, random_state=0, loss='squared_error')

# 训练模型
model.fit(X_train, y_train)

# 保存模型
import pickle
pickle.dump(model, open('../model/GBDT.pkl', 'wb'))

# 加载模型
loaded_model = pickle.load(open('../model/GBDT.pkl', 'rb'))

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
plt.rcParams['font.sans-serif']=['SimHei']
plt.plot(y_test, label='Actual Price')
plt.plot(y_test_shiji, label='Predicted Price')
plt.legend()
plt.title('价格预测')
plt.xlabel('商品时间顺序')
plt.ylabel('牛肉批发价')

# plt.savefig('C:\\Users\\独为我唱\\Desktop\\archive\\lstm_model_1.pdf', bbox_inches='tight' )
plt.show()