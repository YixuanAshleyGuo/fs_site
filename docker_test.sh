#!/bin/bash

# NOTE: THIS FILE IS INTENDED TO BE USED BY THE DOCKER INSTANCE ONLY

# Start MySQL
service mysql start

# Create user with full permissions
echo "CREATE USER 'teamace'@'localhost' IDENTIFIED BY 'freesource'; FLUSH PRIVILEGES;" | mysql -u root --password=${FS_PASS} 2>/dev/null

# Alter user permissions
echo "GRANT ALL ON *.* to teamace@localhost;" | mysql -u root --password=$FS_PASS 2>/dev/null

# Make database migrations before running project (in case model updated)
echo "Making migrations..."
python manage.py makemigrations
python manage.py test freesources
