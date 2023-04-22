#!/bin/bash

BASE_DIR=/home/z217/econometric/static/mysql
BACKUP_LOG_DIR=${BASE_DIR}/logs
BACKUP_DIR=${BASE_DIR}/backup
BACKUP_FULL_DIR=${BACKUP_DIR}/full
BACKUP_USER_DIR=${BACKUP_DIR}/user
BACKUP_ALGORITHM_DIR=${BACKUP_DIR}/algorithm

DATE=$(date +%Y%m%d)
TIME=$(date +%H:%M:%s)

SCHEMA=econometric
USER=root
PASSWD=******

USER_TABLE_LIST=(\
  'app_user' 'auth_group' 'auth_group_permissions'\
  'auth_permission' 'auth_user' 'app_balance' 'app_orderhistory'\
  'auth_user_groups' 'auth_user_user_permissions' 'django_admin_log' 'django_content_type'\
  'auth_group' 'auth_group_permissions' 'auth_permissions'
)

ALGORITHM_TABLE_LIST=(\
  'app_parameter' 'app_algorithm' 'app_forecast' 'app_dataset'\
)

