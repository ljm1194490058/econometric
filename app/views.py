import json
import re
from os import path
from time import strftime, strptime

import django.contrib.auth as auth
import numpy as np
from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.urls import reverse

from app import methods
from app.methods import get_balance
from app.models import *
from app.forms import *


def index(request):
    index_img1 = index_img.objects.filter(id=1)[0]
    index_img2 = index_img.objects.filter(id=2)[0]
    # index_img3 = index_img.objects.filter(id=3)[0]
    # index_img4 = index_img.objects.filter(id=4)[0]
    # index_img5 = index_img.objects.filter(id=5)[0]
    # index_img6 = index_img.objects.filter(id=6)[0]
    # index_img7 = index_img.objects.filter(id=7)[0]
    # index_img8 = index_img.objects.filter(id=8)[0]
    # index_img9 = index_img.objects.filter(id=9)[0]
    # index_img10 = index_img.objects.filter(id=10)[0]
    # index_img11 = index_img.objects.filter(id=11)[0]
    # index_img12 = index_img.objects.filter(id=12)[0]
    # index_img13 = index_img.objects.filter(id=13)[0]
    # index_img14 = index_img.objects.filter(id=14)[0]
    # index_img15 = index_img.objects.filter(id=15)[0]
    # index_img16 = index_img.objects.filter(id=16)[0]

    # index_text1 = index_text.objects.filter(id=1)[0]
    # index_text2 = index_text.objects.filter(id=2)[0]
    # index_text3 = index_text.objects.filter(id=3)[0]
    # index_text4 = index_text.objects.filter(id=4)[0]
    # index_text5 = index_text.objects.filter(id=5)[0]
    # index_text6 = index_text.objects.filter(id=6)[0]
    # index_text7 = index_text.objects.filter(id=7)[0]
    # index_text8 = index_text.objects.filter(id=8)[0]
    # index_text9 = index_text.objects.filter(id=9)[0]
    # index_text10 = index_text.objects.filter(id=10)[0]
    # index_text11 = index_text.objects.filter(id=11)[0]
    # index_text12 = index_text.objects.filter(id=12)[0]
    # index_text13 = index_text.objects.filter(id=13)[0]
    # index_text14 = index_text.objects.filter(id=14)[0]

    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'index_img1': "images/" + index_img1.img,
        'index_img2': "images/" + index_img2.img,
        # 'index_img3': "images/" + index_img3.img,
        # 'index_img4': "images/" + index_img4.img,
        # 'index_img5': "images/" + index_img5.img,
        # 'index_img6': "images/" + index_img6.img,
        # 'index_img7': "images/" + index_img7.img,
        # 'index_img8': "images/" + index_img8.img,
        # 'index_img9': "images/" + index_img9.img,
        # 'index_img10': "images/" + index_img10.img,
        # 'index_img11': "images/" + index_img11.img,
        # 'index_img12': "images/" + index_img12.img,
        # 'index_img13': "images/" + index_img13.img,
        # 'index_img14': "images/" + index_img14.img,
        # 'index_img15': "images/" + index_img15.img,
        # 'index_img16': "images/" + index_img16.img,
        # 'index_texts': [
        #     index_text1.text,
        #     index_text2.text,
        #     index_text3.text,
        #     index_text4.text,
        #     index_text5.text,
        #     index_text6.text,
        #     index_text7.text,
        #     index_text8.text,
        #     index_text9.text,
        #     index_text10.text,
        #     index_text11.text,
        #     index_text12.text,
        #     index_text13.text,
        #     index_text14.text,
        # ],
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'index/首页.html', context=data)


def produce(request):
    produce_img1 = produce_img.objects.filter(id=1).first
    produce_img2 = produce_img.objects.filter(id=2).first
    produce_img3 = produce_img.objects.filter(id=3).first
    produce_img4 = produce_img.objects.filter(id=4).first
    produce_img5 = produce_img.objects.filter(id=5).first
    produce_img6 = produce_img.objects.filter(id=6).first
    produce_img7 = produce_img.objects.filter(id=7).first

    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'produce_img1': produce_img1,
        'produce_img2': produce_img2,
        'produce_img3': produce_img3,
        'produce_img4': produce_img4,
        'produce_img5': produce_img5,
        'produce_img6': produce_img6,
        'produce_img7': produce_img7,
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'index/产品系列.html', data)


def recruitment(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'index/人才招聘.html', data)


def teammember(request):
    teammember_img1 = teammember_img.objects.filter(id=1).first
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'teammember_img1': teammember_img1,
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'index/团队成员.html', data)


