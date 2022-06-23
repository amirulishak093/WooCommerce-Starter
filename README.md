# WooCommerce-Starter

> A WooCommerce development environment using Nginx and Docker.

## Prerequisite

1. Docker
2. Node.js (for running npm scripts)

## Getting Started

1. Generate self-signed SSL certificate by running
   `scripts/create-cert.sh`
2. Copy `.env.example` file as `.env` file and replace them according to your environment
3. Build and run the containers by running
   `npm start`
4. Run `npm run postinstall` to skip Wordpress installation process.

Wordpress site can be accessed at [localhost:8080](http://localhost:8080) or [localhost:8080/wp-login.php](http://localhost:8443/wp-login.php) (if you skipped the installation process)
