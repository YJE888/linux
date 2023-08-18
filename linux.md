# linux

#### ip link
- 인터페이스 상태 확인 및 인터페이스 up 
  ```
  ip link
  ip link set dev eth0 up
  ```
#### default route 설정
  ```
  $ route -n
  Kernel IP routing table
  Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
  10.10.100.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
  10.10.101.0     0.0.0.0         255.255.255.0   U     0      0        0 eth1
  
  $ ip route add default via 10.10.100.1
  
  $ ip route 
  default via 10.10.100.1 dev eth0
  ...
  
  $ route -n
  Kernel IP routing table
  Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
  0.0.0.0         10.10.100.1     0.0.0.0         UG    0      0        0 eth0
  10.10.100.0     0.0.0.0         255.255.255.0   U     0      0        0 eth0
  10.10.101.0     0.0.0.0         255.255.255.0   U     0      0        0 eth1
  ```
### zcat
- `zcat`은 압축된 파일의 내용을 화면에 출력하는 명령어로 `.gz` 확장자를 가진 gzip으로 압축된 파일의 내용을 보여줌
  ```
  $ zcat example.log.gz
  ```
### tar
- 원하는 위치에 압축을 해제하는 방법
  ```
  tar xzvf 압축파일명.tar.gz -C 원하는_경로
  ```
- 원하는
  ```
  tar -czvf 압축파일명.tar.gz 압축할_디렉토리
  ```
### cronjob
- /usr/local/bin/last-reboot.sh을 매월 1일 오전 6시에 실행되게끔 설정
  ```
  $ crontab -e
  # 분 시 일 월 요일
  0 6 1 * * /usr/local/bin/last-reboot.sh
  ```
- /usr/local/bin/system-debugger.sh을 0분과 30분에(30분마다) 실행되게끔 설정   
  (ex) 09:00, 09:30, 10:00, 10:30...
  ```
  # 방법 1)
  00,30 * * * * /usr/local/bin/system-debugger.sh
  # 방법 2)
  */30 * * * * /usr/local/bin/system-debugger.sh
  ```
### grep
- `-r` : 특정 디렉터리 내에서 모든 파일을 확인
- `DATABASES = {` 이 포함된 파일을 `/opt`에서 하위 디렉터리까지 모두 찾기
  ```
  $ cd /opt
  $ grep -ir "DATABASES = {"
    mercuryProject/mercury/settings.py:DATABASES = {
  ```
### systemd
```
[Unit]
Description=mercury service

[Service]
ExecStart=/usr/bin/python3 manage.py runserver 0.0.0.0:8000
WorkingDirectory=/opt/caleston-code/mercuryProject/
User=mercury
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
