#/bin/bash

#+++++++++++++++++++++++++++++++++
#author : lzc
#+++++++++++++++++++++++++++++++++
#create_time : 2018-12-11 
#+++++++++++++++++++++++++++++++++
#action : Shortcut command usin
#+++++++++++++++++++++++++++++++++


#获取操作命令
read -p '\n\n请先输入命令首字母:' a 

case $a in
    p) 
    read -p "\n\n请输入要查找的字符串:" b 
    if [ -n $b ]
    then
        c=$(echo "$b"|sed 's/^ //g'|sed 's/ $//g')
        ps aux | egrep --color=auto  "$c"
    fi 
    ;;
    n) netstat  -nltup 
    ;;
esac
