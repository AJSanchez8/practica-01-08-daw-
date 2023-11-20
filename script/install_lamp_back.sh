#!/bin/bash
 
# Para mostrar los comandos que se van ejecutando
set -ex

# Actualizamos la lista de repositorios
apt update

# Instalamos MYSQL SERVER
apt install mysql-server -y

# Configuramos parametro bind-address
sed -i "s/127.0.0.1/$WORDPRESS_DB_HOST/" /etc/mysql/mysql.conf.d/mysqld.cnf

# Reiniciamos el servicio MySQL
systemctl restart mysql