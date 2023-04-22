import os
from io import BytesIO

import joblib
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import sklearn.preprocessing  # Feature Scaling Normalization
import xgboost as xgb
from keras.layers import Bidirectional, LSTM, Dropout, Dense, Activation
from keras.layers import GRU
from sklearn.metrics import mean_absolute_error, mean_squared_error, max_error
# import model
from keras.models import Sequential
from sklearn.ensemble import GradientBoostingRegressor, RandomForestRegressor
from sklearn.model_selection import KFold, train_test_split
import copy

from sklearn.svm import SVR
from tensorflow import keras
# import keras

os.environ["CUDA_VISIBLE_DEVICES"] = "0"
SEQ_LEN = 20
BATCH_SIZE = 100
x_train, y_train, x_test, y_test = None, None, None, None
model_name = None
y_scaler = sklearn.preprocessing.MinMaxScaler()
scaler_array = []
scaler = sklearn.preprocessing.MinMaxScaler()

SEQ_LEN = 20
os.environ["CUDA_VISIBLE_DEVICES"] = "0"
BATCH_SIZE = 100


# creating a sequence of 100 hours at position 0.
def to_sequences(data, seq_len):
    d = []
    for index in range(len(data) - seq_len):
        d.append(data[index: index + seq_len])
    return np.array(d)


def preprocess(data_raw, seq_len, train_split):
    data = to_sequences(data_raw, seq_len)
    num_train = int(train_split * data.shape[0])
    X = data[:, :-1, :-1]
    y = data[:, -1, -1]
    return train_test_split(X, y, train_size=train_split)
    # X_train = data[:num_train, :-1, :]
    # y_train = data[:num_train, -1, :]
    # X_test = data[num_train:, :-1, :]
    # y_test = data[num_train:, -1, :]
    # print(X_train.shape)
    # print(y_train.shape)
    # print(X_test.shape)
    # print(y_test.shape)
    # return X_train, y_train, X_test, y_test


def scaler_data(X, features):
    global scaler, y_scaler
    import numpy as np
    scaled_close = []
    close_price = X  # The scaler expects the data to be shaped as (x, y)
    for i in range(0, len(features)):
        tmp_scaler = sklearn.preprocessing.MinMaxScaler()
        tmp_close_price = close_price[:, i]
        tmp_close_price = np.asarray(tmp_close_price).astype(np.float32)
        tmp_close_price = tmp_close_price.reshape(-1, 1)
        tmp_close = tmp_scaler.fit_transform(tmp_close_price)
        scaler_array.append(tmp_scaler)
        tmp_close = tmp_close[~np.isnan(tmp_close)]
        scaled_close.append(tmp_close)
        y_scaler = tmp_scaler
    scaled_close = np.asarray(scaled_close).astype(np.float32)
    scaled_close = scaled_close.T
    return preprocess(scaled_close, SEQ_LEN, 0.95)


def get_data(features, file_path):
    data_set = pd.read_excel(file_path)
    data_set = data_set.reindex(columns=features)
    # data_set = data_set.iloc[6:, :]
    data_set = data_set.dropna(how='any')
    data_set = np.asarray(data_set).astype(np.float32)
    tmp_data = []
    return data_set


