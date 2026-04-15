#!/bin/bash

service mariadb start

while ! mysqladmin ping --silent; do
    sleep 1
done

mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%' WITH GRANT OPTION;"
mariadb -e "FLUSH PRIVILEGES;"

mysqladmin -u root shutdown
exec mysqld --user=mysqld 
