#!/bin/bash
 
# Para mostrar los comandos que se van ejecutando
set -ex

# Actualizamos la lista de repositorios
 apt update

# Actualizamos los paquetes del sistema
# apt upgrade -y

# Importamos las variables del archivo
source .env


# Instalamos snap
snap install core;

# Actualizamos snap
snap refresh core

# Eliminamos instalaciones previas de Certbot
apt remove certbot

# Instalamos el cliente de Cerbot
snap install --classic certbot

# Creamos el enlace simcolico de cerbot
ln -fs /snap/bin/certbot /usr/bin/certbot

# Solicitamos un certificado de lets encryp con certbot
certbot\
    --apache\
    -m $CERTIFICATE_EMAIL\
    --agree-tos\
    --no-eff-email\
    -d $CERTIFICATE_DOMAIN\
    --non-interactive
