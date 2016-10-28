This is a web application developed for an assignment in Advanced Software Engineering at Columbia University.
Freesources aims to create database of free items for public use that is contributed to and maintained by users.

**Docker**  
This project is using docker for a consistent development environment.

The image is hosted on dockerhub at https://hub.docker.com/r/craigrhodes/fs_site/ -- the repository is craigrhodes/fs_site.

To pull the image to your computer:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`docker pull craigrhodes/fs_site`  
Note that you will not have to pull the image as it will be pulled for you automatically if it is not cached locally.  

*Docker Options (Read only if you're interested)*  
This is just an explanation of some of the docker commands from the Makefile:  
docker build -t fs-site .:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* `docker build` you build a docker image (by parsing the Dockerfile).  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* `-t fs-site` is saying we want to assign this image a tag-- this is so we can just refer to the image as `fs-site` instead of its container ID.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* `.` is the current directory (as expected). This tells docker build to look in the current directory for any files referenced in the Dockerfile.

``docker run -p "$(FS_PORT):$(FS_PORT)" -e "FS_PORT=$(FS_PORT)" -v "`pwd`:/usr/src/fs_site" -it craigrhodes/fs_site``:   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* `docker run` is how you launch a docker container from an image.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* `-p "$(FS_PORT):$(FS_PORT)"` says that you want to expose the port number from the FS\_PORT variable to the host OS (your actual operating system) as that same port. If you did not do this, the web app would only be available inside the container and nowhere else.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* `-e "FS\_PORT=$(FS_PORT)"` lets us specify an environment variable for the container. In this case, FS\_PORT environment variable is being set according to the value of the FS\_PORT environment variable on your own OS.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* ``-v "`pwd`:/usr/src/fs_site"`` allows us to mount a folder on our computer's filesystem inside the container. This makes it so we don't have to rebuild the image to copy the files into the container. Any changes we make inside the working directory (\`pwd\` = the result of Print Working Directory) are immediately reflected in the /usr/src/fs\_site folder in the container.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;* `-it craigrhodes/fs_site` uses the `-i` flag to tell docker to NOT detach stdin from the container (so we can still interact with it once it's launched). The `-t` flag followed by craigrhodes/fs_site specifies the tag of the image to run (craigrhodes/fs_site is the tag of the image we're using).  

*Environment Variables*
The container uses the following environment variables:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FS_HOST -- This is just the hostname/ip address to use.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FS_PORT -- This is the port for the web app to listen on.  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;FS_PASS -- This is the password for the 'teamace'@'localhost' mysql user.  

FS\_PORT is currently the only one that we can explicitly specify on the host machine through our own environment variable. This is an example of setting FS_PORT on your own OS:
export FS\_PORT=8100

*Docker Scripts*  
The project contains a few shell scripts beginning with "docker_". These scripts are intended for use **INSIDE A DOCKER CONTAINER ONLY**. There is no point in running these scripts outside of a docker container for the image.  

You do not have to worry about any of these scripts except for docker_run.sh... and only if you choose the `interact` make target.  

*docker_init.sh*  
This is just a clean way to set up the database and do any necessary environment adjustments.  

*docker_interact_init.sh*  
This is the same as docker_init.sh except it drops you into a BASH session in the docker container afterward instead of immediately running the web app.  

*docker_run.sh*  
If you choose to run the `interact` target of the Makefile, this is just a convenient way for you to run the `python manage.py runserver $FS_HOST:$FS_PORT` command. To run, just do:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`./docker_run.sh`  
inside the container.

**Makefile Targets**  
The Makefile makes using docker much more convenient. Just type `make` to run the django server (the `run` target is the default). These are all the targets you can use:  

*make run*  
The `run` target runs the django server by launching the craigrhodes/fs_site image with some configuration options specified.  

*make interact*  
The `interact` target launches a craigrhodes/fs_site container and performs all the configuration necessary to start the django server, but instead of running the django server, you are dropped into a BASH shell session inside of the container.  

*make clean*  
The `clean` target will clean up the custom fs-site docker image (if you typed `make build`) and .pyc files.  

