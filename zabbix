sudo apt update -y
sudo apt upgrade -y

sudo apt install mysql-server -y

sudo mysql_secure_installation


sudo mysql -e "CREATE USER 'zabbix'@'localhost' IDENTIFIED BY 'password';"
sudo mysql -e "CREATE DATABASE zabbix character set utf8mb4 collate utf8mb4_bin;"
sudo mysql -e "GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"


wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-4+ubuntu20.04_all.deb
sudo dpkg -i zabbix-release_6.0-4+ubuntu20.04_all.deb
sudo apt update

sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-agent -y


sudo zcat /usr/share/doc/zabbix-server-mysql*/create.sql.gz | mysql -u zabbix -p'password' zabbix


sudo sed -i 's/# DBPassword=/DBPassword=password/' /etc/zabbix/zabbix_server.conf


sudo sed -i 's/# php_value date.timezone/php_value date.timezone Europe\/Kyiv/' /etc/zabbix/apache.conf


sudo systemctl restart zabbix-server zabbix-agent apache2
sudo systemctl enable zabbix-server zabbix-agent apache2


echo "Встановлення завершено. Відкрийте веб-інтерфейс Zabbix за адресою http://ваша_IP_адреса/zabbix"
