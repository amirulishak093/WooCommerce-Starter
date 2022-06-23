#!/usr/bin/env sh

set -e

[ -f wp-config.php ] || wp --allow-root config create \
    --dbhost="$WORDPRESS_DB_HOST" \
    --dbname="$WORDPRESS_DB_NAME" \
    --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$WORDPRESS_DB_PASSWORD"

wp core install --allow-root \
    --url="$WORDPRESS_URL" \
    --title="$WORDPRESS_TITLE" \
    --admin_user="$WORDPRESS_ADMIN_USER" \
    --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
    --admin_email="$WORDPRESS_ADMIN_EMAIL" \
    --skip-email

wp --allow-root rewrite structure "$WORDPRESS_PERMALINK_STRUCTURE"

wp --allow-root plugin delete akismet hello
wp --allow-root plugin install --activate --force \
  woocommerce

echo "Initialization complete. You can now log into WordPress at: $WORDPRESS_URL/wp-login.php ($WORDPRESS_ADMIN_USER/$WORDPRESS_ADMIN_PASSWORD)"