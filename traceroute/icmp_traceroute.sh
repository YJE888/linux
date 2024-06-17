## icmp를 사용하여 8.8.8.8 로의 경로 추적 후 일자별로 로그 쌓기
#!/bin/bash

today=`date +%y%m%d`
TIME=`date +%r`
FILE="/home/vps/icmp/${today}.txt"

if [ ! -e ${FILE} ]; then
    touch ${FILE}
    echo >> ${FILE}
    echo ${TIME} >> ${FILE}
    sudo traceroute -I  8.8.8.8 >> ${FILE}
else
    echo >> ${FILE}
    echo ${TIME} >> ${FILE}
    sudo traceroute -I  8.8.8.8 >> ${FILE}
fi

exit 0
