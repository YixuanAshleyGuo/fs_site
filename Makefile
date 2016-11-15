
# Use 8000 as default port if none specified as environment variable
FS_PORT ?= 8000

.PHONY: build run clean interact 

# Use this target with the FS_PORT environment variable set 
#  if you want a port other than 8000.
run: 
	docker run -p "$(FS_PORT):$(FS_PORT)" -e "FS_PORT=$(FS_PORT)" -v "`pwd`:/usr/src/fs_site" -it craigrhodes/fs_site

# Use this target if you want a custom shell session in the image!
interact: 
	docker run -p "$(FS_PORT):$(FS_PORT)" -p 80:80 -e "FS_PORT=$(FS_PORT)" -v "`pwd`:/usr/src/fs_site" -it craigrhodes/fs_site ./docker_interact_init.sh

# Feel free to ignore this... just a way to get a custom build
build:
	docker build -t craigrhodes/fs_site .

# Use this to clean up a custom fs-site image and .pyc files
clean:
	docker rmi fs-site
	rm -rf *.pyc
