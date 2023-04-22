
import sklearn as sk
import numpy as np

# 训练方法：用于训练模型
# X：数组，训练集自变量
# Y：数组，训练集因变量
# args：字典，包含所需参数  
# 返回值 model：模型
def train(X,Y,args):
    #------待修改部分-----------
    model = sk.linear_model.LinearRegression()
    #-------------------------
    model.fit(X,Y)
    return model

# 打分方法：用于对模型进行打分
# model：模型
# test_x：数组，测试集自变量
# test_y：数组，测试集因变量
# 返回值 r：评分
def score(model,test_x,test_y):
    r = model.score(test_x,test_y)
    return r  

# 预测方法：用于预测
# model：模型
# X：数组，预测用因变量
# 返回值：数组，预测结果
def predict(model,X):
    Y = model.predict(X)
    return Y


