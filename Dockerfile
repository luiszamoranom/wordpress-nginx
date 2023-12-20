# Variables de entorno GCrun
# WORDPRESS_DB_HOST: url de la instancia de gcrun 
# WORDPRESS_DB_USER: nombre de usuario creado en cloudsql
# WORDPRESS_DB_PASSWORD: contraseña creada en cloudsql
# WORDPRESS_DB_NAME: nombre de la base de datos creada en cloudsql
FROM php:fpm

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN curl -o wordpress.tar.gz -fSL "https://wordpress.org/latest.tar.gz" \
    && tar -xzf wordpress.tar.gz -C /var/www/html --strip-components=1 \
    && rm wordpress.tar.gz \
    && chown -R www-data:www-data /var/www/html

FROM nginx:alpine

COPY --from=0 /var/www/html /var/www/html

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

