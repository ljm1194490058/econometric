# import numpy as np
# from numpy import dot
# from numpy.linalg import inv
# from numpy import mat

# def leastSquares(x,y):
#     #最小二乘法
#     theta = dot(dot(inv(dot(x.T, x)), x.T), y)
#     return theta


# x = mat([[8, 7, 8], [8, 7, 8],
#             [9, 9, 7], [6, 6, 7],
#             [5, 6, 5], [4, 5, 6],
#             [3, 2, 5], [5, 7, 5],
#             [6, 7, 8], [6, 6, 7]])
# y = mat([[9], [8], [10], [7], [6],
#             [5], [4], [6], [7], [5]])

# print (leastSquares(x,y))

from sklearn import linear_model 
import matplotlib.pyplot as plt
import numpy as np

def train(X,Y):
    model = linear_model.LinearRegression()
    model.fit(X,Y)
    return model

def getplt(model,xName,yName,path):
    plt.xlabel(xName)
    plt.ylabel(yName)

def score(model,test_x,test_y):
    r = model.score(test_x,test_y)
    return r  

def predict(model,X):
    Y = model.predict(X)
    return Y


