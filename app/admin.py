from django.contrib import admin

# Register your models here.
from app import models


class UserAdmin(admin.ModelAdmin):
    list_display = (
        'id', 'account', 'research_field', 'username',
        'email', 'phone_number', 'organization', 'is_team',
        'is_staff', 'is_superuser'
    )
    list_display_links = ('id',)
    list_filter = ('is_team',)
    ordering = ('id',)
    search_fields = ('account',)


class IndexImgAdmin(admin.ModelAdmin):
    list_display = ('id', 'img')
    list_display_links = ('id',)
    ordering = ('id',)


class IndexTextAdmin(admin.ModelAdmin):
    list_display = ('id', 'text')
    list_display_links = ('id',)
    ordering = ('id',)


class SolutionImgAdmin(admin.ModelAdmin):
    list_display = ('id', 'img')
    list_display_links = ('id',)
    ordering = ('id',)


class SolutionTextAdmin(admin.ModelAdmin):
    list_display = ('id', 'text')
    list_display_links = ('id',)
    ordering = ('id',)


class ServiceObjectImgAdmin(admin.ModelAdmin):
    list_display = ('id', 'img')
    list_display_links = ('id',)
    ordering = ('id',)


class ServiceObjectTextAdmin(admin.ModelAdmin):
    list_display = ('id', 'text')
    list_display_links = ('id',)
    ordering = ('id',)


class ParameterAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'description')
    list_display_links = ('id',)
    ordering = ('id',)


class AlgorithmAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'filename')
    list_display_links = ('id',)
    ordering = ('id',)
    filter_horizontal = ('parameters',)


class ForecastAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'userid', 'usertype')
    list_display_links = ('id',)
    ordering = ('id',)


class DatasetAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'filepath', 'userId')
    list_display_links = ('id',)
    ordering = ('id',)


class BalanceAdmin(admin.ModelAdmin):
    list_display = ('id', 'user_id', 'balance')
    list_display_links = ('id',)
    list_editable = ('balance',)


class OrderHistoryAdmin(admin.ModelAdmin):
    list_display = ('id', 'forecast_id', 'user_id', 'price', 'count', 'time', 'is_buy', 'is_team')
    list_display_links = ('id',)
    ordering = ('-create_time',)


admin.site.register(models.User, UserAdmin)
admin.site.register(models.index_text, IndexTextAdmin)
admin.site.register(models.index_img, IndexImgAdmin)
admin.site.register(models.solution_text, SolutionTextAdmin)
admin.site.register(models.solution_img, SolutionImgAdmin)
admin.site.register(models.serviceobject_img, ServiceObjectImgAdmin)
admin.site.register(models.serviceobject_text, ServiceObjectTextAdmin)
admin.site.register(models.agri_img)
admin.site.register(models.consultant_content_img)
admin.site.register(models.training_courses_img)
admin.site.register(models.database_img)
admin.site.register(models.simulation_platform_img)
admin.site.register(models.produce_img)
admin.site.register(models.algorithm, AlgorithmAdmin)
admin.site.register(models.dataset, DatasetAdmin)
admin.site.register(models.forecast, ForecastAdmin)
admin.site.register(models.parameter, ParameterAdmin)
admin.site.register(models.Balance, BalanceAdmin)
admin.site.register(models.OrderHistory, OrderHistoryAdmin)

admin.site.site_header = '经济预测系统平台后台管理系统'
admin.site.site_title = '后台管理系统'
