#!/bin/bash
sudo apt update
sudo apt install -y apache2
sudo apt install -y mysql-client-core-8.0 
sudo apt install -y php-common libapache2-mod-php php-cli php-mysql

export DB_HOST={DB_HOST}
export DB_NAME={DB_NAME}
export DB_USER={DB_USER}
export DB_PASS={DB_PASS}

cat <<EOF >> /etc/apache2/envvars
export DB_HOST=${DB_HOST}
export DB_NAME=${DB_NAME}
export DB_USER=${DB_USER}
export DB_PASS=${DB_PASS}
EOF

rm /var/www/html/index.html
git clone https://github.com/hayagreevan-v/php-mysql-demo-web-server.git
cp ./php-mysql-demo-web-server/index.php /var/www/html/index.php
sudo systemctl restart apache2