#!/bin/bash
 
# Para mostrar los comandos que se van ejecutando
set -ex

# Esto es un comentario 
echo "Esto es un texto"

# Actualizamos la lista de repositorios
 apt update
# Actualizamos los paquetes del sistema
# apt upgrade -y

# Instalamos el servidor APACHE
sudo apt install apache2 -y

# Instalar php 
sudo apt install php libapache2-mod-php php-mysql -y

# Copiamos archivo de configuracion de apache
cp ../conf/000-default.conf /etc/apache2/sites-available

#Reiniciamos servicio apache
systemctl restart apache2

# Cambiamos usuario y propietario de var/www/html

chown -R www-data:www-data /var/www/html
