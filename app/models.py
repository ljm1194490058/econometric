# Create your models here.
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, Permission
from django.contrib.auth.hashers import make_password
from django.db import models
from django.db.models import Q


class User(AbstractBaseUser, PermissionsMixin):
    # 用户账号，要唯一，团队账户要求是已注册的用户账户，并且在进入数据库前会添加前缀T_加以区分
    account = models.CharField(verbose_name='帐户名', max_length=25, unique=True)
    # 研究领域
    research_field = models.CharField(verbose_name='研究领域', max_length=20)
    # 姓名
    username = models.CharField(verbose_name='用户名', max_length=20)
    # email
    email = models.CharField(verbose_name='邮箱', max_length=50)
    # 手机号
    phone_number = models.CharField(verbose_name='手机号', max_length=20)
    # 隶属组织
    organization = models.CharField(verbose_name='组织', max_length=50)
    # 用户类型, 1为团队账户
    is_team = models.BooleanField(verbose_name='是否团队用户', default=False)
    # 是否可以访问管理站点
    is_staff = models.BooleanField(verbose_name='是否管理员', default=False)

    is_anonymous = False
    is_authenticated = True
    REQUIRED_FIELDS = [
        'password', 'research_field', 'username',
        'email', 'phone_number', 'organization'
    ]
    USERNAME_FIELD = 'account'
    EMAIL_FIELD = 'email'

    # @classmethod
    # def createuser(cls,account,passwd,name,phone,address,img,rank,token):
    #     u = cls(userAccount = account,userPasswd = passwd,userName=name,userPhone=phone,userAdderss=address,userImg=img,userRank=rank,userToken=token)
    #     return u
    class Meta:
        verbose_name = "帐户"
        verbose_name_plural = verbose_name
        permissions = (
            ('run_algorithm', '运行算法'),
        )

    class AppUserManager(BaseUserManager):
        def create_user(self, account, password, research_field, username, email,
                        phone_number, organization, is_team=False, is_staff=False):
            user = User()
            if is_team is not True:
                user.account = account
            else:
                user.account = 'T_' + account
            user.password = make_password(password)
            user.research_field = research_field
            user.username = username
            user.email = email
            user.phone_number = phone_number
            user.organization = organization
            user.is_team = is_team
            user.is_staff = is_staff
            user.save()
            user.user_permissions.set([
                85, 86, 87, 88, 89, 90, 91,
                92, 101, 102, 103, 104, 122
            ])

        def create_superuser(self, account, password, research_field, username, email, phone_number, organization):
            user = User()
            user.account = account
            user.password = make_password(password)
            user.research_field = research_field
            user.username = username
            user.email = email
            user.phone_number = phone_number
            user.organization = organization
            user.is_team = False
            user.is_staff = True
            user.is_superuser = True
            user.save()
            for m in Permission.objects.all().values('id'):
                user.user_permissions.add(m['id'])

        def get_manager(self, user_id=None, account=None, team=None):
            if user_id is not None:
                team = User.objects.get(pk=user_id)
                if team.is_team is False:
                    return team
                return User.objects.filter(Q(account=team.account[2:]) & Q(is_team=False)).first()
            elif account is not None:
                return User.objects.filter(Q(account=account[2:]) & Q(is_team=False))
            elif team is not None:
                return User.objects.filter(Q(account=team.account[2:]) & Q(is_team=False))
            return None

        def get_team(self, user_id=None, account=None, user=None):
            if account is not None:
                return User.objects.filter(Q(account='T_' + account) & Q(is_team=True)).first()
            elif user is not None:
                return User.objects.filter(Q(account='T_' + user.account) & Q(is_team=True)).first()
            elif user_id is not None:
                user = User.objects.get(pk=user_id)
                return User.objects.filter(Q(account='T_' + user.account) & Q(is_team=True)).first()
            return None

        def set_permissions(self, permissions=None, user_id=None, account=None, user=None):
            if permissions is None:
                permissions = []
            team = self.get_team(user_id, account, user)
            if team is None:
                return
            permission_id_list = []
            for permission in permissions:
                permission_id_list.append(Permission.objects.filter(codename=permission[4:]).first().id)
            team.user_permissions.set(permission_id_list)

    objects = AppUserManager()


#
# class Team(models.Model):
#     # 负责人账号，要唯一，负责人是已经注册的用户
#     managerAccount = models.CharField(max_length=20, unique=True, default="")
#     # 密码
#     teamPasswd = models.CharField(max_length=200)
#     # 研究领域
#     teamField = models.CharField(max_length=20, default="")
#     # 小组姓名
#     teamName = models.CharField(max_length=20, default="")
#     # 负责人姓名
#     managerName = models.CharField(max_length=20, default="")
#     # 负责人email
#     managerEmail = models.CharField(max_length=50, default="")
#     # 负责人手机号
#     managerPhone = models.CharField(max_length=20, default="")
#     # 负责人隶属组织
#     managerOrganization = models.CharField(max_length=50, default="")
#
#     class Meta:
#         verbose_name = "团队账户"
#         verbose_name_plural = verbose_name


