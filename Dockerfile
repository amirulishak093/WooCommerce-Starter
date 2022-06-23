FROM wordpress:6-fpm

# install_wordpress.sh & misc. dependencies
RUN apt-get update; \
	apt-get install -yq mariadb-client sudo less

# wp-cli
RUN curl -sL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o wp; \
	chmod +x wp; \
	mv wp /usr/local/bin/; \
	mkdir /var/www/.wp-cli; \
	chown www-data:www-data /var/www/.wp-cli

# ensure wordpress has write permission on linux host
RUN chown -R www-data:www-data /var/www/html