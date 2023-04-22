#!/bin/bash

CRON_FILE=${PWD}/backup.cron
CRON_COMMAND="0 0 * * * source ${PWD}/backup_full.sh"

if [ ! -f ${CRON_FILE} ]
then
  echo '创建配置文件'
  echo "${CRON_COMMAND}" > ${CRON_FILE}
fi

crontab ${CRON_FILE}
echo '定时任务注册完成'
