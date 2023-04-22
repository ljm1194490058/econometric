from django.contrib import admin
from django.urls import path, include

from forecast import views

app_name = 'forecast'

urlpatterns = [
    path('', views.index, name='index'),
    path('train', views.train_model, name="train"),
    path('result', views.get_result, name="result"),
    path('xunlian', views.xunlian, name='xunlian')

]
