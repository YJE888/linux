## udp를 사용하여 8.8.8.8로의 경로 추적 후 일자별로 로그 쌓기
#!/bin/bash

today=`date +%y%m%d`
TIME=`date +%r`
FILE="/home/vps/udp/${today}.txt"

if [ ! -e ${FILE} ]; then
    touch ${FILE}
    echo >> ${FILE}
    echo ${TIME} >> ${FILE}
    sudo traceroute -w 1.0 -m 10  8.8.8.8 >> ${FILE}
else
    echo >> ${FILE}
    echo ${TIME} >> ${FILE}
    sudo traceroute -w 1.0 -m 10  8.8.8.8 >> ${FILE}
fi

exit 0
