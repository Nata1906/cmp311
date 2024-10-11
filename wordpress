
sudo apt update -y
sudo apt upgrade -y

sudo apt install apache2 -y

sudo apt install mysql-server -y

sudo mysql -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
sudo mysql -e "CREATE USER 'wordpressuser'@'localhost' IDENTIFIED BY 'password';"
sudo mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpressuser'@'localhost';"
sudo mysql -e "FLUSH PRIVILEGES;"


sudo apt install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y

wget https://wordpress.org/latest.tar.gz

tar -xzvf latest.tar.gz

sudo cp -R wordpress/* /var/www/html/

udo chown -R www-data:www-data /var/www/html/
sudo find /var/www/html/ -type d -exec chmod 750 {} \;
sudo find /var/www/html/ -type f -exec chmod 640 {} \;


cd /var/www/html/
sudo mv wp-config-sample.php wp-config.php

sudo sed -i "s/database_name_here/wordpress/" wp-config.php
sudo sed -i "s/username_here/wordpressuser/" wp-config.php
sudo sed -i "s/password_here/password/" wp-config.php

sudo a2enmod rewrite
sudo systemctl restart apache2


cat <<EOL | sudo tee /var/www/html/.htaccess
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>
EOL


sudo systemctl restart apache2

echo "WordPress успішно встановлено! Перейдіть на http://ваша_IP_адреса, щоб завершити встановлення через веб-інтерфейс."
