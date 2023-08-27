# Inode, Hard Link, Soft Link
### Inode(Index Node)
- Unix 기반의 파일 시스템에서 사용되는 개념
- Inode는 파일 또는 디렉터리의 메타 데이터 정보를 저장하는 데이터 구조
  - 파일 유형 및 권한
  - 파일 크기
  - 소유자 및 그룹
  - 링크 카운터
&nbsp;
### Hard Link
- 하드 링크를 생성하면 동일한 파일의 여러 하드 링크가 생성되며, 이들은 같은 데이터와 연결됨
- 원본 파일과 하드 링크 간에는 데이터의 실제 복사본이 아닌 동일한 데이터이므로, 하드 링크를 통해 원본 파일의 내용을 변경하면 다른 하드 링크에서도 변경된 내용 확인 가능
- 하드 링크는 동일한 파일 시스템 내에서만 작동하며 디렉터리에 대한 하드링크는 일반적으로 허용되지 않음
- 파일 시스템 내에서 파일을 공유하거나 동일한 데이터를 여러 위치에서 접근해야 할 때 사용됨(수천 개의 파일 공유)
<img width="271" alt="스크린샷 2023-08-26 오후 5 34 55" src="https://github.com/YJE888/linux/assets/75539276/4d88b9db-7051-4fc5-80fb-c13ea97d2c8a">
<img width="279" alt="image" src="https://github.com/YJE888/linux/assets/75539276/cd3c1def-6e0d-408a-952f-7028855efa24">

&nbsp;&nbsp;
- 테스트
  ```
  $ pwd
  /root/txt
  $ ls
  family_dog.jpg

  # family_dog.jpg 상태 확인
  $ stat family_dog.jpg
  File: `family_dog.jpg'
  Size: 13        	Blocks: 8          IO Block: 4096   일반 파일
  Device: fd00h/64768d	Inode: 33576916    Links: 1
  Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
  Access: 2023-08-24 21:20:10.613665141 -0400
  Modify: 2023-08-24 21:20:10.613665141 -0400
  Change: 2023-08-24 21:20:10.613665141 -0400
   Birth: -

  # 다른 디렉터리로 하드링크 생성
  # format : ln [원본파일 경로] [하드링크 경로]
  $ ln ./family_dog.jpg ../jpg/family_dog.jpg

  # Inode는 그대로이고 Links 가 늘어난 것을 확인 가능함
  $ stat family_dog.jpg
  File: `family_dog.jpg'
  Size: 13        	Blocks: 8          IO Block: 4096   일반 파일
  Device: fd00h/64768d	Inode: 33576916    Links: 2
  Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
  Access: 2023-08-24 21:20:10.613665141 -0400
  Modify: 2023-08-24 21:20:10.613665141 -0400
  Change: 2023-08-27 02:18:14.679419317 -0400
   Birth: -
  ```
### Soft Link
  - 파일 또는 디렉토리를 가리키는 포인터로 원본 파일에 대한 경로를 가르킴 => 원본 파일이나 디렉터리가 삭제되면 소프트링크는 무효화됨
  - 원본 파일이나 디렉터리가 이동하더라도 소프트링크는 동작함
  - 원본 파일과 소프트링크는 다른 inode를 가지며, 데이터 블록을 공유하지 않음
  - 파일이나 디렉터리의 다른 경로로의 접근을 제공하거나, 프로그램이나 스크립트 파일이 다른 파일을 가리키는 경우에 사용됨
  <img width="171" alt="image" src="https://github.com/YJE888/linux/assets/75539276/c020f807-1bae-472a-a66c-86a20afef50d">

  - test
    ```
    $ pwd
    /root/txt
    $ ls
    family_dog.jpg

    # jpg 디렉터리에 소프트링크 생성
    # format : ln -s [원본파일 경로] [소프트링크 경로]
    $ ln -s ./family_dog.jpg ../jpg/family_dog_shortcut.jpg

    $ ls -l ../jpg/
    합계 0
    lrwxrwxrwx 1 root root 16  8월 27 02:46 family_dog_shortcut.jpg -> ./family_dog.jpg
    $ readlink ../jpg/family_dog_shortcut.jpg
    ./family_dog.jpg
    ```