class Stacking:
    def __init__(self, base_models, meta_model, n_folds=5):
        self.model_name = ["GBDT", "GRU", "LSTM", "RF", "SVM", "Xgboost", "RF_meta"]
        self.model_to_constructor = {
            "GBDT": GBDT_constructor(),
            "GRU": GRU_constructor(),
            "LSTM": LSTM_constructor(),
            "RF": RF_constructor(),
            "SVM": SVM_constructor(),
            "Xgboost": Xgboost_constructor(),
            "RF_meta": RF_meta_constructor()
        }
        self.base_models = base_models
        self.meta_models = meta_model
        self.meta_models_ = self.meta_models.get_model()
        self.base_models_ = [list() for x in self.base_models]
        self.n_folds = n_folds

    def save(self, filename):
        folder = os.path.exists(filename)
        if not folder:
            os.mkdir(filename)
        else:
            os.rmdir(filename)
            os.mkdir(filename)
        cwd = os.getcwd()
        os.chdir(cwd + '/' + filename)
        base_model_path = 'base_model_'
        meta_model_path = 'meta_model_'
        for models in self.base_models_:
            for i, model in enumerate(models):
                model.save(base_model_path + model.get_name() + "_" + str(i))
        self.meta_models_.save(meta_model_path + self.meta_models_.get_name())
        os.chdir(cwd)

    # 此处留坑~~~~~~！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
    def load(self, filename):
        self.base_models_ = []
        self.meta_models_ = None
        folder = os.path.exists(filename)
        if not folder:
            print("not exists " + filename + " folder")
            return
        file_list = os.listdir(filename)
        now_model_index = -1
        cwd = os.getcwd()
        os.chdir(cwd + '/' + filename)
        base_model_list = []
        for name in file_list:
            for index, item in enumerate(self.model_name):
                if name.find(item) != -1:
                    model = self.model_to_constructor[item].get_model()
                    model.load(name)
                    if now_model_index == -1:
                        now_model_index = index
                    if now_model_index != index:
                        now_model_index = index
                        self.base_models_.append(base_model_list)
                        base_model_list = []
                    base_model_list.append(model)
                    break
        meta = self.model_to_constructor["RF_meta"].get_model()
        meta.load("meta_model_RF_meta")
        self.meta_models_ = meta
        os.chdir(cwd)

    def fit(self, X, y, epochs=2):
        global out_data
        kfold = KFold(n_splits=self.n_folds, shuffle=True, random_state=156)
        out_of_fold_predictions = np.zeros((X.shape[0], len(self.base_models)))
        for i, model in enumerate(self.base_models):
            for train_index, holdout_index in kfold.split(X, y):
                instance = model.get_model()
                self.base_models_[i].append(instance)
                instance.fit(X[train_index], y[train_index], epochs=epochs)
                y_pred = instance.predict(X[holdout_index])
                y_pred = y_pred.reshape(y_pred.shape[0])
                print("MAE:" + str(
                    mean_absolute_error(y_pred, y_scaler.inverse_transform(y[holdout_index].reshape(-1, 1)))))
                out_of_fold_predictions[holdout_index, i] = y_pred.reshape(y_pred.shape[0])
        out_of_fold_predictions = np.asarray(out_of_fold_predictions).astype(np.float32)
        y = np.asarray(y).astype(np.float32)
        y = y_scaler.inverse_transform(y.reshape(-1, 1))
        print(out_of_fold_predictions)
        print(y)
        self.meta_models_.fit(out_of_fold_predictions, y)
        return self

    def predict(self, X):
        # meta_features = []
        # for base_models in self.base_models_:
        #     meta_features.append(np.column_stack([model.predict(X) for model in base_models]).mean(axis=1))
        meta_features = np.column_stack([
            np.column_stack([model.predict(X) for model in base_models]).mean(axis=1)
            for base_models in self.base_models_])
        return self.meta_models_.predict(meta_features)


class SVM:
    def __init__(self):
        self.model = SVR(kernel='linear')

    def get_name(self):
        return "SVM"

    def fit(self, X, Y, epochs=None):
        train_X = train_data_inverse(X)
        train_Y = test_data_invese(Y)
        print('Training SVM...')
        nsamples = train_X.shape[0]
        nx = 1
        for num in train_X.shape[1:]:
            nx = nx * num
        d2_train_dataset = train_X.reshape(nsamples, nx)
        train_Y = train_Y.reshape(nsamples, )
        print(d2_train_dataset.shape)
        self.model.fit(d2_train_dataset, train_Y)

    def predict(self, X):
        train_X = train_data_inverse(X)
        nsamples = train_X.shape[0]
        nx = 1
        for num in train_X.shape[1:]:
            nx = nx * num
        d2_train_dataset = train_X.reshape(nsamples, nx)
        return self.model.predict(d2_train_dataset)


class SVM_constructor():
    def get_model(self):
        return SVM()


