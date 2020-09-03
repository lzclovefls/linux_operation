#!/bin/bash

#日志所在文件夹的绝对路径
dir=/www/backup/database

dbname=xiaoshuo            #数据库名称
username=xiaoshuo          #用户名
password=tLeKLXGe8kKTHMhf  #密码

#数据库备份
mysqldump -u${username} -p${password} ${dbname} | xz > ${dir}/${dbname}_$(date +%Y%m%d_%H%M%S).sql.xz

#备份时间
days=30

#找出并删除备份时间之前的文件（防止备份数据占用磁盘空间过大）
find ${dir} -name '*.sql.xz'  -mtime +${days}  -type f  -delete
