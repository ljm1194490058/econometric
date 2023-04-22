import importlib
import json
import os
import time
from decimal import Decimal

import joblib
import numpy as np
import pandas as pd
from django.conf import settings
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

from app.models import dataset, forecast, algorithm, User, Balance, OrderHistory


def upload_file(request):
    if request.method == "POST":
        myFile = request.FILES.get("myfile", None)
        fileType = request.POST["filetype"]
        if not myFile:
            msg = {
                "code": 1,
                "msg": "文件不能为空！"
            }
            return JsonResponse(msg)
        if fileType == "algorithm":
            destination = open(os.path.join(
                settings.ALGORITHM_ROOT, myFile.name), 'wb+')
            for chunk in myFile.chunks():  # 分块写入文件
                destination.write(chunk)
            destination.close()
            msg = {
                "code": 0,
                "msg": "算法上传成功！",
                'filename': myFile.name
            }
            return JsonResponse(msg)


def upload_img(request):
    if request.method == "POST":
        myFile = request.FILES.get("myfile", None)
        if not myFile:
            msg = {
                "code": 1,
                "msg": "文件不能为空！"
            }
            return JsonResponse(msg)

        destination = open(
            os.path.join(settings.IMG_ROOT, myFile.name), 'wb+')
        for chunk in myFile.chunks():  # 分块写入文件
            destination.write(chunk)
        destination.close()
        msg = {
            "code": 0,
            "msg": "图片上传成功！",
            'filename': myFile.name
        }
        return JsonResponse(msg)


def change_info(request):
    if request.method == "POST":
        user_id = request.session.get('user_id')
        team_id = request.session.get('team_id')
        if user_id:
            user = User.objects.get(pk=user_id)
            balance = Balance.objects.filter(user_id=user_id).first()
            if balance is None:
                balance = Balance()
                balance.user_id = user_id
            balance.balance = request.POST.get('balance')
            balance.save()
        elif team_id:
            user = User.objects.get(pk=team_id)
        else:
            return JsonResponse({
                'code': 1,
                'msg': 'failed',
            })
        user.username = request.POST.get('name')
        user.email = request.POST.get('email')
        user.research_field = request.POST.get('field')
        user.organization = request.POST.get('organization')
        user.save()

        team_balance = request.POST.get('team_balance')
        if team_balance is not None:
            team = User.objects.get_team(user=user)
            balance = Balance.objects.filter(user_id=team.id).first()
            if balance is None:
                balance = Balance()
                balance.user_id = team.id
            balance.balance = team_balance
            balance.save()

        return JsonResponse({
            'code': 0,
            'msg': 'success',
        })


def upload_data(request):
    if request.method == "POST":
        myFile = request.FILES.get("myfile", None)
        user_id = request.session.get('user_id')
        team_id = request.session.get('team_id')

        if not myFile:
            msg = {
                "code": 1,
                "msg": "文件不能为空！"
            }
            return JsonResponse(msg)

        newDataFile = dataset(name=myFile.name)

        if user_id:
            newDataFile.usertype = "user"
            newDataFile.userId = user_id

            path = os.path.join(settings.DATA_ROOT, 'user', str(user_id))
            newDataFile.filepath = path
            if not os.path.exists(path):
                os.mkdir(os.path.join(settings.DATA_ROOT, 'user', str(user_id)))
            destination = open(os.path.join(
                settings.DATA_ROOT, 'user', str(user_id), myFile.name), 'wb+')
        elif team_id:
            newDataFile.usertype = "team"
            newDataFile.userId = team_id

            path = os.path.join(settings.DATA_ROOT, 'team', str(team_id))
            newDataFile.filepath = path
            if not os.path.exists(path):
                os.mkdir(os.path.join(settings.DATA_ROOT, 'team', str(team_id)))
            destination = open(os.path.join(
                settings.DATA_ROOT, 'team', str(team_id), myFile.name), 'wb+')
        else:
            newDataFile.usertype = "admin"
            newDataFile.userId = 0

            foldername = time.strftime("%Y%m%d", time.localtime())
            path = os.path.join(settings.DATA_ROOT, 'admin', str(foldername))
            newDataFile.filepath = path
            if not os.path.exists(path):
                os.mkdir(os.path.join(settings.DATA_ROOT, 'admin', str(foldername)))
            destination = open(os.path.join(
                settings.DATA_ROOT, 'admin', str(foldername), myFile.name), 'wb+')
        # 分块写入文件
        for chunk in myFile.chunks():
            destination.write(chunk)
        destination.close()
        # 保存数据信息
        path = path + '/' + myFile.name
        data = readExcel(path)
        numdata = data.to_numpy()
        tnumdata = numdata.T
        columnName = data.columns
        newDataFile.save()
        msg = {
            "code": 0,
            "msg": "数据上传成功！",
            'filename': myFile.name,
            'dataid': newDataFile.id,
            'dataindex': list(data.index),
            'numdata': tnumdata.tolist(),
            'columnName': list(columnName),
            'indexname': data.index.name
        }
        return JsonResponse(msg)


