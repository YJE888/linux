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
#### zcat
- `zcat`은 압축된 파일의 내용을 화면에 출력하는 명령어로 `.gz` 확장자를 가진 gzip으로 압축된 파일의 내용을 보여줌
```
$ zcat example.log.gz
```
