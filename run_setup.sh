#! /usr/bin/bash


# Get Environment Variables
set -a && source .env && set +a

# Run docker compose up 
docker compose up --build -d 

# Download WordPress
docker compose run --rm wp core download

# Create WordPress Config 
docker compose run --rm wp config create --dbname=${MYSQL_DB_NAME} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=db:3306

# Install WordPress
docker compose run --rm wp core install --url=localhost:8089 --title=WPBox --admin_user=admin --admin_password=admin --admin_email=info@example.com

