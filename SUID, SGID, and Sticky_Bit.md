# SUID, SGID, and Sticky Bit
### SUID
- SUID 설정이 되어 있는 파일은 실행될 때 파일의 소유자(Owner)권한으로 실행됨
- e.g.) `passwd` 명령어는 SUID가 설정된 파일로, 누구나 비밀번호를 변경할 수 있도록 허용하지만, 파일의 실행은 root 권한으로 실행됨
  ```
  ls -l /usr/bin/passwd
  -rwsr-xr-x. 1 root root 27856  3월 31  2020 /usr/bin/passwd
  ```
- SUID 확인(4---)
  ```
  $ touch suidfile
  $ ls -l suidfile
  -rw-r--r-- 1 root root 0  8월 27 02:59 suidfile

  # 4로 SUID 설정
  # 실행 권한이 없는 상태에서 대문자 "S"로 표시됨
  $ chmod 4664 suidfile
  $ ls -l suidfile
  -rwSrw-r-- 1 root root 0  8월 27 02:59 suidfile

  # 실행 권한까지 설정되어 있으면 소문자 "s"로 표시됨
  $ chmod 4764 suidfile
  $ ls -l suidfile
  -rwsrw-r-- 1 root root 0  8월 27 02:59 suidfile

  # find 명령어로 퍼미션이 4로 시작하는 것 찾기=> SUID가 설정된 파일 찾기
  $ find . -perm /4000
  ./suidfile
  ```

### SGID
- SGID 설정이 되어 있는 파일은 실행될 때 파일의 그룹(Group)권한으로 실행됨
- 주로 디렉터리에 사용되며, 해당 디렉터리에 새로운 파일이 생성될 때 파일은 그룹의 소유로 설정됨
- 여러 사용자가 공동 작업하는 프로젝트 디렉토리에서 파일을 공유하는 것이 가능함
- SGID 확인(2---)
  ```
  $ touch sgidfile
  $ ls -l sgidfile
  -rw-r--r-- 1 root root 0  8월 27 03:03 sgidfile

  # 2로 SGID 설정
  # 실행 권한이 없는 상태에서 대문자 "S"로 표시됨
  $ chmod 2664 sgidfile
  $ ls -l sgidfile
  -rw-rwSr-- 1 root root 0  8월 27 03:03 sgidfile

  # 실행 권한까지 설정되어 있으면 소문자 "s"로 표시됨
  $ chmod 2674 sgidfile
  $ ls -l sgidfile
  -rw-rwsr-- 1 root root 0  8월 27 03:03 sgidfile

  # find 명령어로 퍼미션이 2로 시작하는 것 찾기=> SGID가 설정된 파일 찾기
  $ find . -perm /2000
  ./sgidfile
  
  # SUID, SGID 모두 설정( 4--- + 2--- = 6---)
  $ touch both
  $ chmod 6664 both
  $ ls -l both
  -rwSrwSr-- 1 root root 0  8월 27 03:05 both

  # SUID, SGID 모두 설정되어 있는 것 찾기( 4--- + 2--- = 6---)
  $ find . -perm /6000
  ./suidfile
  ./sgidfile
  ./both
  ```

### Sticky bit
- 주로 디렉터리에서 사용되며, Sticky Bit가 설정되어 있으면 해당 디렉터리 내에서는 자신의 파일만 삭제 가능함
- 일반적으로 /tmp 디렉터리에 Sticky Bit가 설정됨 => 다른 사용자의 파일 삭제 불가능
  ```
  $ mkdir stickydir
  $ ls -ld stickydir/
  drwxr-xr-x 2 root root 6  8월 27 03:15 stickydir/

  # 1로 SGID 설정
  # 실행 권한이 없는 상태에서 대문자 "T"로 표시됨
  $ chmod 1666 stickydir/
  $ ls -ld stickydir/
  drw-rw-rwT 2 root root 6  8월 27 03:15 stickydir/

  # 실행 권한까지 설정되어 있으면 소문자 "s"로 표시됨
  $ chmod 1777 stickydir/
  $ ls -ld stickydir/
  drwxrwxrwt 2 root root 6  8월 27 03:15 stickydir/
  ```