def service(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'index/关于我们.html', data)


def contactus(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'index/联系我们.html', data)


def solution(request):
    solution_img1 = solution_img.objects.filter(id=1)[0]
    solution_img2 = solution_img.objects.filter(id=2)[0]
    solution_img3 = solution_img.objects.filter(id=3)[0]
    solution_img4 = solution_img.objects.filter(id=4)[0]
    solution_img5 = solution_img.objects.filter(id=5)[0]
    solution_img6 = solution_img.objects.filter(id=6)[0]

    solution_text1 = solution_text.objects.filter(id=1)[0]
    solution_text2 = solution_text.objects.filter(id=2)[0]
    solution_text3 = solution_text.objects.filter(id=3)[0]
    solution_text4 = solution_text.objects.filter(id=4)[0]
    solution_text5 = solution_text.objects.filter(id=5)[0]
    solution_text6 = solution_text.objects.filter(id=6)[0]

    solution_text7 = solution_text.objects.filter(id=7)[0]
    solution_text8 = solution_text.objects.filter(id=8)[0]
    solution_text9 = solution_text.objects.filter(id=9)[0]
    solution_text10 = solution_text.objects.filter(id=10)[0]
    solution_text11 = solution_text.objects.filter(id=11)[0]
    solution_text12 = solution_text.objects.filter(id=12)[0]

    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'solution_img1': "images/" + solution_img1.img,
        'solution_img2': "images/" + solution_img2.img,
        'solution_img3': "images/" + solution_img3.img,
        'solution_img4': "images/" + solution_img4.img,
        'solution_img5': "images/" + solution_img5.img,
        'solution_img6': "images/" + solution_img6.img,
        'solution_texts': [
            solution_text1.text,
            solution_text2.text,
            solution_text3.text,
            solution_text4.text,
            solution_text5.text,
            solution_text6.text,
            solution_text7.text,
            solution_text8.text,
            solution_text9.text,
            solution_text10.text,
            solution_text11.text,
            solution_text12.text,
        ],
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True
    return render(request, 'index/解决方案.html', data)


def agri(request):
    argi_img1 = agri_img.objects.filter(id=1).first()
    argi_img2 = agri_img.objects.filter(id=2).first()
    argi_img3 = agri_img.objects.filter(id=3).first()

    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        "argi_img1": argi_img1,
        "argi_img2": argi_img2,
        "argi_img3": argi_img3,
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/解决方案/agri.html', data)


