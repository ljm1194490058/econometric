import pandas as pd
import os
import numpy as np
import importlib

path = "algorithm." + "linearRegression"
params = importlib.import_module(path)


def readExcel(filepath):
    return pd.read_excel(filepath, sheet_name=0, header=0, index_col=0)


def test_d(**dic):
    print(dic)


if __name__ == '__main__':
    path = r'/Users/suzhe/Desktop/econometric/static/dataset/user/1/test.xlsx'
    data = readExcel(path)
    columnName = list(data.columns)
    numdata = data.to_numpy()
    d = numdata.T
    x = d[0].reshape(-1, 1)
    y = d[1].reshape(-1, 1)

    model = params.train(x, y)
    r = params.predict(model, d[2].reshape(-1, 1))
    s = params.score(model, x, y)

    ar = [[1, 2, 3, 4, 5, 6, 7, 8, 9]]
    ar = np.array(ar)
    # print(ar.T)

    print(d)

    test = []

    print(test)

    xdata = ["人口", "人均月收入"]

    # for i in xdata:
    #     idx = columnName.index(i)
    #     test.append(d[idx])
    # test = np.array(test)
    # test = test.T
    # print(test)

    diction = {"name": "suzhe"}
    test_d(dic=diction)
