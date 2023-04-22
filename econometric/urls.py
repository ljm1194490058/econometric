"""econometric URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from app import methods

urlpatterns = [
    path('admin/', admin.site.urls),
    path(r'app/', include('app.urls', 'app'), name='app'),
    path(r'forecast/', include('forecast.urls', 'forecast'), name='forecast'),
    # 文件上传
    path(r'uploadFile/', methods.upload_file, name='uploadFile'),
    path(r'uploadData/', methods.upload_data, name="uploadData"),
    path(r'uploadImg/', methods.upload_img, name='uploadImg'),
    path(r'createForecast/', methods.createForecast, name="createF"),
    path(r'runAl/', methods.runAl, name="runAl"),
    path(r'runPredict/', methods.runPredict, name="runPredict"),
    path(r'runMultiPredict/', methods.runMultiPredict, name="runMultiPredict"),
    path(r'changeInfo/', methods.change_info, name="changeInfo"),
    path(r'downloadData/', methods.download_data, name="downloadData"),
    path(r'downloadAl/', methods.download_al, name="downloadAl"),
    path(r'deleteForecast/', methods.delete_forecast, name="deleteForecast"),
    path(r'orderManage/', methods.orderManage, name="orderManage"),

]