def disaster(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/解决方案/disaster.html', data)


def env(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/解决方案/env.html', data)


def finance(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/解决方案/finance.html', data)


def labor(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/解决方案/labor.html', data)


def poverty(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/解决方案/poverty.html', data)


def source(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/解决方案/source.html', data)


def trade(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/解决方案/trade.html', data)


def business_team(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/团队成员/business_team.html', data)


def consultant_content(request):
    consultant_content_img1 = consultant_content_img.objects.filter(id=1).first()

    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'consultant_content_img1': consultant_content_img1,
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/团队成员/consultant_content.html', data)


def companyculture(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/关于我们/公司文化.html', data)


def media(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/关于我们/媒体引用.html', data)


def serviceobject(request):
    serviceobject_img1 = serviceobject_img.objects.filter(id=1)[0]
    serviceobject_img2 = serviceobject_img.objects.filter(id=2)[0]
    serviceobject_img3 = serviceobject_img.objects.filter(id=3)[0]
    serviceobject_img4 = serviceobject_img.objects.filter(id=4)[0]
    serviceobject_img5 = serviceobject_img.objects.filter(id=5)[0]
    serviceobject_img6 = serviceobject_img.objects.filter(id=6)[0]
    serviceobject_img7 = serviceobject_img.objects.filter(id=7)[0]
    serviceobject_img8 = serviceobject_img.objects.filter(id=8)[0]
    serviceobject_img9 = serviceobject_img.objects.filter(id=9)[0]
    serviceobject_img10 = serviceobject_img.objects.filter(id=10)[0]
    serviceobject_img11 = serviceobject_img.objects.filter(id=11)[0]
    serviceobject_img12 = serviceobject_img.objects.filter(id=12)[0]
    serviceobject_img13 = serviceobject_img.objects.filter(id=13)[0]
    serviceobject_img14 = serviceobject_img.objects.filter(id=14)[0]

    serviceobject_text_list = []

    for x in range(1, 15):
        serviceobject_text_list.append(serviceobject_text.objects.filter(id=x)[0].text)

    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'serviceobject_img1': "images/" + serviceobject_img1.img,
        'serviceobject_img2': "images/" + serviceobject_img2.img,
        'serviceobject_img3': "images/" + serviceobject_img3.img,
        'serviceobject_img4': "images/" + serviceobject_img4.img,
        'serviceobject_img5': "images/" + serviceobject_img5.img,
        'serviceobject_img6': "images/" + serviceobject_img6.img,
        'serviceobject_img7': "images/" + serviceobject_img7.img,
        'serviceobject_img8': "images/" + serviceobject_img8.img,
        'serviceobject_img9': "images/" + serviceobject_img9.img,
        'serviceobject_img10': "images/" + serviceobject_img10.img,
        'serviceobject_img11': "images/" + serviceobject_img11.img,
        'serviceobject_img12': "images/" + serviceobject_img12.img,
        'serviceobject_img13': "images/" + serviceobject_img13.img,
        'serviceobject_img14': "images/" + serviceobject_img14.img,
        'serviceobject_texts': serviceobject_text_list,
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/关于我们/服务对象.html', data)


def simulation_platform(request):
    simulation_platform_img1 = simulation_platform_img.objects.filter(id=1).first
    simulation_platform_img2 = simulation_platform_img.objects.filter(id=2).first

    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'simulation_platform_img1': simulation_platform_img1,
        'simulation_platform_img2': simulation_platform_img2,
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/仿真平台.html', data)


def training_courses(request):
    training_courses_img1 = training_courses_img.objects.filter(id=1).first
    training_courses_img2 = training_courses_img.objects.filter(id=2).first
    training_courses_img3 = training_courses_img.objects.filter(id=3).first
    training_courses_img4 = training_courses_img.objects.filter(id=4).first
    training_courses_img5 = training_courses_img.objects.filter(id=5).first
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'training_courses_img1': training_courses_img1,
        'training_courses_img2': training_courses_img2,
        'training_courses_img3': training_courses_img3,
        'training_courses_img4': training_courses_img4,
        'training_courses_img5': training_courses_img5,
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/培训课程.html', data)


def database(request):
    database_img1 = database_img.objects.filter(id=1).first()
    database_img2 = database_img.objects.filter(id=2).first()
    database_img3 = database_img.objects.filter(id=3).first()
    database_img4 = database_img.objects.filter(id=4).first()
    database_img5 = database_img.objects.filter(id=5).first()

    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'database_img1': database_img1,
        'database_img2': database_img2,
        'database_img3': database_img3,
        'database_img4': database_img4,
        'database_img5': database_img5,
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/资料库.html', data)


def research_report(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/研究报告.html', data)


def simulation(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/仿真.html', data)


def peixun(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/培训.html', data)


def xinwen(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/新闻.html', data)


def yaniubaoao2(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/研究报告2.html', data)


def yaniubaoao3(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/研究报告3.html', data)


def yaniubaoao4(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/研究报告4.html', data)


def yaniubaoao5(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/研究报告5.html', data)


def yaniubaoao6(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/研究报告6.html', data)


def yaniubaoao7(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/研究报告7.html', data)


def yaniubaoao8(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/研究报告8.html', data)


def ziliao(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/资料.html', data)


def ruanjian(request):
    user_id = request.session.get('user_id')
    team_id = request.session.get('team_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True

    elif team_id:
        data['is_login'] = True
        data['is_team'] = True

    return render(request, 'html/产品系列/软件.html', data)


def registerinfo(request):
    return render(request, '管理端/平台管理/1.1个人注册信息.html')


def zhangmu(request):
    return render(request, '管理端/平台管理/2.1总账目查询.html')


def userinfo(request):
    return render(request, '管理端/平台管理/4.1个人信息管理.html')


def algorithmusage(request):
    return render(request, '管理端/平台管理/5.1使用概况.html')


def price(request):
    return render(request, '管理端/平台管理/6.价格管理.html')


def register(request):
    data = {
        "uinfo": "",
        "pwinfo": "",
        "finfo": "",
        "ninfo": "",
        "oinfo": "",
        "einfo": "",
        "phinfo": ""
    }
    if request.method == 'GET':
        return render(request, '用户端/个人注册.html', data)
    elif request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        field = request.POST.get("field")
        name = request.POST.get("name")
        org = request.POST.get("org")
        email = request.POST.get("email")
        phone = request.POST.get("phone")

        if username == "":
            data["uinfo"] = "请输入用户名"
            return render(request, '用户端/个人注册.html', data)

        if User.objects.filter(account=username).exists():
            data["uinfo"] = "该用户名已存在"
            return render(request, '用户端/个人注册.html', data)

        if password == "":
            data["pwinfo"] = "请输入密码"
            return render(request, '用户端/个人注册.html', data)

        if field == "":
            data["finfo"] = "请输入研究领域"
            return render(request, '用户端/个人注册.html', data)

        if name == "":
            data["ninfo"] = "请输入姓名"
            return render(request, '用户端/个人注册.html', data)

        if org == "":
            data["oinfo"] = "请输入隶属组织"
            return render(request, '用户端/个人注册.html', data)

        if email == "":
            data["einfo"] = "请输入邮箱"
            return render(request, '用户端/个人注册.html', data)

        if phone == "":
            data["phinfo"] = "请输入手机号"
            return render(request, '用户端/个人注册.html', data)

        if len(password) < 6:
            data["pwinfo"] = "密码应不少于六位"
            return render(request, '用户端/个人注册.html', data)

        if re.match(r'^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$', email) is None:
            data["einfo"] = "请输入正确邮箱"
            return render(request, '用户端/个人注册.html', data)

        if re.match(r"^1[35678]\d{9}$", phone) is None:
            data["phinfo"] = "请输入正确手机号"
            return render(request, '用户端/个人注册.html', data)

        User.objects.create_user(username, password, field, name, email, phone, org)
        return redirect(reverse('app:login'))


def register2(request):
    data = {
        "userinfo": "",
        "psinfo": "",
        "fdinfo": "",
        "ninfo": ""
    }
    if request.method == 'GET':
        return render(request, '用户端/团队注册.html', data)
    else:
        username = request.POST.get("username")
        password = request.POST.get("password")
        field = request.POST.get("field")
        name = request.POST.get("name")

        if username == "":
            data["userinfo"] = "请输入用户名"
            return render(request, '用户端/团队注册.html', data)

        if password == "":
            data["psinfo"] = "请输入密码"
            return render(request, '用户端/团队注册.html', data)

        if field == "":
            data["fdinfo"] = "请输入研究领域"
            return render(request, '用户端/团队注册.html', data)

        if name == "":
            data["ninfo"] = "请输入团队名称"
            return render(request, '用户端/团队注册.html', data)

        users = User.objects.filter(Q(account=username) & Q(is_team=False))
        user = users.first()
        if user is None:
            data["userinfo"] = "该用户不存在"
            return render(request, '用户端/团队注册.html', data)
        if len(password) < 6:
            data["psinfo"] = "密码应不少于六位"
            return render(request, '用户端/团队注册.html', data)

        team = User.objects.filter(Q(account='T_' + username) & Q(is_team=True)).first()
        if team is not None:
            data["userinfo"] = "团队已存在"
            return render(request, "用户端/团队注册.html", data)

        User.objects.create_user(username, password, field, name, user.email,
                                 user.phone_number, user.organization, True)
        return redirect(reverse('app:login'))


def login(request):
    if request.method == "GET":
        data = {
            "title": "登录",
            "msg": ""
        }
        return render(request, '用户端/登录.html', context=data)

    elif request.method == "POST":
        check_box_list = request.POST.getlist('boxes')

        if check_box_list[0] == '个人用户':
            username = request.POST.get("username")
            password = request.POST.get("password")
            user = auth.authenticate(request, user_account=username, password=password, user_type='user')
            if user is not None:
                auth.login(request, user)
                request.session['user_id'] = user.id
                return redirect(reverse('app:personcenter'))
            else:
                print('用户不存在或密码错误')
                return render(request, '用户端/登录.html', {"title": "登录", "msg": "用户名不存在或密码错误！"})
        elif check_box_list[0] == '团队用户':
            username = request.POST.get("username")
            password = request.POST.get("password")
            team = auth.authenticate(request, user_account=username, password=password, user_type='team')
            if team is not None:
                request.session['team_id'] = team.id
                auth.login(request, team)
                return redirect(reverse('app:personcenter2'))
            else:
                print('用户不存在或密码错误')
                # request.session['error_message'] = 'user does not exist'
                return redirect(reverse('app:login'))
        print('用户不存在')
        # request.session['error_message'] = 'user does not exist'
        return redirect(reverse('app:login'))


def logout(request):
    auth.logout(request)
    request.session.flush()
    return redirect(reverse('app:index'))


def checkuser(request):
    username = request.GET.get("username")
    users = User.objects.filter(account=username)
    data = {
        "status": 200,
        "msg": 'user can use'
    }
    if users.exists():
        data['status'] = 901
        data['msg'] = 'user already exist'
    return JsonResponse(data=data)


def checkmanager(request):
    username = request.GET.get("username")
    users = User.objects.filter(account=username)
    data = {
        "status": 200,
        "msg": 'user can use'
    }
    if users.exists():
        data['status'] = 901
        data['msg'] = 'user already exist'
    return JsonResponse(data=data)


def personcenter(request):
    user_id = request.session.get('user_id')
    if user_id is None:
        return render(request, '用户端/登录.html', {"title": "登录"})

    data = {
        'is_login': False,
        'is_personal': True,
    }

    if user_id:
        user = User.objects.get(pk=user_id)
        data['is_login'] = True
        data['username'] = user.account
        data['name'] = user.username
        data['email'] = user.email
        data['field'] = user.research_field
        data['organization'] = user.organization
        data['balance'] = get_balance(user_id=user_id)
        team = User.objects.get_team(user_id=user_id)
        if team is not None:
            data['has_team'] = True
            data['team_balance'] = get_balance(team.id)

    return render(request, '用户端/personal_center.html', context=data)



def personcenter2(request):
    team_id = request.session.get('team_id')
    if team_id is None:
        return render(request, '用户端/登录.html', {"title": "登录"})

    data = {
        'is_login': False,
        'is_team': True,
    }

    if team_id:
        team = User.objects.get(pk=team_id)
        data['is_login'] = True
        data['name'] = team.username
        data['email'] = team.email
        data['field'] = team.research_field
        data['organization'] = team.organization
        data['team_balance'] = get_balance(user_id=team_id)

    return render(request, '用户端/团队中心.html', context=data)


# 信息管理
def personal_info(request):
    user_id = request.session.get('user_id')
    if user_id is None:
        return render(request, '用户端/登录.html', {"title": "登录"})

    data = {
        'is_login': False,
        'is_personal': True,
    }

    if user_id:
        user = User.objects.get(pk=user_id)
        data['is_login'] = True
        data['username'] = user.account
        data['name'] = user.username
        data['email'] = user.email
        data['field'] = user.research_field
        data['organization'] = user.organization
        data['balance'] = get_balance(user_id=user_id)
        team = User.objects.get_team(user_id=user_id)
        if team is not None:
            data['has_team'] = True
            data['team_balance'] = get_balance(team.id)

    return render(request, '用户端/personal_info.html', context=data)


# 团队信息管理
def team_info(request):
    team_id = request.session.get('team_id')
    if team_id is None:
        return render(request, '用户端/登录.html', {"title": "登录"})

    data = {
        'is_login': False,
        'is_team': True,
    }

    if team_id:
        team = User.objects.get(pk=team_id)
        data['is_login'] = True
        data['name'] = team.username
        data['email'] = team.email
        data['field'] = team.research_field
        data['organization'] = team.organization
        data['team_balance'] = get_balance(user_id=team_id)

    return render(request, '用户端/team_info.html', context=data)


def algorithmcall(request):
    team_id = request.session.get('team_id')
    user_id = request.session.get('user_id')
    if user_id is None and team_id is None:
        return render(request, '用户端/登录.html', {"title": "登录"})
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        user = User.objects.get(pk=user_id)
        data['is_login'] = True
        data['is_personal'] = True
        return render(request, '用户端/new.html', data)
    elif team_id:
        team = User.objects.get(pk=team_id)
        data['is_login'] = True
        data['is_team'] = True
        return render(request, '用户端/new.html', data)


def myWorkbench(request, page):
    current_page = int(page)
    team_id = request.session.get('team_id')
    user_id = request.session.get('user_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
        'current': current_page,
        'can_view_forecast': True,
        'can_add_forecast': True,
        'can_view_order': True,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True
        forecast_total = forecast.objects.filter(userid=user_id).count()
        current_forecasts = forecast.objects.filter(userid=user_id)[4 * (current_page - 1):4 * current_page]
    elif team_id:
        user = User.objects.get_manager(user_id=team_id)
        team = User.objects.get(pk=team_id)
        data['is_login'] = True
        data['is_team'] = True
        data['can_add_forecast'] = team.has_perm('app.add_forecast')
        data['can_view_order'] = team.has_perm('app.view_order')
        if not team.has_perm('app.view_forecast'):
            data['can_view_forecast'] = False
            return render(request, '用户端/workbench.html', data)
        forecast_total = forecast.objects.filter(Q(usertype="team") & Q(userid=user.id)).count()
        current_forecasts = forecast.objects \
                                .filter(Q(usertype="team") & Q(userid=user.id))[4 * (current_page - 1):4 * current_page]
    else:
        return render(request, '用户端/登录.html', {"title": "登录"})
    current_page_forecast_num = current_forecasts.count()
    getDatafromForecasts(current_forecasts)
    data['forecasts'] = current_forecasts
    total_pages = int(forecast_total + 3 / 4)
    tpage = np.empty(total_pages, dtype=int)
    for i in range(total_pages):
        tpage[i] = i + 1
    data['num'] = current_page_forecast_num
    data['total'] = tpage
    data['totalnum'] = total_pages
    return render(request, '用户端/workbench.html', data)


def forecast_history(request, page):
    current_page = int(page)
    team_id = request.session.get('team_id')
    user_id = request.session.get('user_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
        'current': current_page,
        'can_view_forecast': True,
        'can_add_forecast': True,
        'can_view_order': True,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True
        forecast_total = forecast.objects.filter(userid=user_id).count()
        current_forecasts = forecast.objects.filter(userid=user_id)[4 * (current_page - 1):4 * current_page]
    elif team_id:
        user = User.objects.get_manager(user_id=team_id)
        team = User.objects.get(pk=team_id)
        data['is_login'] = True
        data['is_team'] = True
        data['can_add_forecast'] = team.has_perm('app.add_forecast')
        data['can_view_order'] = team.has_perm('app.view_order')
        if not team.has_perm('app.view_forecast'):
            data['can_view_forecast'] = False
            return render(request, '用户端/workbench.html', data)
        forecast_total = forecast.objects.filter(Q(usertype="team") & Q(userid=user.id)).count()
        current_forecasts = forecast.objects \
                                .filter(Q(usertype="team") & Q(userid=user.id))[4 * (current_page - 1):4 * current_page]
    else:
        return render(request, '用户端/登录.html', {"title": "登录"})
    current_page_forecast_num = current_forecasts.count()
    getDatafromForecasts(current_forecasts)
    data['forecasts'] = current_forecasts
    total_pages = int(forecast_total + 3 / 4)
    tpage = np.empty(total_pages, dtype=int)
    for i in range(total_pages):
        tpage[i] = i + 1
    data['num'] = current_page_forecast_num
    data['total'] = tpage
    data['totalnum'] = total_pages
    return render(request, '用户端/forecast_history.html', data)


# 批量删除
def forecast_del(request):
    # 页面选中的checkbox的value都在这delslist里面
    check_box_list = request.POST.getlist('delslist')
    for i in check_box_list:
        # 从数据库删除
        forecast.objects.get(id=i).delete()
    # 跳转列表页面
    return redirect('app:forecast_history',1)


def balance_manage(request):
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
        'has_team': True
    }
    user_id = request.session.get('user_id')
    if user_id is None:
        return render(request, '用户端/登录.html', data)
    data['is_login'] = True
    data['is_personal'] = True
    team = User.objects.get_team(user_id=user_id)
    if team is None:
        data['has_team'] = False
    data['balance'] = get_balance(user_id=user_id)
    if request.method == "POST":
        type = request.POST.get('type')
        num = request.POST.get('num')
        if type == '提现':
            num = '-' + num
        data['balance'] = data['balance'] + float(num)
        Balance.objects.filter(user_id=user_id).update(balance=data['balance'])
        return JsonResponse(data={'msg':type+'成功'})
    return render(request,'用户端/balance_manage.html', data)


def dataset_manage(request):
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
        'has_team': True
    }
    user_id = request.session.get('user_id')
    if user_id is None:
        return render(request, '用户端/登录.html', data)
    data['is_login'] = True
    data['is_personal'] = True
    team = User.objects.get_team(user_id=user_id)
    if team is None:
        data['has_team'] = False
    data['datas'] = dataset.objects.filter(userId=user_id)
    return render(request,'用户端/dataset_manage.html', data)


def dataset_add(request):
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
        'has_team': True
    }
    user_id = request.session.get('user_id')
    if user_id is None:
        return render(request, '用户端/登录.html', data)
    data['is_login'] = True
    data['is_personal'] = True
    team = User.objects.get_team(user_id=user_id)
    if team is None:
        data['has_team'] = False
    if request.method == 'GET':
        data['form'] = datasetForm()
    else:
        # 获取表单
        form = datasetForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('app:dataset_manage')
    return render(request,'用户端/dataset_add.html', data)

# 批量删除
def dataset_del(request):
    # 页面选中的checkbox的value都在这delslist里面
    check_box_list = request.POST.getlist('delslist')
    for i in check_box_list:
        # 从数据库删除
        data = dataset.objects.get(id=i)
        # f = forecast.objects.get(dataset=i)
        # al = algorithm.objects.get(id=f.algorithmid)
        # al.delete()
        # f.delete()
        # data.delete()
    # 跳转列表页面
    return redirect('app:dataset_manage')


def personal_info_manage(request):
    user_id = request.session.get('user_id')
    data = {
        'is_login': False,
        'is_personal': True,
    }
    if user_id:
        user = User.objects.get(pk=user_id)
        data['is_login'] = True
        data['username'] = user.account
        data['name'] = user.username
        data['email'] = user.email
        data['field'] = user.research_field
        data['organization'] = user.organization
        data['balance'] = get_balance(user_id=user_id)
        team = User.objects.get_team(user_id=user_id)
        if team is not None:
            data['has_team'] = True
            data['team_balance'] = get_balance(team.id)
    return render(request,'用户端/personal_info_manage.html',data)


def use_algorithm_history(request):
    team_id = request.session.get('team_id')
    user_id = request.session.get('user_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
        'can_view_forecast': True,
        'can_delete_forecast': True,
        'can_run_algorithm': True,
        'can_add_order': True
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True
    elif team_id:
        data['is_login'] = True
        data['is_team'] = True
        team = User.objects.get(pk=team_id)
        if team is None:
            return render(request, '用户端/登录.html', {'title': '登录'})
        data['can_view_forecast'] = team.has_perm('app.view_forecast')
        data['can_delete_forecast'] = team.has_perm('app.delete_forecast')
        data['can_run_algorithm'] = team.has_perm('app.run_algorithm')
        data['can_add_order'] = team.has_perm('app.add_order')
    else:
        return render(request, '用户端/登录.html', context={"title": "登录"})

    all_forecast = forecast.objects.filter(userid=user_id)

    # al_list = []
    # for f in all_forecast:
    #     al = algorithm.objects.get(id=f.algorithmid)
    #     dt = dataset.objects.get(id=f.dataset)
    #     al_info = {
    #         "forecast_name": f.name,
    #         "data_set": dt.name,
    #         "al_id": al.id,
    #         "name": al.name,
    #         "filename": al.filename,
    #     }
    #     al_list.append(al_info)
    #
    # data["al_list"] = al_list
    data["al_list"] = algorithm.objects.filter(id__in=list(all_forecast.values_list('algorithmid', flat=True)))

    return render(request, '用户端/algorithm_history.html', data)


def algorithm_add(request):
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
        'has_team': True
    }
    user_id = request.session.get('user_id')
    if user_id is None:
        return render(request, '用户端/登录.html', data)
    data['is_login'] = True
    data['is_personal'] = True
    team = User.objects.get_team(user_id=user_id)
    if team is None:
        data['has_team'] = False
    if request.method == 'GET':
        data['form'] = algorithmForm()
    else:
        # 获取表单
        form = algorithmForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('app:algorithm_manage')
    return render(request,'用户端/add.html', data)

# 批量删除
def algorithm_del(request):
    # 页面选中的checkbox的value都在这delslist里面
    check_box_list = request.POST.getlist('delslist')
    for i in check_box_list:
        # 从数据库删除
        algorithm.objects.get(id=i).delete()
    # 跳转列表页面
    return redirect('app:algorithm_manage')

def myForecast(request, fid):
    team_id = request.session.get('team_id')
    user_id = request.session.get('user_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
        'can_view_forecast': True,
        'can_delete_forecast': True,
        'can_run_algorithm': True,
        'can_add_order': True
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True
    elif team_id:
        data['is_login'] = True
        data['is_team'] = True
        team = User.objects.get(pk=team_id)
        if team is None:
            return render(request, '用户端/登录.html', {'title': '登录'})
        data['can_view_forecast'] = team.has_perm('app.view_forecast')
        data['can_delete_forecast'] = team.has_perm('app.delete_forecast')
        data['can_run_algorithm'] = team.has_perm('app.run_algorithm')
        data['can_add_order'] = team.has_perm('app.add_order')
    else:
        return render(request, '用户端/登录.html', context={"title": "登录"})

    mf = forecast.objects.get(pk=fid)
    al = algorithm.objects.get(pk=mf.algorithmid)
    dt = dataset.objects.get(pk=mf.dataset)

    data['datax'] = mf.datax
    data['datay'] = mf.datay
    data['fname'] = mf.name
    data['aid'] = mf.algorithmid
    data['para'] = al.parameters.all()
    data['paranum'] = al.parameters.all().count()
    data['aname'] = al.name
    data['multiple'] = al.multiple

    dataset_id = dt.id
    file_path = path.join(dt.filepath, dt.name)
    excel_data = methods.readExcel(file_path)
    numdata = excel_data.to_numpy().T
    columnName = excel_data.columns
    data_index = excel_data.index.map(lambda e: str(e))
    data['dataset'] = {
        "fid": fid,
        "dataid": dataset_id,
        "dataindex": data_index.tolist(),
        'numdata': numdata.tolist(),
        'columnName': columnName.tolist(),
        'indexname': excel_data.index.name
    }
    data['file_path'] = file_path

    if mf.usertype == 'user':
        data['balance'] = get_balance(user_id=user_id)
        data['is_team_forecast'] = False
    elif mf.usertype == 'team':
        data['is_team_forecast'] = True
        if data['is_personal']:
            data['balance'] = get_balance(user_id=user_id, need_team_balance=True)
        else:
            data['balance'] = get_balance(user_id=team_id)

    return render(request, '用户端/forecast.html', data)


def createForecast(request):
    team_id = request.session.get('team_id')
    user_id = request.session.get('user_id')
    al = algorithm.objects.all()
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
        'algorithms': al
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True
        data['has_team'] = User.objects.get_team(user_id=user_id) is not None
        return render(request, '用户端/createForecast.html', data)
    elif team_id:
        data['is_login'] = True
        data['is_team'] = True
        return render(request, '用户端/createForecast.html', data)
    else:
        data = {
            "title": "登录"
        }
        return render(request, '用户端/登录.html', context=data)


def myOrder(request):
    team_id = request.session.get('team_id')
    user_id = request.session.get('user_id')
    data = {
        'is_login': False,
        'is_personal': False,
        'is_team': False,
    }
    if user_id:
        data['is_login'] = True
        data['is_personal'] = True
        orders = OrderHistory.objects.filter(Q(user_id=user_id))
        team = User.objects.get_team(user_id=user_id)
        if team is not None:
            orders = orders.union(OrderHistory.objects.filter(Q(user_id=team.id))).order_by('-create_time')
    elif team_id:
        data['is_login'] = True
        data['is_team'] = True
        orders = OrderHistory.objects.filter(Q(user_id=team_id) & Q(is_team=True)).order_by('-create_time')
    else:
        data = {
            "title": "登录"
        }
        return render(request, '用户端/登录.html', context=data)
    data['orders'] = orders
    for order in orders:
        order.forecast_name = forecast.objects.get(pk=order.forecast_id).name

    return render(request, '用户端/order.html', data)


def userPermissions(request):
    data = {
        'is_login': False,
        'is_personal': False,
    }
    if request.method == "GET":
        user_id = request.session.get('user_id')
        if user_id is None:
            return render(request, '用户端/登录.html', data)
        data['is_login'] = True
        data['is_personal'] = True
        team = User.objects.get_team(user_id=user_id)
        if team is None:
            data['has_team'] = False
            return render(request, '用户端/user_permissions.html', data)
        data['has_team'] = True
        permissions = team.get_all_permissions() & {
            'app.add_forecast', 'app.change_forecast',
            'app.view_forecast', 'app.delete_forecast',
            'app.add_order', 'app.change_order',
            'app.view_order', 'app.delete_order',
            'app.run_algorithm',
        }
        for permission in permissions:
            data[permission.replace('.', '_')] = True
        return render(request, '用户端/user_permissions.html', data)
    elif request.method == "POST":
        user_id = request.session.get('user_id')
        if user_id is None:
            return render(request, '用户端/登录.html', data)
        data['is_login'] = True
        data['is_personal'] = True
        team = User.objects.get_team(user_id=user_id)
        if team is None:
            return myWorkbench(request, 1)
        permissions = json.loads(request.POST.get('permissions'))
        User.objects.set_permissions(permissions, user_id=user_id)
        return JsonResponse({
            'code': 0,
            'msg': 'success',
        })

    return myWorkbench(request, 1)


def getDatafromForecasts(forecasts):
    for f in forecasts:
        d = dataset.objects.filter(pk=f.dataset)
        id_tmp = f.dataset
        path = d[0].filepath + '/' + d[0].name
        data = methods.readExcel(path)
        numdata = data.to_numpy()
        tnumdata = numdata.T
        columnName = data.columns
        data_index = data.index.map(lambda e: str(e))
        f.dataset = {"dataid": id_tmp, "dataindex": data_index.tolist(), 'numdata': tnumdata.tolist(),
                     'columnName': columnName.tolist(), 'indexname': data.index.name}

