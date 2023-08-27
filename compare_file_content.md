# 파일 내용 비교
### cat
  ```
  $ cat users.txt
  user1
  user2
  user3
  user4
  user5
  user6
  ```
### tac
- cat의 역순 버전으로 파일의 내용을 거꾸로 출력
```
$ tac users.txt
user6
user5
user4
user3
user2
user1
```
### head
```
$ head -n 5 users.txt
user1
user2
user3
user4
user5
```
### tail
```
$ tail -n 5 users.txt
user2
user3
user4
user5
user6
```
### cut
```
$ cat userinfo.txt
ravi seattle usa 23400985 india
mark toronto canada 12340589 canada
john newyork usa 12347890 usa
ravi montreal canada 23457890 canada
mary ottawa canada 34567890 canada

$ cut -d ' ' -f 1 userinfo.txt
ravi
mark
john
ravi
mary
```
### sed
```
$ sed 's/ /,/g' userinfo.txt
ravi,seattle,usa,23400985,india
mark,toronto,canada,12340589,canada
john,newyork,usa,12347890,usa
ravi,montreal,canada,23457890,canada
mary,ottawa,canada,34567890,canada

$ sed -i 's/ /,/g' userinfo.txt

$ cut -d ',' -f 3 userinfo.txt > countries.txt
```
### uniq and sort
- `uniq`는 중복된 라인을 제거하나 연속된 중복 라인을 필터링하는데 사용하므로, 정렬된 데이터에서 사용함
```
$ cat countries.txt
usa
canada
usa
canada
canada

$ uniq countries.txt
usa
canada
usa
canada

$ sort countries.txt
canada
canada
canada
usa
usa

$ sort countries.txt | uniq
canada
usa
```
### diff
```
$ cat file1
Only exists in file 1
Identical line 2
Identical line 3
Only exists in file 1

$ cat file2
Only exists in file 2
Identical line 2
Identical line 3
Only exists in file 2

$ diff file1 file2
1c1                          # 첫 번째 파일과 두번째 파일에서 첫번째 라인이 다른것을 의미함
< Only exists in file 1      # < 기호는 변경 이전의 내용을 나타냄
---
> Only exists in file 2      # > 기호는 변경 이후의 내용을 나타냄 즉, Only exists in file 1이 Only exists in file 2로 변경되었음을 의미
4c4
< Only exists in file 1
---
> Only exists in file 2

$ diff -c file1 file2
*** file1	2023-08-27 04:55:42.317153123 -0400
--- file2	2023-08-27 04:56:14.211626558 -0400
***************
*** 1,4 ****
! Only exists in file 1
  Identical line 2
  Identical line 3
! Only exists in file 1
--- 1,4 ----
! Only exists in file 2
  Identical line 2
  Identical line 3
! Only exists in file 2

$ diff -y file1 file2   = sdiff file1 file2
Only exists in file 1					      |	Only exists in file 2
Identical line 2						Identical line 2
Identical line 3						Identical line 3
Only exists in file 1					      |	Only exists in file 2
```
