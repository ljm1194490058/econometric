from django.contrib.auth import get_user_model
from django.contrib.auth.backends import BaseBackend
from django.contrib.auth.hashers import check_password
from django.db.models import Q

User = get_user_model()


class AppAuthBackend(BaseBackend):
    def authenticate(self, request, user_account='', password='', user_type=''):
        if user_type == 'user':
            user = User.objects.filter(Q(account=user_account) & Q(is_team=False)).first()
            if user is not None and check_password(password, user.password):
                return user
        elif user_type == 'team':
            team = User.objects.filter(Q(account='T_'+user_account) & Q(is_team=True)).first()
            if team is not None and check_password(password, team.password):
                return team
        return None

    def get_user(self, user_id):
        return User.objects.get(pk=user_id)
