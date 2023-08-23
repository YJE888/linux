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
