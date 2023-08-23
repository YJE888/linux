# Builtin Command VS Hashed Command
### Builtin Command
- 쉘 자체에 내장되어 있어 별도의 실행 파일이나 스크립트가 필요하지 않음
- 쉘 프로세스 내에서 직접 실행되므로, 실행이 매우 빠르며 효율적임
- e.g.) `cd`, `echo`, `pwd`, `history` 등이 해당됨
### Hashed Command
- 쉘에 의해 해시 테이블에 저장된 명령어
- 처음 명령어를 실행할 때, 실행 파일을 찾아 실행한 뒤 파일의 경로를 해시 테이블에 저장함
- 그 이후에 실행할 때, 해시된 경로를 사용하여 명령어를 실행함
- e.g.) `ls`, `cat`
### type
- type [command]를 통해서 builtin, hashed 구분 가능함
  ```
  $ type echo
  echo is a shell builtin
  
  $ type cat
  cat is hashed (/usr/bin/cat)
  ```
### time
- 명령어나 프로그램의 실행 시간을 측정하는데 사용됨
- 명령어가 실행되는 데 소요된 시간과 CPU 사용량등을 측정 가능
  |구 분|설 명|
  |:---:|:---:|
  |real|실제 경과시간 (명령어가 실행되는 데 걸린 총 시간)|
  |user|사용자 모드에서 소비한 CPU 시간(사용자가 프로그램을 실행하는 동안 소비한 시간 측정)|
  |sys|커널 모드에서 소비한 CPU 시간(명령어가 커널과 상호작용하는 동안 소비스한 시간 측정)|
&nbsp;
- `echo`는 쉘 내장 명령어로 별도의 실행 파일을 실행하지 않아 소요되는 시간이 거의 없음
- `/usr/bin/echo`는 실행파일을 실행하는 것으로 명령어를 실행하는데 시간이 소요됨
  ```
  $ time echo
  real	0m0.000s
  user	0m0.000s
  sys  	0m0.000s
  
  $ time /usr/bin/echo
  real	0m0.018s # /usr/bin/echo를 실행하기 위한 파일 경로를 찾는 시간으로, 프로세스가 시작되고 종료되기까지의 실제 시간을 측정
  user	0m0.000s
  sys  	0m0.003s
  ```