class LSTM_RNN:
    def __init__(self, WINDOW_SIZE, features_num, batch_size=128, dropout_probability=0.2,
                 loss='mse',
                 optimizer='adam'):
        self.rnn = Sequential()
        self.batch_size = batch_size
        self.look_back = WINDOW_SIZE
        self.rnn.add(Bidirectional(LSTM(WINDOW_SIZE, return_sequences=True), input_shape=(WINDOW_SIZE, features_num)))
        self.rnn.add(Dropout(rate=dropout_probability))
        self.rnn.add(Bidirectional(LSTM((WINDOW_SIZE * 2), return_sequences=True)))
        self.rnn.add(Dropout(rate=dropout_probability))
        self.rnn.add(Bidirectional(LSTM(WINDOW_SIZE, return_sequences=False)))
        self.rnn.add(Dense(1))
        self.rnn.add(Activation('linear'))
        self.rnn.compile(loss=loss, optimizer=optimizer)

    def get_name(self):
        return "LSTM"

    def fit(self, X, Y, epochs=20):
        print('Training LSTM-RNN...')
        self.rnn.fit(X, Y, epochs=epochs, batch_size=self.batch_size, verbose=2)

    def evaluate(self, X, Y):
        score = self.rnn.evaluate(X, Y, batch_size=self.batch_size, verbose=0)
        print(score)
        return score

    def predict(self, X):
        result = self.rnn.predict(X)
        return y_scaler.inverse_transform(result.reshape(-1, 1))

    def load(self, filename):
        self.rnn = keras.models.load_model(filename)

    def save(self, filename):
        self.rnn.save(filename)


class LSTM_constructor():
    def get_model(self):
        return LSTM_RNN(SEQ_LEN - 1, x_train.shape[-1])


class GBDT:
    def __init__(self):
        self.model = GradientBoostingRegressor(learning_rate=0.1, n_estimators=300)

    def get_name(self):
        return "GBDT"

    def save(self, name):
        joblib.dump(self.model, name)

    def load(self, name):
        self.model = joblib.load(name)

    def fit(self, X, Y, epochs=None):
        print('Training GBDT...')
        train_X = train_data_inverse(X)
        train_Y = test_data_invese(Y)
        nsamples, nx, ny = train_X.shape
        d2_train_dataset = train_X.reshape((nsamples, nx * ny))
        train_Y = train_Y.flatten()
        self.model.fit(d2_train_dataset, train_Y)

    def predict(self, X):
        train_X = train_data_inverse(X)
        nsamples = train_X.shape[0]
        nx = 1
        for num in train_X.shape[1:]:
            nx = nx * num
        d2_train_dataset = train_X.reshape(nsamples, nx)
        return self.model.predict(d2_train_dataset)


class GBDT_constructor():
    def get_model(self):
        return GBDT()


class GRU_RNN:
    def __init__(self, WINDOW_SIZE, features_num, batch_size=128, dropout_probability=0.2, init='he_uniform',
                 loss='mse',
                 optimizer='rmsprop'):
        self.rnn = Sequential()
        self.batch_size = batch_size
        self.look_back = WINDOW_SIZE
        self.rnn.add(GRU(4, input_shape=(WINDOW_SIZE, features_num)))
        self.rnn.add(Dropout(dropout_probability))
        self.rnn.add(Dense(1))
        self.rnn.compile(loss=loss, optimizer=optimizer)

    def get_name(self):
        return "GRU"

    def fit(self, X, Y, epochs=150):
        print('Training GRU-RNN...')
        self.rnn.fit(X, Y, epochs=epochs, batch_size=self.batch_size, verbose=2)

    def evaluate(self, X, Y):
        score = self.rnn.evaluate(X, Y, batch_size=self.batch_size, verbose=0)
        print(score)
        return score

    def predict(self, X):
        result = self.rnn.predict(X)
        return y_scaler.inverse_transform(result.reshape(-1, 1))

    def save(self, filename):
        self.rnn.save(filename)

    def load(self, filename):
        self.rnn = keras.models.load_model(filename)


class GRU_constructor:
    def get_model(self):
        return GRU_RNN(SEQ_LEN - 1, x_train.shape[-1])


