#!/bin/bash
#set -x

cd /var/www/html
wget https://downloads.joomla.org/cms/joomla3/3-9-26/Joomla_3-9-26-Stable-Full_Package.tar.gz
tar zxvf Joomla_3-9-26-Stable-Full_Package.tar.gz
rm -rf Joomla_3-9-26-Stable-Full_Package.tar.gz
chown apache. -R ../html

sed -i '/memory_limit = 128M/c\memory_limit = 256M' /etc/httpd/conf/httpd.conf
sed -i '/max_execution_time = 30/c\max_execution_time = 240' /etc/httpd/conf/httpd.conf
sed -i '/max_input_time = 60/c\max_input_time = 120' /etc/httpd/conf/httpd.conf
sed -i '/post_max_size = 8M/c\post_max_size = 50M' /etc/httpd/conf/httpd.conf


systemctl start httpd
systemctl enable httpd


echo "Joomla! is installed and Apache started !"
