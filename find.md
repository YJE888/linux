# find

### 대소문자 무시
`find -iname test`
- 현재 디렉토리에서 test, TEST, Test, tEST 등과 같이 대소문자가 다른 모든 경우를 검색함

### 사이즈로 검색
`find -size 512k`
- 현재 디렉토리에서 파일의 사이즈가 512k인 것을 확인

### AND
`find -name "f*" -size 512k`
- 현재 디렉토리에서 파일의 이름이 f로 시작하면서 사이즈가 512k인 파일을 검색

### OR
`find -name "f*" -o -size 512k`
- 현재 디렉토리에서 파일의 이름이 f로 시작하거나, 사이즈가 512k인 파일을 검색

### NOT
`find -not -name "f*"`
- 현재 디렉토리에서 파일의 이름이 f로 시작하지 않는 모든 파일을 검색

`find \! -name "f*"`
- 현재 디렉토리에서 파일의 이름이 f로 시작하지 않는 모든 파일을 검색

### Permission
`find -perm 664`  =  `find -perm u=rw,g=rw,o=r`
- 현재 디렉토리에서 퍼미션이 664인 모든 파일 검색

### 특정 디렉토리 기준 파일과 디렉토리 개수 확인
```bash
$ find /home/thor/test_dir/ -type d
/home/thor/test_dir/
/home/thor/test_dir/dir2
/home/thor/test_dir/dir1
/home/thor/test_dir/dir3

# 현재 디렉토리를 제외하는 방법
$ find /home/thor/test_dir/ -mindepth 1 type d
/home/thor/test_dir/dir2
/home/thor/test_dir/dir1
/home/thor/test_dir/dir3

$ find /home/thor/test_dir/ -type f
```

