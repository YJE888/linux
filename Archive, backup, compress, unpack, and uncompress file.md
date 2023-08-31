# Archive, backup, compress, unpack, and uncompress file
### Archive
- archive.tar 파일의 내용을 리스트 형식으로 표시하는 명령
  ```
  # --list = -t , --file = -f
  $ tar --list --file archive.tar
  = $ tar -tf archive.tar
  = $ tar tf archive.tar
  ```
&npsp;
- 파일과 디렉터리 아카이빙(/w tar)
  ```
  # --create = -c --file = -f
  $ tar --create --file archive.tar file{1..4}
  = $ tar cf archive.tar file{1..4}
  $ tar tf archive.tar 
  file1
  file2
  file3
  file4
  
  # 파일 추가
  # --appent = -r
  $ tar --append --file archive.tar file5
  = $ tar rf archive.tar file5
  $ tar tf archive.tar 
  file1
  file2
  file3
  file4
  file5
  ```
- 아카이브 추출
  ```
  $ ls
  archive.tar

  # --extract = -x
  $ tar --extract --file archive.tar
  = $ tar xf archive.tar

  $ ls
  ls
  archive.tar  dirs  file1  file2  file3  file4  file5  files

  # /tmp 디렉터리에 archive.tar 추출
  # --directory = -C
  $ tar xf archive.tar --directory /tmp/
  = $ tar xf archive.tar -C /tmp
  ```
