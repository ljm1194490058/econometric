#!/bin/bash

log() {
  echo "${TIME}------${1}, 文件：${2}" >> ${BACKUP_LOG_DIR}/${DATE}.log
}

backupFull() {
  FILE=${BACKUP_FULL_DIR}/${DATE}.sql
  echo --------${FILE} BEGIN--------
  mysqldump -u${USER} -p${PASSWD} --default-character-set=utf8 -q --lock-all-tables\
    --flush-logs -E -R --triggers -B ${SCHEMA} > ${FILE}
  echo --------${FILE} DONE---------
  log '全量备份完成' ${FILE}
}

backupUser() {
  FILE=${BACKUP_USER_DIR}/${DATE}.sql
  echo --------${FILE} BEGIN--------
  mysqldump -u${USER} -p${PASSWD} --default-character-set=utf8\
    ${SCHEMA} ${USER_TABLE_LIST[@]} > ${FILE}
  echo --------${FILE} DONE---------
  log '用户数据备份完成' ${FILE}
}

backupAlgorithm() {
  FILE=${BACKUP_ALGORITHM_DIR}/${DATE}.sql
  echo --------${FILE} BEGIN--------
  mysqldump -u${USER} -p${PASSWD} --default-character-set=utf8\
    ${SCHEMA} ${ALGORITHM_TABLE_LIST[@]} > ${FILE}
  echo --------${FILE} DONE---------
  log '算法数据备份完成' ${FILE}
}

recover() {
  if [ ! -f ${2} ]
  then
    echo ${2}'文件不存在'
    return
  fi
  echo --------recover from ${2} BEGIN--------
  mysql -u${USER} -p${PASSWD} ${SCHEMA} < ${2}
  echo --------recover from ${2} DONE---------
  log ${1} ${2}
}
