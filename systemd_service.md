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

### 리눅스 유닛들 
1. service
2. socket
3. device
4. timer

### 1. Service
- `/etc/systemd/system/sshd.service`에 위치한 파일 확인 방법
```
$ systemctl cat sshd
[Unit]
Description=OpenSSH server daemon
Documentation=man:sshd(8) man:sshd_config(5)
After=network.target sshd-keygen.service
Wants=sshd-keygen.service

[Service]
Type=notify
EnvironmentFile=/etc/sysconfig/sshd
ExecStart=/usr/sbin/sshd -D $OPTIONS
ExecReload=/bin/kill -HUP $MAINPID
KillMode=process
Restart=on-failure
RestartSec=42s

# 수정
$ systemctl edit --full sshd
```
### systemctl [option]
- restart
  - 실행 중인 ssh 서비스를 중단하고 다시 시작
  - 서버의 설정 변경을 반영하게되며, 기존에 연결 중인 세션이 종료됨
- reload
  - ssh 서버를 재시작하지 않고 설정을 다시 불러옴
  - 현재 연결 중인 세션에는 영향을 미치지 않고 새로운 연결에만 반영됨
- start, enable
  ```
  $ systemctl enable sshd
  $ systemctl start sshd

  # enable과 start를 한번에 설정
  $ systemctl enable --now sshd
  ```
- mask, disable
  - mask
    - 서비스를 비활성화하고, 해당 서비스의 링크 파일을 삭제하여 서비스가 절대로 시작되지 않도록 차단
    - 부팅 시 자동 시작하는 것을 방지
    - mask 명령은 다시 활성화하기 어려우므로 주의를 기울여야됨
  ```
  # systemctl mask atd.service
  # systemctl unmask atd.service
  ```
  - disable
    - 서비스를 비활성화하지만, 서비스의 링크 파일을 삭제하지는 않음
    - 나중에 서비스를 다시 활성화 하기 쉬움
- 확인
  ```
  $ systemctl list-units --type service --all
  ```
