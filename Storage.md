# Storage
### Storage Basics
- Major Number
  |Major Number|Device Type|
  |:---:|:---:|
  |1|RAM|
  |3|Hard Disk or CD ROM|
  |6|Paraller Printers|
  |8|SCSI DISK|
```
$ lsblk
NAME            MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda               8:0    0   20G  0 disk 
├─sda1            8:1    0    1G  0 part /boot
└─sda2            8:2    0   19G  0 part 
  ├─centos-root 253:0    0   17G  0 lvm  /
  └─centos-swap 253:1    0    2G  0 lvm  [SWAP]

$ ls -l /dev | grep ^b
brw-rw---- 1 root disk    253,   0 Aug  7 22:13 dm-0
brw-rw---- 1 root disk    253,   1 Aug  7 22:13 dm-1
brw-rw---- 1 root disk      8,   0 Aug  7 22:13 sda
brw-rw---- 1 root disk      8,   1 Aug  7 22:13 sda1
brw-rw---- 1 root disk      8,   2 Aug  7 22:13 sda2
```
### Partition Type
- Promary Partition
- Extended Partition
- Logical Partition
### Partition Scheme
- MBR(Master Boot Record)
  - 컴퓨터의 부팅 프로세스를 시작하기 위해 사용되는 데이터 구조
  - BIOS 시스템에서 주로 사용되며, 레거시 시스템에 널리 사용됨(32bit로 제한)
  - 2TB보다 큰 하드 디스크를 제대로 지원하지 못하며, 디스크의 파티션 개수(4개)에 제한이 있음
    확장 파티션의 논리 파티션에는 여러 개의 파티션 생성 가능
    Primary Partition 4개 or Primary Partition 3개 + Extended Partition 1개(Logical Partition)
  - `fdisk`를 사용하여 관리
- GPT(GUID Partition Table)
  - GPT는 MBR 파티션 테이블을 대체하는 기술로, 대용량 디스크 및 UEFI 시스템과의 호환성을 갖는 컴퓨터 시스템에서 주로 사용
  - GPT는 64bit의 값을 사용하여 더 많은 파티션을 지원하며, 각 파티션의 크기도 더 크게 할당 가능
  - GPT의 파티션 정보의 복구와 정확도도 MBR보다 우수한 기능 제공(GPT 디스크 시작에 Header, 마지막에 Footer 섹션이 있음)=> 백업과 무결성 유지
  - `gdisk`를 사용하여 관리
### FSTAB 필드
|FIELD|목적|
|:---:|:---:|
|Filesystem|ex)/dev/sdb1|
|Mountpoint|ex) /test|
|Type|ext4, xfs...|
|Option|RW, RO...|
|Dump|0=무시, 1=백업|
|Pass|0=무시, 1 or 2 = fsck filesystem 체크|

### DAS, NAS, SAN
- DAS(Direct Attached Storage)
  - 컴퓨터 또는 서버에 직접 연결되는 스토리지 장치로 하드디스크, SSD등이 컴퓨터의 내부 또는 외부에 연결되어 사용되는 것을 의미
- NAS(Network Attached Storage)=NFS와 비슷
  - 네트워크를 통해 접근 가능한 스토리지 시스템
  - 네트워크에 연결된 디바이스나 서버에 부착된 스토리지로, 파일 공유와 데이터 관리를 위해 사용됨
  - 여러 사용자가 동시에 NAS에 접근하여 파일을 공유하고 관리
- SAN(Storage Area Network)
  - 스토리지를 위한 전용 네트워크를 구축하는 기술로, 여러 서버에서 공유하는 중앙 스토리지를 지원함
  - 블록기반 스토리지로서, 서버와 스토리지 간의 고속 연결을 제공
