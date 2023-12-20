# Variables de entorno GCrun
# WORDPRESS_DB_HOST: url de la instancia de gcrun 
# WORDPRESS_DB_USER: nombre de usuario creado en cloudsql
# WORDPRESS_DB_PASSWORD: contraseña creada en cloudsql
# WORDPRESS_DB_NAME: nombre de la base de datos creada en cloudsql
FROM nginx:alpine

COPY /var/www/html /var/www/html

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

