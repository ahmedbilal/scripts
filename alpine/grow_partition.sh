apk add sfdisk e2fsprogs-extra util-linux
wget https://git.launchpad.net/ubuntu/+source/cloud-utils/plain/bin/growpart
sh ./growpart /dev/vda 3; rm growpart
partx -u /dev/vda3
resize2fs /dev/vda3
