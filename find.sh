#!/bin/bash


#要查找的目录（默认为当前目录）
path=$1;
#要查找的内容
content=$2;

function getdir(){

    for element in `ls $1`
    do  
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then 
            getdir $dir_or_file $2
        else
            
            #查找文件内容是否包含某个字符串
            grep $2 $dir_or_file > a.txt  2>/dev/null;
        
            if [ -s a.txt ]
            then
                echo $dir_or_file;
            fi
        fi  
    done
    
    return ;

}

getdir $path $content;

