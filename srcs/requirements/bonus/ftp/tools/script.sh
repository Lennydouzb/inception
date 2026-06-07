#!/bin/bash

echo "anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
pasv_enable=YES
pasv_min_port=30000
pasv_max_port=30009
pasv_address=$DOMAIN_NAME
pasv_addr_resolve=YES
seccomp_sanbox=NO
allow_writeable_chroot=YES" >> /etc/vsftpd.conf
mkdir -p /var/run/vsftpd/empty
useradd -m -s /bin/bash $FTPUSER -d /var/www/html
echo "$FTPUSER:$FTPPASS" | chpasswd
exec vsftpd /etc/vsftpd.conf