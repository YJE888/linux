# sed
### sed
- 대, 소문자를 구분하지 않고 "disabled", "DISABLED", "Disabled" 모두 "enable"로 변경
  ```
  $ sed -i 's/disabled/enabled/gi' values.conf
  ```
- 500에서 2000줄 사이의 "enabled"를 "disabled"로 변경
  ```
  $ sed '500,2000s/enabled/disabled/g' values.conf
  ```
- 첫글자가 대문자로 시작하고, 소문자 2개로 이루어진 단어라인 출력
  ```
  egrep -w '[A-Z][a-z]{2}' /etc/nsswitch.conf
  ```
- 다섯 개의 숫자로 이루어진 것을 출력
  ```
  egrep -w '[0-9]{5}' textfile
  ```
- 2로 시작하는 것의 개수를 출력
  ```
  grep -c '^2' textfile
  ```
