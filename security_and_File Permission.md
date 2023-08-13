# Security and File Permission
#### Managin Users
```
user add [option]
-u : UID 지정
-g : GID 지정
-d : home 디렉토리 지정
-m : 지정한 home 디렉토리 생성
-e : 만료기간
-G : 여러 개의 다른 그룹 지정
```
#### cron
```
* * * * * [command]
```
#### usermod
```
usermod go-w example.txt
```
#### ssh-keygen
- ssh-keygen rsa로 키를 생성하면 ~/.ssh 디렉토리에 private키와 public키가 생성됨
- public key : ~/.ssh/id_rsa.pub
- private key : ~/.ssh/id_rsa
- `ssh-copy-id`로 public key가 대상 서버의 `~/.ssh/authorized_keys`로 복사됨
