# systemctl and journalctl
#### systemd
- `systemd`를 사용하여 서비스를 등록하면 해당 서비스를 효율적으로 관리 가능(로그 확인 등)
#### journalctl
- `journalctl`은 시스템 로그를 보는 명령어로, `systemd`를 사용하여 리눅스 시스템에서 로그를 조회하고 분석
```
# 부팅 이후에 생성된 로그를 조회(가장 최근에 시작된 부팅로그 확인 가능)
$ journalctl -b

# ex) journalctl -u docker.service
$ journalctl -u [서비스 이름]
```

