# input, output redirection
### error, standard output
`grep -r '^The' /etc/ 2>/dev/null`
  - /etc/ 디렉토리에서 시작하는 줄이 "The"로 시작하는 것을 찾아 오류 메시지를 `/dev/null`로 리다이렉션 해서 오류 메시지를 화면에 출력하지 않음
`grep -r '^The' /etc/ 1>output.txt 2>errors.txt`
  - /etc/ 디렉토리에서 시작하는 줄이 "The"로 시작하는 것을 찾아 오류 메시지를 `errors.txt`로 리다이렉션하고, 표준 출력을 `output.txt`로 리다이렉트
`grep -r '^The' /etc/ > all_output.txt 2>&1`
  - /etc/ 디렉토리에서 시작하는 줄이 "The"로 시작하는 것을 찾아 오류, 표준 출력 모두를 all_output.txt에 저장
```
비교
$ grep -r '^The' /etc/ > all_output.txt 2>&1
$ grep -r '^The' /etc/ 1>all_output.txt 2>&1
$ grep -r '^The' /etc/ 2>&1 1>all_output.txt 2>&1
```
