FROM craigrhodes/fs_site

# Move to mounted(/shared) directory
WORKDIR /usr/src/fs_site

# Declare environment variables for the image
ENV FS_PORT 8000
ENV FS_PASS grapes1234
ENV FS_HOST 0.0.0.0

# Run the init script on `docker run`
CMD ./docker_init.sh && python manage.py runserver ${FS_HOST}:${FS_PORT}
