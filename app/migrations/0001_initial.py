# Generated by Django 4.1.7 on 2023-04-17 09:57

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ("auth", "0012_alter_user_first_name_max_length"),
    ]

    operations = [
        migrations.CreateModel(
            name="agri_img",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("img", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "图片管理",
                "verbose_name_plural": "图片管理",
            },
        ),
        migrations.CreateModel(
            name="Balance",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("user_id", models.IntegerField(verbose_name="用户ID")),
                (
                    "balance",
                    models.DecimalField(
                        decimal_places=2, default=0.0, max_digits=10, verbose_name="余额"
                    ),
                ),
                (
                    "update_time",
                    models.DateTimeField(auto_now=True, verbose_name="修改时间"),
                ),
                (
                    "create_time",
                    models.DateTimeField(auto_now_add=True, verbose_name="创建时间"),
                ),
            ],
            options={
                "verbose_name": "余额",
                "verbose_name_plural": "余额",
            },
        ),
        migrations.CreateModel(
            name="consultant_content_img",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("img", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "图片管理",
                "verbose_name_plural": "图片管理",
            },
        ),
        migrations.CreateModel(
            name="database_img",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("img", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "图片管理",
                "verbose_name_plural": "图片管理",
            },
        ),
        migrations.CreateModel(
            name="dataset",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=255)),
                ("usertype", models.CharField(max_length=127)),
                ("userId", models.IntegerField()),
                ("filepath", models.CharField(max_length=255, null=True)),
            ],
            options={
                "verbose_name": "数据",
                "verbose_name_plural": "数据",
            },
        ),
        migrations.CreateModel(
            name="forecast",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=255)),
                ("algorithmid", models.IntegerField(null=True)),
                ("dataset", models.IntegerField(null=True)),
                ("usertype", models.CharField(default="user", max_length=255)),
                ("userid", models.IntegerField(null=True)),
                ("model", models.CharField(max_length=255, null=True)),
                ("datax", models.CharField(max_length=255, null=True)),
                ("datay", models.CharField(max_length=255, null=True)),
            ],
            options={
                "verbose_name": "预测实例",
                "verbose_name_plural": "预测实例",
            },
        ),
        migrations.CreateModel(
            name="index_img",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("img", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "图片管理",
                "verbose_name_plural": "图片管理",
            },
        ),
        migrations.CreateModel(
            name="index_text",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("text", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "文字管理",
                "verbose_name_plural": "文字管理",
            },
        ),
        migrations.CreateModel(
            name="OrderHistory",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("forecast_id", models.IntegerField(verbose_name="预测实例ID")),
                ("user_id", models.IntegerField(verbose_name="用户ID")),
                ("is_buy", models.BooleanField(default=True, verbose_name="是否为买入")),
                (
                    "price",
                    models.DecimalField(
                        decimal_places=2, max_digits=10, verbose_name="价格"
                    ),
                ),
                ("time", models.CharField(max_length=127, verbose_name="时间")),
                ("count", models.IntegerField(verbose_name="交易数")),
                ("is_team", models.BooleanField(default=False, verbose_name="是否为团队")),
                (
                    "create_time",
                    models.DateTimeField(auto_now_add=True, verbose_name="交易时间"),
                ),
            ],
            options={
                "verbose_name": "订单历史",
                "verbose_name_plural": "订单历史",
            },
        ),
        migrations.CreateModel(
            name="parameter",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=255)),
                ("description", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "参数",
                "verbose_name_plural": "参数",
            },
        ),
        migrations.CreateModel(
            name="produce_img",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("img", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "图片管理",
                "verbose_name_plural": "图片管理",
            },
        ),
        migrations.CreateModel(
            name="serviceobject_img",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("img", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "图片管理",
                "verbose_name_plural": "图片管理",
            },
        ),
        migrations.CreateModel(
            name="serviceobject_text",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("text", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "文字管理",
                "verbose_name_plural": "文字管理",
            },
        ),
        migrations.CreateModel(
            name="simulation_platform_img",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("img", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "图片管理",
                "verbose_name_plural": "图片管理",
            },
        ),
        migrations.CreateModel(
            name="solution_img",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("img", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "图片管理",
                "verbose_name_plural": "图片管理",
            },
        ),
        migrations.CreateModel(
            name="solution_text",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("text", models.CharField(max_length=511)),
            ],
            options={
                "verbose_name": "文字管理",
                "verbose_name_plural": "文字管理",
            },
        ),
        migrations.CreateModel(
            name="teammember_img",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("img", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "图片管理",
                "verbose_name_plural": "图片管理",
            },
        ),
        migrations.CreateModel(
            name="training_courses_img",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("img", models.CharField(max_length=255)),
            ],
            options={
                "verbose_name": "图片管理",
                "verbose_name_plural": "图片管理",
            },
        ),
        migrations.CreateModel(
            name="algorithm",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("name", models.CharField(max_length=63)),
                ("filename", models.CharField(max_length=255)),
                ("multiple", models.BooleanField(default=False)),
                (
                    "parameters",
                    models.ManyToManyField(blank=True, null=True, to="app.parameter"),
                ),
            ],
            options={
                "verbose_name": "算法",
                "verbose_name_plural": "算法",
            },
        ),
        migrations.CreateModel(
            name="User",
            fields=[
                (
                    "id",
                    models.AutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("password", models.CharField(max_length=128, verbose_name="password")),
                (
                    "last_login",
                    models.DateTimeField(
                        blank=True, null=True, verbose_name="last login"
                    ),
                ),
                (
                    "is_superuser",
                    models.BooleanField(
                        default=False,
                        help_text="Designates that this user has all permissions without explicitly assigning them.",
                        verbose_name="superuser status",
                    ),
                ),
                (
                    "account",
                    models.CharField(max_length=25, unique=True, verbose_name="帐户名"),
                ),
                (
                    "research_field",
                    models.CharField(max_length=20, verbose_name="研究领域"),
                ),
                ("username", models.CharField(max_length=20, verbose_name="用户名")),
                ("email", models.CharField(max_length=50, verbose_name="邮箱")),
                ("phone_number", models.CharField(max_length=20, verbose_name="手机号")),
                ("organization", models.CharField(max_length=50, verbose_name="组织")),
                ("is_team", models.BooleanField(default=False, verbose_name="是否团队用户")),
                ("is_staff", models.BooleanField(default=False, verbose_name="是否管理员")),
                (
                    "groups",
                    models.ManyToManyField(
                        blank=True,
                        help_text="The groups this user belongs to. A user will get all permissions granted to each of their groups.",
                        related_name="user_set",
                        related_query_name="user",
                        to="auth.group",
                        verbose_name="groups",
                    ),
                ),
                (
                    "user_permissions",
                    models.ManyToManyField(
                        blank=True,
                        help_text="Specific permissions for this user.",
                        related_name="user_set",
                        related_query_name="user",
                        to="auth.permission",
                        verbose_name="user permissions",
                    ),
                ),
            ],
            options={
                "verbose_name": "帐户",
                "verbose_name_plural": "帐户",
                "permissions": (("run_algorithm", "运行算法"),),
            },
        ),
    ]