class solution_img(models.Model):
    img = models.CharField(max_length=255)

    class Meta:
        verbose_name = "图片管理"
        verbose_name_plural = verbose_name


class solution_text(models.Model):
    text = models.CharField(max_length=511)

    class Meta:
        verbose_name = "文字管理"
        verbose_name_plural = verbose_name


class agri_img(models.Model):
    img = models.CharField(max_length=255)

    class Meta:
        verbose_name = "图片管理"
        verbose_name_plural = verbose_name


class simulation_platform_img(models.Model):
    img = models.CharField(max_length=255)

    class Meta:
        verbose_name = "图片管理"
        verbose_name_plural = verbose_name


class training_courses_img(models.Model):
    img = models.CharField(max_length=255)

    class Meta:
        verbose_name = "图片管理"
        verbose_name_plural = verbose_name


class database_img(models.Model):
    img = models.CharField(max_length=255)

    class Meta:
        verbose_name = "图片管理"
        verbose_name_plural = verbose_name


class teammember_img(models.Model):
    img = models.CharField(max_length=255)

    class Meta:
        verbose_name = "图片管理"
        verbose_name_plural = verbose_name


class consultant_content_img(models.Model):
    img = models.CharField(max_length=255)

    class Meta:
        verbose_name = "图片管理"
        verbose_name_plural = verbose_name


# 首页
class index_text(models.Model):
    text = models.CharField(max_length=255)

    class Meta:
        verbose_name = "文字管理"
        verbose_name_plural = verbose_name


class index_img(models.Model):
    img = models.CharField(max_length=255)

    class Meta:
        verbose_name = "图片管理"
        verbose_name_plural = verbose_name


# 服务对象
class serviceobject_img(models.Model):
    img = models.CharField(max_length=255)

    class Meta:
        verbose_name = "图片管理"
        verbose_name_plural = verbose_name


class serviceobject_text(models.Model):
    text = models.CharField(max_length=255)

    class Meta:
        verbose_name = "文字管理"
        verbose_name_plural = verbose_name


# produce
class produce_img(models.Model):
    img = models.CharField(max_length=255)

    class Meta:
        verbose_name = "图片管理"
        verbose_name_plural = verbose_name


class parameter(models.Model):
    name = models.CharField(max_length=255)
    description = models.CharField(max_length=255)

    class Meta:
        verbose_name = "参数"
        verbose_name_plural = verbose_name

    def __str__(self):
        return "%s" % (self.name)


class algorithm(models.Model):
    # 名称
    name = models.CharField(max_length=63)
    # 文件名
    filename = models.CharField(max_length=255)
    # 参数
    parameters = models.ManyToManyField(parameter, null=True, blank=True)
    # 单项多项
    multiple = models.BooleanField(default=False)

    class Meta:
        verbose_name = "算法"
        verbose_name_plural = verbose_name


class forecast(models.Model):
    name = models.CharField(max_length=255)
    algorithmid = models.IntegerField(null=True)
    # parameter = models.CharField(max_length=1023,null=True)
    dataset = models.IntegerField(null=True)
    usertype = models.CharField(max_length=255, default='user')
    userid = models.IntegerField(null=True)
    model = models.CharField(null=True, max_length=255)
    datax = models.CharField(null=True, max_length=255)
    datay = models.CharField(null=True, max_length=255)

    class Meta:
        verbose_name = "预测实例"
        verbose_name_plural = verbose_name


class dataset(models.Model):
    name = models.CharField(max_length=255)
    usertype = models.CharField(max_length=127)
    userId = models.IntegerField(null=False)
    filepath = models.CharField(max_length=255, null=True)

    class Meta:
        verbose_name = "数据"
        verbose_name_plural = verbose_name


class Balance(models.Model):
    user_id = models.IntegerField(verbose_name='用户ID')
    balance = models.DecimalField(verbose_name='余额', max_digits=10, decimal_places=2, default=0.0)
    update_time = models.DateTimeField(verbose_name='修改时间', auto_now=True)
    create_time = models.DateTimeField(verbose_name='创建时间', auto_now_add=True)

    class Meta:
        verbose_name = '余额'
        verbose_name_plural = verbose_name


class OrderHistory(models.Model):
    forecast_id = models.IntegerField(verbose_name='预测实例ID')
    user_id = models.IntegerField(verbose_name='用户ID')
    is_buy = models.BooleanField(verbose_name='是否为买入', default=True)
    price = models.DecimalField(verbose_name='价格', max_digits=10, decimal_places=2)
    time = models.CharField(verbose_name='时间', max_length=127)  # TODO: 改成DateTime
    count = models.IntegerField(verbose_name='交易数')
    is_team = models.BooleanField(verbose_name='是否为团队', default=False)
    create_time = models.DateTimeField(verbose_name='交易时间', auto_now_add=True)

    forecast_name = ''

    class Meta:
        verbose_name = "订单历史"
        verbose_name_plural = verbose_name
