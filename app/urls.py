from django.urls import path, re_path

from app import views

app_name = 'app'

urlpatterns = [
    # 首页
    path(r'', views.index, name='index'),

    # 关于我们
    path(r'aboutus/', views.service, name='aboutus'),
    # 关于我们文件夹
    path(r'companyculture/', views.companyculture, name='companyculture'),
    path(r'media/', views.media, name='media'),
    path(r'serviceobject/', views.serviceobject, name='serviceobject'),

    # 团队成员
    path(r'teammember/', views.teammember, name='teammember'),
    # 团队成员文件夹
    path(r'business_team/', views.business_team, name='business_team'),
    path(r'consultant_content/', views.consultant_content, name='consultant_content'),

    # 解决方案
    path(r'solution/', views.solution, name='solution'),
    # 解决方案文件夹
    path(r'agri/', views.agri, name='agri'),
    path(r'disaster/', views.disaster, name='disaster'),
    path(r'env/', views.env, name='env'),
    path(r'finance/', views.finance, name='finance'),
    path(r'labor/', views.labor, name='labor'),
    path(r'poverty/', views.poverty, name='poverty'),
    path(r'source/', views.source, name='source'),
    path(r'trade/', views.trade, name='trade'),

    # 产品系列
    path(r'produce/', views.produce, name='produce'),
    # 产品系列文件夹
    path(r'simulation/', views.simulation, name='simulation'),
    path(r'simulation_platform/', views.simulation_platform, name='simulation_platform'),
    path(r'training_courses/', views.training_courses, name='training_courses'),
    path(r'database/', views.database, name='database'),
    path(r'research_report/', views.research_report, name='research_report'),
    path(r'peixun/', views.peixun, name='peixun'),
    path(r'xinwen/', views.xinwen, name='xinwen'),
    path(r'yanjiubaogao2/', views.yaniubaoao2, name='yanjiubaogao2'),
    path(r'yanjiubaogao3/', views.yaniubaoao3, name='yanjiubaogao3'),
    path(r'yanjiubaogao4/', views.yaniubaoao4, name='yanjiubaogao4'),
    path(r'yanjiubaogao5/', views.yaniubaoao5, name='yanjiubaogao5'),
    path(r'yanjiubaogao6/', views.yaniubaoao6, name='yanjiubaogao6'),
    path(r'yanjiubaogao7/', views.yaniubaoao7, name='yanjiubaogao7'),
    path(r'yanjiubaogao8/', views.yaniubaoao8, name='yanjiubaogao8'),
    path(r'ziliao/', views.ziliao, name='ziliao'),
    path(r'ruanjian/', views.ruanjian, name='ruanjian'),

    # 人才招聘
    path(r'recruitment/', views.recruitment, name='recruitment'),

    # 联系我们
    path(r'contactus/', views.contactus, name='contactus'),

    path(r'registerinfo/', views.registerinfo, name='registerinfo'),
    path(r'zhangmu/', views.zhangmu, name='zhangmu'),
    path(r'algorithm/', views.algorithm, name='algorithm'),
    path(r'userinfo/', views.userinfo, name='userinfo'),
    path(r'algorithmusage/', views.algorithmusage, name='algorithmusage'),
    path(r'price/', views.price, name='price'),

    path(r'register/',views.register, name='register'),
    path(r'register2/', views.register2, name='register2'),
    path(r'login/',views.login, name='login'),
    path(r'logout/', views.logout, name='logout'),
    path(r'checkuser/', views.checkuser, name='checkuser'),
    path(r'checkmanager/', views.checkmanager, name='checkmanager'),
    path(r'personcenter/', views.personcenter, name='personcenter'),
    path(r'personcenter2/', views.personcenter2, name='personcenter2'),
    path(r'personal_info/', views.personal_info, name='personal_info'),
    path(r'team_info/', views.team_info, name='team_info'),

    path(r'algorithmcall/', views.algorithmcall, name='algorithmcall'),
    re_path(r'^myWorkbench/(?P<page>\d+)', views.myWorkbench, name='myWorkbench'),
    re_path(r'^forecast_history/(?P<page>\d+)', views.forecast_history, name='forecast_history'),
    re_path(r'^myForecast/(?P<fid>\d+)', views.myForecast, name='myForecast'),
    path(r'forecast_del/', views.forecast_del, name='forecast_del'),
    path(r'createForecastPage/', views.createForecast, name='createForecast'),
    path(r'algorithm_history/', views.use_algorithm_history, name='algorithm_history'),
    path(r'algorithm_add/',views.algorithm_add,name='algorithm_add'),
    path(r'algorithm_del/',views.algorithm_del,name='algorithm_del'),
    path(r'personal_info_manage/',views.personal_info_manage,name='personal_info_manage'),
    path(r'balance_manage/',views.balance_manage,name='balance_manage'),
    path(r'dataset_manage/',views.dataset_manage,name='dataset_manage'),
    path(r'dataset_add/',views.dataset_add,name='dataset_add'),
    path(r'dataset_del/',views.dataset_del,name='dataset_del'),

    path(r'myOrder/', views.myOrder, name='myOrder'),
    path(r'userPermissions/', views.userPermissions, name='userPermissions'),
]
