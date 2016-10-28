#!/bin/bash

# NOTE: THIS FILE IS INTENDED TO BE USED BY THE DOCKER INSTANCE ONLY

# Start MySQL
service mysql start

# Create DB
echo "CREATE DATABASE FreeSource;" | mysql -u root --password=$FS_PASS 2>/dev/null

# Create user with full permissions
echo "CREATE USER 'teamace'@'localhost' IDENTIFIED BY 'freesource'; GRANT ALL ON FreeSource.* TO 'teamace'@'localhost'; FLUSH PRIVILEGES;" | mysql -u root --password=${FS_PASS} 2>/dev/null

# Initialize database
echo "Initializing database..."
mysql -u root --password=$FS_PASS FreeSource < Freesources_demo1.sql 2>/dev/null

# Make database migrations before running project (in case model updated)
echo "Making migrations..."
python manage.py makemigrations freesources
python manage.py migrate
