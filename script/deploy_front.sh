#!/bin/bash
 
# Para mostrar los comandos que se van ejecutando
set -ex

# Actualizamos la lista de repositorios
 apt update
# Actualizamos los paquetes del sistema
# apt upgrade -y

# Importamos variables de configuracion
source .env

# Eliminamos las descargas previas
rm -rf /tmp/wp-cli.phar

# Descargamos la herramienta wp-cli 
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -P /tmp

# Damos permisos de ejecución
chmod +x /tmp/wp-cli.phar

# Movemos el archivo a /usr/local/bin
mv /tmp/wp-cli.phar /usr/local/bin/wp

# Eliminamos las instalaciones previas de WP
rm -rf /var/www/html/*

# Descargamos código fuente como root y en español
wp core download --locale=es_ES --path=/var/www/html --allow-root

# Configuración de wordpress
wp config create \
  --dbname=$WORDPRESS_DB_NAME \
  --dbuser=$WORDPRESS_DB_USER \
  --dbpass=$WORDPRESS_DB_PASSWORD \
  --dbhost=$WORDPRESS_DB_HOST \
  --path=/var/www/html \
  --allow-root

# 
wp core install \
  --url=$CERTIFICATE_DOMAIN \
  --title="$WORDPRESS_TITLE" \
  --admin_user=$WORDPRESS_ADMIN_USER \
  --admin_password=$WORDPRESS_ADMIN_PASSWORD \
  --admin_email=$WORDPRESS_ADMIN_EMAIL \
  --path=/var/www/html \
  --allow-root

# Opción para cambiar las rutas y ponerlas de forma "bonita"
# wp option update permalink_structure '/%postname%/' --allow-root --path=/var/www/html

#--------------------------------------------------------------------------------------------
#----------T E M A S ------------------------------------------------------------------------
# Comando para buscar temas
# wp theme search sport --path=/var/www/html
# Instalamos temas (en mi caso uno de naturaleza que me gustó)
wp theme install zino --activate --allow-root --path=/var/www/html 
#--------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------
#------------P L U G I N S ------------------------------------------------------------------
# Instalamos plugin de SEO
wp plugin install wordpress-seo --activate --allow-root --path=/var/www/html

# Instalamos plulgin de formularios
wp plugin install contact-form-7 --activate --allow-root --path=/var/www/html

# Plugin para hacer copias de seguridad programadas 
wp plugin install updraftplus --activate --allow-root --path=/var/www/html

# Plugin que hace tu sitio más seguro
wp plugin install wordfence --activate --allow-root --path=/var/www/html

# Plugin para optimizar el almacenamiento en caché
wp plugin install w3-total-cache --activate --allow-root --path=/var/www/html


# Instalamos el plugin para ocultar la ruta de admin
# wp plugin install wps-hide-login --activate --allow-root --path=/var/www/html

# Cambiamos la opción para ocultar la ruta gracias al plugin anterior
# wp option update whl_page "/home" --path=/var/www/html --allow-root

# Activar pluggins
# wp plugin install bbpress --activate

#----------------- FIN PLUGINS ----------------------------------------
#----------------------------------------------------------------------

# Movemos el archivo .htaccess para las rutas permanentes
# cp -f ../htaccess/.htaccess /var/www/html

# Cambiamos propietario de la carpeta
chown -R www-data:www-data /var/www/html