class RF:
    def __init__(self):
        self.model = RandomForestRegressor(n_estimators=300, random_state=0)

    def get_name(self):
        return "RF"

    def fit(self, X, Y, epochs=None):
        train_X = train_data_inverse(X)
        train_Y = test_data_invese(Y)
        print('Training RF...')
        nsamples = train_X.shape[0]
        nx = 1
        for num in train_X.shape[1:]:
            nx = nx * num
        d2_train_dataset = train_X.reshape(nsamples, nx)
        train_Y = train_Y.reshape(nsamples, )
        print(d2_train_dataset.shape)
        self.model.fit(d2_train_dataset, train_Y)

    def predict(self, X):
        train_X = train_data_inverse(X)
        nsamples = train_X.shape[0]
        nx = 1
        for num in train_X.shape[1:]:
            nx = nx * num
        d2_train_dataset = train_X.reshape(nsamples, nx)
        return self.model.predict(d2_train_dataset)

    def save(self, filename):
        joblib.dump(self.model, filename)

    def load(self, filename):
        self.model = joblib.load(filename)


class RF_constructor():
    def get_model(self):
        return RF()


class RF_meta:
    def __init__(self):
        self.model = RandomForestRegressor(n_estimators=300, random_state=0)

    def get_name(self):
        return "RF_meta"

    def fit(self, X, Y, epochs=None):
        print('Training RF_meta...')
        nsamples = X.shape[0]
        nx = 1
        for num in X.shape[1:]:
            nx = nx * num
        d2_train_dataset = X.reshape(nsamples, nx)
        Y = Y.reshape(nsamples, )
        self.model.fit(d2_train_dataset, Y)

    def predict(self, X):
        nsamples = X.shape[0]
        nx = 1
        for num in X.shape[1:]:
            nx = nx * num
        d2_train_dataset = X.reshape(nsamples, nx)
        return self.model.predict(d2_train_dataset).reshape(-1, 1)

    def save(self, filename):
        joblib.dump(self.model, filename)

    def load(self, filename):
        self.model = joblib.load(filename)


class RF_meta_constructor():
    def get_model(self):
        return RF_meta()


class Xgboost_model:
    def __init__(self):
        self.model = xgb.XGBRegressor(n_estimators=300,
                                      learning_rate=0.1,
                                      max_depth=5)

    def get_name(self):
        return "Xgboost"

    def fit(self, X, Y, epochs=None):
        train_X = train_data_inverse(X)
        traub_Y = test_data_invese(Y)
        print('Training XGboost...')
        nsamples, nx, ny = train_X.shape
        d2_train_dataset = train_X.reshape((nsamples, nx * ny))
        self.model.fit(d2_train_dataset, traub_Y)

    def predict(self, X):
        train_X = train_data_inverse(X)
        nsamples, nx, ny = train_X.shape
        d2_train_dataset = train_X.reshape(nsamples, nx * ny)
        return self.model.predict(d2_train_dataset)

    def save(self, filename):
        joblib.dump(self.model, filename)

    def load(self, filename):
        self.model = joblib.load(filename)


class Xgboost_constructor():
    def get_model(self):
        return Xgboost_model()


from sklearn.svm import SVR


class SVM:
    def __init__(self):
        self.model = SVR(kernel='poly')

    def get_name(self):
        return "SVM"

    def fit(self, X, Y, epochs=None):
        train_X = train_data_inverse(X)
        train_Y = test_data_invese(Y)
        print('Training SVM...')
        nsamples = train_X.shape[0]
        nx = 1
        for num in train_X.shape[1:]:
            nx = nx * num
        d2_train_dataset = train_X.reshape(nsamples, nx)
        train_Y = train_Y.reshape(nsamples, )
        print(d2_train_dataset.shape)
        self.model.fit(d2_train_dataset, train_Y)

    def predict(self, X):
        train_X = train_data_inverse(X)
        nsamples = train_X.shape[0]
        nx = 1
        for num in train_X.shape[1:]:
            nx = nx * num
        d2_train_dataset = train_X.reshape(nsamples, nx)
        return self.model.predict(d2_train_dataset)

    def save(self, filename):
        joblib.dump(self.model, filename)

    def load(self, filename):
        self.model = joblib.load(filename)


class SVM_constructor():
    def get_model(self):
        return SVM()


def train_data_inverse(X):
    # (samples, window_size, features)
    new_data = np.empty(shape=X.shape)
    for i in range(0, X.shape[0]):
        new_sample = copy.deepcopy(X[i, :, :])
        new_sample = new_sample.T
        for j in range(0, X.shape[2]):
            new_sample[j] = scaler_array[j].inverse_transform(new_sample[j].reshape(1, -1))
        new_sample = new_sample.T
        new_data[i] = new_sample
    print(new_data.shape)
    return new_data


