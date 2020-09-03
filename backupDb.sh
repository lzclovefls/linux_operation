#!/bin/bash

#备份所在文件夹的绝对路径
dir=/www/backup/database

dbname=xiaoshuo            #数据库名称
username=xiaoshuo          #用户名
password=tLeKLXGe8kKTHMhf  #密码

#对应数据库备份所在文件夹路径
backup_dir=${backup_dir}/${dbnmae}

#判断如果该目录不存在就递归创建
if [ ! -d "$backup_dir" ]
then
    mkdir -p  "$backup_dir"
fi

#数据库备份
mysqldump -u${username} -p${password} ${dbname} | xz > ${backup_dir}/$(date +%Y%m%d_%H%M%S).sql.xz

#备份时间
days=30

#找出并删除备份时间之前的文件（防止备份数据占用磁盘空间过大）
find ${backup_dir} -name '*.sql.xz'  -mtime +${days}  -type f  -delete
