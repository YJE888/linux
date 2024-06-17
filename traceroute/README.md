#### 사용 목적
- 목적지로의 경로가 변경되는지 확인하는 용도
- 8.8.8.8이 아닌 필요한 ip를 입력
- 해당 파일을 1분마다 실행하게끔 설정
```
$ crontab -e
*/1 * * * * /home/vps/trace_icmp.sh
*/1 * * * * /home/vps/trace_udp.sh
```
<br>

#### 로그 삭제
- 최신 3일치의 파일만 쌓고 그 외엔 삭제
- 매일 1시 5분에 수정시간이 1일 이상인 파일을 찾아서 삭제

```
$ crontab -e
5 1 * * * find /home/vps/icmp/ -type f -mtime +1 -delete
5 1 * * * find /home/vps/udp/ -type f -mtime +1 -delete
```
