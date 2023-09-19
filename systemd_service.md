# systemctl and journalctl
### 서비스 유닛 파일의 경로
- 시스템 서비스 : `/lib/systemd/system/`
- 사용자 정의 서비스 : `/etc/systemd/system/`
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
### 서비스 생성
```
$ vi /usr/local/bin/myapp.sh
#!/bin/bash
echo "MyApp Started" | systemd-cat -t MyApp -p info
sleep 5
echo "MyApp Crashed" | systemd-cat -t MyApp -p err
```
### systemd myapp 생성
```
$ vi /etc/systemd/system/myapp.service
[Unit]
Description=My Application
After=network.target auditd.service

[Service]
ExecStartPre=echo "Systemd is preparing to start MyApp"
ExecStart=/usr/local/bin/myapp.sh
KillMode=process
Restart=always
RestartSec=1
Type=simple

[Install]
WantedBy=multi-user.target
```
- Unit : systemd의 기본 구성 요소로, 서비스, 타이머, 마운트 등 다양한 시스템 관련 개체를 나타냄
- Service: 서비스가 시작될 때 실행되는 명령, 환경 변수, 의존성, 리소스 제한 등 서비스 실행과 관련된 정보 포함
  - `Restart=on-failure`
    - 서비스가 실패한 경우(종료 코드가 0일때)에만 다시 시작하도록 지정 > 서비스가 성공적으로 종료되면 다시 시작하지 않음
  - `Restart=always`
    - 서비스가 종료될 때마다 항상 다시 시작 > 성공 또는 실패와 무관하게 항상 다시 시작
  - `KillMode=process`
    - 서비스 유닛이 종료될 때 프로세스를 어떻게 종료할지 지정
    - process : 메인 프로세스만을 종료하도록 지정 > 메인 프로세스가 종료되면 해당 서비스와 관련된 모든 자식 프로세스도 함께 종료됨
    - control-group : 프로세스 그룹을 기반으로 서비스와 관련된 모든 프로세스를 종료하는 것
  - `Type=simple`
- Install : 설치 경로, 원하는 타켓(runlevel 또는 타임라인), 의존성 관계등을 설정하거나 시스템 부팅 및 종료 시에 서비스를 활성화 또는 비활성화할 때 사용
  
