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
### Compress
- 압축관련 유틸리티로 gzip, bzip2, xz 가 있음(압축 시 원본파일이 사라짐)
  ```
  $ gzip file1    ---해제--->    $ gunzip file1.gz  $ gzip --decompress file1.gz
  file2.gz

  $ bzip2 file2    ---해제--->  $ bunzip file2.bz2  $ bzip2 --decompress file2.bz2
  file2.bz2

  $ xz file3      ---해제---> $ unxz file3.xz    $ xz --decompress file3.xz
  file3.xz
  ```
- zip
  ```
  $ zip archive file1 = $ zip archive.zip file1    ---해제---> $ unzip archive.zip
  adding: file1 (deflated 44%)
  # 하위의 모든 내용들을 압축
  # -r = recursively
  $ zip -r test dirs/
  adding: dirs/ (stored 0%)
  adding: dirs/test (stored 0%)
  ```
### 아카이브 후 압축
```
$ tar --create --file archive.tar file5 = $ tar cf archive.tar file5
$ gzip archive.tar
$ ls
archive.tar.gz

$ tar --create --gzip --file archive.tar.gz file1 = $ tar czf archive.tar.gz file1
$ tar --create --bzip2 --file archive.tar.bz2 file1 = $ tar cjf archive.tar.bz2 file1
$ tar --create --xz --file archive.tar.xz file1 = $ tar cJf archive.tar.xz file1
```