def download_data(request):
    path = os.path.join(settings.TEMPLATE_ROOT, "数据模版.xlsx")
    file = open(path, "rb")
    response = HttpResponse(file)
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename="template.xlsx"'
    return response


def download_al(request):
    path = os.path.join(settings.TEMPLATE_ROOT, "ALtemplate.py")
    file = open(path, "rb")
    response = HttpResponse(file)
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename="template.py"'
    return response


def createForecast(request):
    if request.method == "POST":
        user_id = request.session.get('user_id')
        team_id = request.session.get('team_id')

        newForecast = forecast(name=request.POST.get('forecastName'))
        # newForecast.algorithmid = request.POST.get('forecastAlgorithm')
        newForecast.algorithmid = 2  # 先用着，以后有空再改
        newForecast.dataset = request.POST.get('dataid')

        if user_id:
            newForecast.userid = user_id
            newForecast.usertype = request.POST.get('forecastType')
        elif team_id:
            newForecast.userid = User.objects.get_manager(user_id=team_id).id
            newForecast.usertype = 'team'
        newForecast.save()
        msg = {
            "code": 0,
            'msg': '创建成功！'
        }
        return JsonResponse(msg)


def readExcel(filepath):
    data = pd.read_excel(filepath, sheet_name=0, header=0, index_col=0)
    return data


def runAl(request):
    if request.method == "POST":
        user_id = request.session.get('user_id')
        team_id = request.session.get('team_id')

        if not user_id and not team_id:
            data = {
                "title": "登录"
            }
            return render(request, '用户端/登录.html', context=data)

        xdata = request.POST.get("xdata")
        ydata = request.POST.get("ydata")
        fid = request.POST.get("fid")

        myf = forecast.objects.get(pk=fid)
        myf.datax = xdata
        myf.datay = ydata

        xdata = json.loads(xdata)
        ydata = json.loads(ydata)
        alid = request.POST.get('alid')
        dataid = request.POST.get('dataid')
        paras = request.POST.get('paras')
        paras = json.loads(paras)
        # 获取算法
        alg = algorithm.objects.get(pk=alid)
        alfile = alg.filename
        alfile = alfile.split(".")[0]
        path = "app.algorithm." + alfile
        params = importlib.import_module(path)

        # 获取数据
        dat = dataset.objects.get(pk=dataid)
        datapath = dat.filepath + '/' + dat.name
        alldata = readExcel(datapath)
        numdata = alldata.to_numpy()
        numdata = numdata.T
        columnName = list(alldata.columns)

        x = []
        y = []
        for i in xdata:
            idx = columnName.index(i)
            x.append(numdata[idx])
        x = np.array(x)
        x = x.T

        idx_y = columnName.index(ydata[0])
        y.append(numdata[idx_y])
        y = np.array(y)
        y = y.T

        mymodel = params.train(X=x, Y=y, args=paras)
        myscore = params.score(mymodel, x, y)
        modelpath = os.path.join(settings.MODEL_ROOT, fid + ".pkl")
        joblib.dump(mymodel, modelpath)
        myf.model = modelpath
        myf.save()

        # msg={"code":0,"msg":{"alid":alid,"dataid":dataid,"paras":paras,"x":xdata,"y":ydata}}
        msg = {
            "code": 0,
            "msg": "算法运行成功！",
            "score": myscore
        }
        return JsonResponse(msg)


