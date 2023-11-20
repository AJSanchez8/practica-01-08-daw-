# Practica-01-08-daw Antonio José Sánchez González

Esta práctica consistía en separar el despliegue de la aplicación, los pasos serian los mismo a seguir que en la practica anterior [enlace](https://github.com/AJSanchez8/practica-01-07-daw)

Pero, con la diferencia de que estamos separando el FrontEnd y el BackEnd

Uno de los cambios más importantes en el archivo [.env](./script/.env) ya que hemos sustituido estas dos variables
```bash
WORDPRESS_DB_HOST=172.31.83.46
IP_CLIENTE_MYSQL=172.31.91.97
```
Por las IPs privadas la primera, para conectar con el __BackEnd__ y la segunda para conectar con el __FrontEnd__

## FRONTEND
El resto de pasos son los mismos, para [instalar](./script/install_lamp_front.sh) la pila LAMP en el __FrontEnd__ hemos borrado la parte que instalaba MySQL.

En la parte del [despliegue](./script/deploy_front.sh) de la aplicación hemos quitado la parte en la que se creaba la base de datos y el usuario para wordpress

## BACKEND
En el BackEnd hemos creado un [archivo](./script/install_lamp_back.sh) para que la pila lamp solo contenga la instalación de MySQL y la conexion

En la parte del [despliegue](./script/deploy_back.sh) ha sido donde hemos creado la base de datos y el usuario.

