# Generated by Django 4.1.7 on 2023-04-21 07:18

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='index_img',
            options={'verbose_name': '图片管理1', 'verbose_name_plural': '图片管理1'},
        ),
        migrations.AlterModelOptions(
            name='index_text',
            options={'verbose_name': '文字管理1', 'verbose_name_plural': '文字管理1'},
        ),
    ]