def runPredict(request):
    if request.method == "POST":
        user_id = request.session.get('user_id')
        team_id = request.session.get('team_id')

        if not user_id and not team_id:
            data = {
                "title": "登录"
            }
            return render(request, '用户端/登录.html', context=data)

        fid = request.POST.get("fid")
        # 获取自变量数据
        xdata = request.POST.get("data")
        xdata = json.loads(xdata)
        xdata = np.array(xdata)
        # 获取算法和模型
        myf = forecast.objects.get(pk=fid)
        alg = algorithm.objects.get(pk=myf.algorithmid)
        alfile = alg.filename
        alfile = alfile.split(".")[0]
        path = "app.algorithm." + alfile
        params = importlib.import_module(path)
        model = joblib.load(myf.model)
        # 运行预测
        r = params.predict(model=model, X=xdata)
        msg = {
            "code": 0,
            "y": r.tolist()
        }
        return JsonResponse(msg)


def delete_forecast(request):
    if request.method == "POST":
        user_id = request.session.get('user_id')
        team_id = request.session.get('team_id')

        if not user_id and not team_id:
            data = {
                "title": "登录"
            }
            return render(request, '用户端/登录.html', context=data)
        fid = request.POST.get("fid")
        myF = forecast.objects.get(pk=fid)
        myF.delete()
        msg = {
            "code": 0,
            "msg": "删除成功！"
        }
        return JsonResponse(msg)


def runMultiPredict(request):
    if request.method == "POST":
        user_id = request.session.get('user_id')
        team_id = request.session.get('team_id')

        if not user_id and not team_id:
            data = {
                "title": "登录"
            }
            return render(request, '用户端/登录.html', context=data)

        myFile = request.FILES.get("myfile", None)
        fid = request.POST.get("fid")
        if not myFile:
            msg = {
                "code": 1,
                "msg": "文件不能为空！"
            }
            return JsonResponse(msg)

        if user_id:
            usid = str(user_id)
        else:
            usid = str(team_id)

        path = os.path.join(
            settings.DATA_ROOT, 'temp', usid + "_" + myFile.name)
        destination = open(os.path.join(
            settings.DATA_ROOT, 'temp', usid + "_" + myFile.name), 'wb+')
        for chunk in myFile.chunks():  # 分块写入文件
            destination.write(chunk)
        destination.close()

        predict_data = readExcel(path)
        numdata = predict_data.to_numpy()

        myf = forecast.objects.get(pk=fid)
        alg = algorithm.objects.get(pk=myf.algorithmid)
        alfile = alg.filename
        alfile = alfile.split(".")[0]
        alpath = "app.algorithm." + alfile

        params = importlib.import_module(alpath)
        model = joblib.load(myf.model)
        r = params.predict(model=model, X=numdata)

        msg = {
            "code": 0,
            "y": r.T.tolist(),
            "index": predict_data.index.tolist()
        }
        return JsonResponse(msg)


def get_balance(user_id, need_team_balance=False):
    if need_team_balance:
        team = User.objects.get_team(user_id=user_id)
        if team is None:
            return 0.0
        balance = Balance.objects.filter(user_id=team.id).first()
    else:
        balance = Balance.objects.filter(user_id=user_id).first()
    if balance is None:
        balance = Balance.objects.create(user_id=user_id)
    return float(balance.balance)


def orderManage(request):
    if request.method == 'POST':
        user_id = request.session.get('user_id')
        team_id = request.session.get('team_id')
        price = float(request.POST.get('price'))
        count = int(request.POST.get('count'))
        isTeamForecast = request.POST.get('is_team_forecast') == 'true'
        isBuy = request.POST.get('is_buy') == 'true'
        if user_id:
            if not isTeamForecast:
                balance = Balance.objects.filter(user_id=user_id).first()
                ID = user_id
            else:
                team = User.objects.get_team(user_id=user_id)
                balance = Balance.objects.filter(user_id=team.id).first()
                ID = team.id
        elif team_id:
            balance = Balance.objects.filter(user_id=team_id).first()
            ID = team_id
        else:
            return JsonResponse({
                'code': 1,
                'msg': 'failed',
            })
        if balance is None:
            balance = Balance()
            balance.user_id = ID
            balance.balance = 0.0
            balance.save()
        if isBuy:
            balance.balance -= Decimal(price * count)
        else:
            balance.balance += Decimal(price * count)
        Balance.objects.filter(id=balance.id).update(balance=balance.balance)

        orderHistory = OrderHistory()
        orderHistory.user_id = ID
        orderHistory.forecast_id = request.POST.get('forecast_id')
        orderHistory.is_buy = isBuy
        orderHistory.time = request.POST.get('time')
        orderHistory.price = price
        orderHistory.count = count
        orderHistory.is_team = isTeamForecast
        orderHistory.save()

        return JsonResponse({
            'code': 0,
            'msg': 'success',
        })
