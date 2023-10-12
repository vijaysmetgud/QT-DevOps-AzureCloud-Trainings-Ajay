Dockerfile Instructions:
------------------------

## FROM: 
 * set base image
 * this is for on which OS our application should run  or what is the software or dependency to run our application or Application name
 

## LABEL: 
 * it is metadata, not much useful, it is just understanding purpose who is author
 * or while creating the ec2 machine how we are giving tag name for machine it is just for our understanding purpose same way
 * Labels are key-value pairs and simply adds custom metadata to your Docker Images 


## RUN: 
* execute instructions for configuring your application
* it executes linux commands inside our container
* To execute any linux command 
* to create directory inside the container too 

## Expose: 
* expose container ports or telling on which port our application should run to docker deomon 
* Informs container runtime that the container listens on the specified network ports at runtime. but it doesn't mean that docker image will expose the port, while running docker image we need give -p to publish the port to docker image run


## CMD: 
* run the command during application startup
and here the docker command will be executing at the time of docker image startup will be executing still or until container runs it. 
* There can only be one CMD instruction in a Dockerfile. If you list more than one CMD then only the last CMD will take effect.

## ADD:
* instructions to copy the contents into image
* ADD supports to copy from url’s like `httpd` `https`
* if we want to copy some files from the urls to the destiny of ur docker image, then we can use it.
* The `ADD` instruction copies new files, directories or remote file URLs from `<src>` and adds them to the filesystem of the image at the path `<dest>`.

* https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar

* The file above will be downloaded from the specified URL and added to the container's filesystem at /tmp/spc 

* Another form allows you to simply specify the destination directory for the downloaded file.

```
ADD <src> <dest>
```

* Another feature of ADD is the ability to automatically unpack compressed files.

    * a local file in a recognized compression format (tar, gzip, bzip2, etc) then it is unpacked at the specified <dest> in the container's filesystem. 

## COPY:
* copy the files and directories from docker host/local system into filesystem of the image
*  The `COPY` instruction copies new files or directories from `<src>` and adds them to the filesystem of the container at the path `<dest>`.
```
COPY <src> <dest>
```
* COPY doesn't give any special treatment to archives.
  * If you COPY an archive file like (tar,zip etc)it  will land in the container exactly as it appears in the local system without any attempting to unpack it.

## WORKDIR:
* Any `RUN`, `CMD`, `ADD`, `COPY`, or `ENTRYPOINT` command will be executed in the specified working directory.
  * incase if we dint specify any WORKDIR then it will take default as /

## USER:
* `user` instruction in docker if we mention in the dockerfile means it will not create the `user` just it will switch to that mentioned `user`
* `user` means it will switch the `user` which we mentioned like `petclinic`, after creating `user` by `RUN` command if we dint mention then still it will run by default user called `/` or base image `user` if any.
* sets the username
* creating new user or group
* if we dint set the user then it will take default user when we use some base image refer below example:
   * The default user in a Dockerfile is the user of the parent image.
      * For example:
         * if your image is derived from an image that uses a non-root user/root user example: swuser/root
         * then RUN command in your Dockerfile will run as swuser/root user so to overcome this we will use our own `USER INSTRUCTION IN Dockerfile`

## ARG: 
* Parametrize while building image 
* `ARG` can provide a way to pass build time variables (they are available only during image building)
* The `ARG` instruction defines a variable that users can pass at `build-time` to the builder with the `docker build command` using the `--build-arg <varname>=<value>` `flag`. If a user specifies a build argument that was not defined in the Dockerfile, the build outputs a warning  
* once image is build and `ARG` is passed during, it will not be available later when running the container  

## ENV: 
* Environmental variables can be passed during running the container/container creation. 
* Sets an environment variable means we can define our user id or password during creating database user id and password
* ENV statement sets the environment variables both during the build and when running the result.
* For example, ENV PATH=/usr/local/nginx/bin:$PATH
  
## ENTRYPOINT:
* we use entrypoint to execute multiple commands inside the container 
* Allows you to configure a container that will run as an executable
* ENTRYPOINT - ENTRYPOINT has two forms:
* The exec form, which is the preferred form --  ENTRYPOINT ["executable", "param1", "param2"]
* The shell form - ENTRYPOINT command param1 param2

## VOLUME:
* The `VOLUME` instruction creates a mount point with the specified name and marks it as holding externally mounted volumes from native host or other containers. 

## ONBUILD:
 * Adds an instruction to be executed later, when the image is used as the base for another build

## STOPSIGNAL:
 Sets the system call signal that will be sent to the container to exit, SIG<NAME>, SIGTERM





