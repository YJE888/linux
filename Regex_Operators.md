# 정규표현식
### 정규표현식 종류
|메타문자|설명|
|:---:|:---:|
|^|문자열의 시작을 뜻함|
|$|문자열의 끝을 뜻함|
|.|문자 하나를 뜻함|
|*|* 앞의 문자가 0회 이상 반복되는 것을 뜻함<br> e.g.) let* = le, let, lett, lettt|
|+|+ 앞의 문자가 1회 이상 반복되는 것<br> e.g.) let\\+ = let, lett, lettt|
|?|? 앞의 문자가 0회 또는 1회 반복되는 것<br> e.g.) let\\? = le, let, <strong>let</strong>t, <strong>let</strong>tt, <strong>let</strong>ttt|
- ^
  ```
  $ grep 'PASS' /etc/login.defs 
  #	PASS_MAX_DAYS	Maximum number of days a password may be used.
  #	PASS_MIN_DAYS	Minimum number of days allowed between password changes.
  #	PASS_MIN_LEN	Minimum acceptable password length.
  #	PASS_WARN_AGE	Number of days warning given before a password expires.
  PASS_MAX_DAYS	99999
  PASS_MIN_DAYS	0
  PASS_MIN_LEN	5
  PASS_WARN_AGE	7
  
  $ grep '^PASS' /etc/login.defs
  PASS_MAX_DAYS	99999
  PASS_MIN_DAYS	0
  PASS_MIN_LEN	5
  PASS_WARN_AGE	7
  ```
- $
  ```
  $ grep 'sam' names.txt 
  basam
  samad
  samuel
  mausami
  
  $ grep 'sam$' names.txt 
  basam
  ```
- .
  ```
  $ grep 'm.d' names.txt 
  samad
  
  $ grep 's..u' names.txt 
  samuel

  # . 은 한 글자를 뜻하므로, 아래의 경우와 같이 사용하면 빈줄을 제외하고 모든 문자와 일치하게 됨
  $ grep '.' names.txt
  adam
  adnan
  basam
  samad
  samuel
  sheela
  ravi.
  mausami

  $ grep '\.' names.txt 
  ravi.
  ```
- \*
  ```
  $ grep 'he*' names.txt 
  sheela

  # /문자열/파일, /문자열/문자열/파일, /문자열/문자열/문자열/파일 등과 같은 것과 일치하는 것을 출력 
  $ grep -r '/.*/' /etc
  ...
  /etc/vimrc:  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  /etc/vimrc:if has("cscope") && filereadable("/usr/bin/cscope")
  /etc/vimrc:   set csprg=/usr/bin/cscope
  /etc/vimrc:" http://www.linuxpowertop.org/known.php
  /etc/wgetrc:## Wget initialization file can reside in /etc/wgetrc
  /etc/wgetrc:## Global settings (useful for setting up in /etc/wgetrc).
  /etc/wgetrc:#https_proxy = http://proxy.yoyodyne.com:18023/
  /etc/wgetrc:#http_proxy = http://proxy.yoyodyne.com:18023/
  /etc/wgetrc:#ftp_proxy = http://proxy.yoyodyne.com:18023/
  /etc/wgetrc:# to -k / --convert-links / convert_links = on having been specified),
  /etc/rsyncd.conf:# /etc/rsyncd: configuration file for rsync daemon mode
  /etc/rsyncd.conf:# pid file = /var/run/rsyncd.pid
  /etc/rsyncd.conf:#        path = /home/ftp
  ```
- \+
  ```
  $ grep 'let*' let.txt 
  le
  let
  lett
  lettt
  letttt
  
  $ grep 'let\+' let.txt 
  let
  lett
  lettt
  letttt
  ```
