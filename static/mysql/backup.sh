#!/bin/bash

source conf.sh
source backup_func.sh

if [ ! -d ${BACKUP_DIR} ]
then
  mkdir -p ${BACKUP_DIR}
fi

if [ ! -d ${BACKUP_FULL_DIR} ]
then
  mkdir -p ${BACKUP_FULL_DIR}
fi

if [ ! -d ${BACKUP_USER_DIR} ]
then mkdir -p ${BACKUP_USER_DIR}
fi

if [ ! -d ${BACKUP_ALGORITHM_DIR} ]
then mkdir -p ${BACKUP_ALGORITHM_DIR}
fi

echo 请选择：
echo 1. 备份
echo 2. 恢复
read -p '请输入你的选择：' i

if [ $i == 1 ]
then
  echo 1. 全量备份
  echo 2. 用户数据备份
  echo 3. 算法数据备份
  read -p '请输入你的选择：' j
  if [ $j == 1 ]
  then
    backupFull
  elif [ $j == 2 ]
  then
    backupUser
  else
    backupAlgorithm
  fi
  exit 0
elif [ $i != 2 ]
then
  echo '未知选项'
  exit 0
fi

echo 1. 全量恢复
echo 2. 用户数据恢复
echo 3. 算法数据恢复
read -p '请输入你的选择：' k

if [ $k == 1 ]
then
  ls ${BACKUP_FULL_DIR}
  read -p '请输入文件名：' f
  recover '全量数据恢复' ${BACKUP_FULL_DIR}/${f}
elif [ $k == 2 ]
then
  ls ${BACKUP_USER_DIR}
  read -p '请输入文件名：' f
  recover '用户数据恢复' ${BACKUP_USER_DIR}/${f}
elif [ $k == 3 ]
then
  ls ${BACKUP_ALGORITHM_DIR}
  read -p '请输入文件名：' f
  recover '算法数据恢复' ${BACKUP_ALGORITHM_DIR}/${f}
else
  echo '未知选项'
  return
fi