def test_data_invese(y):
    return y_scaler.inverse_transform(y.reshape(-1, 1))


class stacking_exe:
    def __init__(self, model_select: str, feature_select, file_path, target_select):
        index = 0
        while feature_select[index] != target_select:
            index = index + 1
        tmp = copy.deepcopy(feature_select[index])
        feature_select[index] = feature_select[len(feature_select) - 1]
        feature_select[len(feature_select) - 1] = tmp
        self.data = get_data(feature_select, file_path)
        self.data = np.asarray(self.data).astype(np.float32)
        self.x_train, self.x_test, self.y_train, self.y_test = scaler_data(self.data, feature_select)
        global x_train, y_train, x_test, y_test
        x_train, y_train, x_test, y_test = self.x_train, self.y_train, self.x_test, self.y_test
        self.base_model = list()
        models = model_select.split(',')
        for model in models:
            if model == "GRU":
                self.base_model.append(GRU_constructor())
            if model == "LSTM":
                self.base_model.append(LSTM_constructor())
            if model == "RF":
                self.base_model.append(RF_constructor())
            if model == "Xgboost":
                self.base_model.append(Xgboost_constructor())
            if model == "GBDT":
                self.base_model.append(GBDT_constructor())
            if model == "SVM":
                self.base_model.append(SVM_constructor())
        meta_model = RF_meta_constructor()
        self.stacking_model = Stacking(self.base_model, meta_model, len(self.base_model))

    def load(self, filename):
        self.stacking_model.load(filename)

    def save(self, filename):
        self.stacking_model.save(filename)

    def train(self):
        self.stacking_model.fit(self.x_train, self.y_train, epochs=2)

    def get_img(self):
        y_pred = self.stacking_model.predict(self.x_test)
        y_test_inverse = y_scaler.inverse_transform(self.y_test.reshape(-1, 1))
        mae = "MAE:" + str(int(mean_absolute_error(y_pred, y_test_inverse)))
        mse = "MSE:" + str(int(mean_squared_error(y_pred, y_test_inverse)))
        MAX_error = "MAX: " + str(int(max_error(y_pred, y_test_inverse)))
        print(mae)
        print(mse)
        print(MAX_error)
        plt.figure(figsize=(12, 4))
        plt.plot(y_test_inverse, color='r')
        plt.plot(y_pred, color='g')
        plt.title('Actual vs Prediction plot (Price prediction model)')
        plt.ylabel('price')
        plt.xlabel('date')
        plt.legend(['actual', 'stacking', 'RF', 'Xgboost', 'GBDT', 'LSTM', 'GRU'], loc='upper left')
        plt.text(120, min(min(y_test_inverse), min(y_pred)), mae + '\n' + mse + '\n' + MAX_error)
        return plt

# data = get_data()
# data = np.asarray(data).astype(np.float32)
# x_train, x_test, y_train, y_test = scaler_data(data)
# base_model = list()
# base_model.append(RF_constructor())
# base_model.append(Xgboost_constructor())
# base_model.append(GBDT_constructor())
# base_model.append(LSTM_constructor())
# base_model.append(GRU_constructor())
# meta_model = RF_meta_constructor()
# stacking_model = Stacking(base_model, meta_model, len(base_model))
# stacking_model.fit(x_train, y_train, epochs=150)
# y_pred, meta_featrues = stacking_model.predict(x_test)
# y_test_inverse = y_scaler.inverse_transform(y_test.reshape(-1, 1))
# print("MAE:" + str(mean_absolute_error(y_pred, y_test_inverse)))
# print("MSE:" + str(mean_squared_error(y_pred, y_test_inverse)))
# plt.figure(figsize=(15, 5))
# plt.plot(y_test_inverse, color='r')
# plt.plot(y_pred, color='g')
# plt.title('Actual vs Prediction plot (Price prediction model)')
# plt.ylabel('price')
# plt.xlabel('date')
# plt.legend(['actual', 'stacking', 'RF', 'Xgboost', 'GBDT', 'LSTM', 'GRU'], loc='upper left')
# plt.show()
