#/bin/bash

#+++++++++++++++++++++++++++++++++
#author : lzc
#+++++++++++++++++++++++++++++++++
#create_time : 2018-12-11 
#+++++++++++++++++++++++++++++++++
#action : Shortcut command usin
#+++++++++++++++++++++++++++++++++


#设置提示信息

tip='    p    报告当前系统的进程状态。

    n    打印Linux中网络系统的状态信息

    f    显示当前系统内存和交换区的使用情况

    q    安全退出命令'

#添加换行函数
line(){

    echo -e  "\n";
}

#添加命令处理函数
judge(){

    while true
    do   
        echo -e '\n'
        read -p "请输入命令名称（输入？获取帮助信息）："  a 

        case $a in

            '?')
                line
                echo -e  "$tip"

            ;;

            p)
                line 
                read -p "请输入要查找的字符串：" b 
                if [ -n $b ]
                then
                    c=$(echo "$b"|sed 's/^ //g'|sed 's/ $//g')
                    ps aux | egrep --color=auto  "$c"
                fi 
            ;;

            n) 
                line
                netstat  -nltup 
            ;;

            f) 
                line
                free  -h
            ;;

            q) 
                line
                echo -e '安全退出！';break
            ;;

            *) 
                line
                echo -e '请输入准确的命令字符'
            ;;
        esac
       
    done
}

#执行函数
judge







