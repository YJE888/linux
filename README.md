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
