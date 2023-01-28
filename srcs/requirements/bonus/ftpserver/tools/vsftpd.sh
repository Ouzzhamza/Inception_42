#!bin/bash


# creating ftpuser
useradd -m $FTP_USER

# setting a password to the user
echo "$FTP_USER:$FTP_PASS" | chpasswd

#creating a 
mkdir -p /home/$FTP_USER/ftp

chown nobody:nogroup /home/$FTP_USER/ftp
chmod a-w /home/$FTP_USER/ftp

mkdir /home/$FTP_USER/ftp/files
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ftp/files

echo "hamza" >> /etc/vsftpd.userlist


sed -i "s/anonymous_enable=YES/anonymous_enable=NO/g" /etc/vsftpd.conf
sed -i "s/local_enable=NO/local_enable=YES/g" /etc/vsftpd.conf
echo "write_enable=YES" >> /etc/vsftpd.conf
echo "chroot_local_user=YES" >> /etc/vsftpd.conf
echo "pasv_min_port=40000" >> /etc/vsftpd.conf
echo "pasv_max_port=40005" >> /etc/vsftpd.conf
echo "userlist_enable=YES" >> /etc/vsftpd.conf
echo "userlist_file=/etc/vsftpd.userlist" >> /etc/vsftpd.conf
echo "userlist_deny=NO" >> /etc/vsftpd.conf
echo "secure_chroot_dir=/home/hamza/ftp/files" >> /etc/vsftpd.conf

exec "$@"
