Application Deployment – Generation Wise:
------------------------------------------

* Earlier we used to run applications directly on physical servers:

* then we moved to hypervisors to cut down the Capex (Capital Expenditure) and OpEX (Operation Expenditure)

* for above both below is example proof:

  * ![Preview](./Images/docker1.png)

* Companies like VmWare are very popular in Hypervisor space

### Then docker happened/came:

* ![Preview](./Images/docker2.png)

What is Docker?
----------------

* DotCloud was working on building PaaS, to make this work they have created an opensource framework for creating containers easily which was called as Docker.

* This became an overnight success and the company became Docker Inc.
* [Refer Here](https://www.youtube.com/watch?v=wW9CAH9nSLs) for demo of Docker by its creator 10 years ago.
* As of now docker runs natively on windows as well
    * ![Preview](./Images/docker3.png)

Docker Container Creation:
---------------------------

* Create a DockerHub Account [Refer Here](https://hub.docker.com/signup)

* Navigate to Docker playground [Refer Here](https://labs.play-with-docker.com/), Login with docker hub and start playing with docker playground
  * ![Preview](./Images/docker4.png)

* Docker Playground gives us a linux instance with Docker pre installed for 4 hours of time

* Note: If lot of users access in parallel, Docker Playground will have some issues/down time  
* Shortcut for full screen Toggle full screen screen `ALT + Enter`

   * ![Preview](./Images/docker5.png)

* Dealing with command line:

   * Instruction Manual: 
   
         docker --help
   * Cheatsheat [Refer Here](https://docs.docker.com/get-started/docker_cheatsheet.pdf)      

### Creating a Docker container Process:

  * ![Preview](./Images/docker6.png)

* When we install docker we get two major components
    * docker client
    * docker engine (server)

* To create container user has to execute docker container run <image_Name>

* docker daemon will received this request and checks if the image is present locally.

* If it is not present, it downloads from any registry or  (default registry is docker hub).

* once we run command which is mentioned in the below screen shot, docker will search for image in locally if it is find then image will run in the container, if not found then docker will tries to pull from registry and make it run in the container

* ![Preview](./Images/docker7.png)

What does docker container provide:
-----------------------------------

* Every application needs
  * a process to execute as this allocates CPU and RAM
  * a network interface for accessing the application
  * a storage space or mounts which will have os and   other necessary contents

* when we check the ifconfig command we will get two ip address one is lo(loop back), and another is eth0, this is known as network interface
  * we get two network interface in linux or windows that is below: 
    * loop back(lop):
      * is a localhost ip address
      * this network interface try to access local system only: example below.
         * `https://localhost/127.0.0.1:8080`
    * eth0: 
      * is a application ip address    
* lsblk command in linux:
   * it is known as block devices:
      * ![Preview](./Images/docker8.png)

#### As we have observed in the class all of the above were present in linux as well as windows server or vms:

### Contents:

* Now lets login into container and explore.
* As we have seen container also has network interfaces, its own process tree which starts from pid1 and a filesystem from `/ (root)`
* below screen shot proves that above two line are there even in side the container:
   * ![Preview](./Images/docker9.png)
   * ![Preview](./Images/docker10.png)
   * ![Preview](./Images/docker11.png)


* As of now container is an isolated area which has its own
  * process tree
  * network interface
  * file system
  * users  


* The limitations or restrictions on isolated areas can be acheived using control groups
  * ![Preview](./Images/docker11.png)

  * Initially docker used lxc (linux containers) to create containers. LXC are part of linux kernel releases

  * Docker has created a component which is called as libcontainer, which is a low level component to create containers using namespaces and cgroups.

  * Refer this below article for docker containerization understanding:
     [Refer Here](https://directdevops.blog/2019/01/31/docker-internals/)

# Standards in Containers:

* another company who were developing the containers called rkt container [Refer Here](https://www.redhat.com/en/topics/containers/what-is-rkt)

* having two products for business is very good.
* but having same kind or product or way for one product is very bad for business that is what rkt was doing it.
* then two companies came together that rkt and docker and started developing the container called `OCI``(open container initiative)`
* Disadvantages for rkt and docker is if we choose and start working one technologies then means we cannot move to another technologies. so why both merged it.  

* OCI [Refer Here](https://opencontainers.org/)
* containerd  [Refer Here](https://containerd.io/)

Docker Architecture:
--------------------

* Earlier docker architecture had only two components:
   * docker client
      * docker client it is a commandline to interact with  docker daemon
      * docker daemon 
         * will take the request from docker client and pull the image, make it run.

   * ![Preview](./Images/docker13.png)

### Then Later Changes in Docker Architecture below:
 * Then docker has made the changes in architecture with layered components
   * docker client: docker client/command line to interact with daemon
   * docker daemon: This is service which forwards the request to containerd
   * containerd: manages the container lifecycle
   * runc: This creates container using libcontainer 
   * shim: once the contianer is created runc makes shim the parent of container, this helps docker containers to be in running state even if the docker components are upgrading.
  * [Preview](./Images/docker14.png)

# Docker installation – Easy way on linux machines:
* Create a linux vm (ubuntu 22.04)
* use the docker installation script [Refer Here](https://get.docker.com/)

  * to download above refer here script and run the script use below code:
 ```
curl -fsSL https://get.docker.com -o install-docker.sh
sh install-docker.sh
```
* After the installation execute the command to get version and you will see the failure to get the server version
```
docker version
```
* ![Preview](./Images/docker15.png)
* To solve this temporarily elevate the privileges use below command:
```
sudo docker version
```

* ![Preview](./Images/docker16.png)
* The reason is the user doesnot have permission to access unix socket
* socket at `unix:///var/run/docker.sock`. The permission to this exists for all the members of docker group, so lets add the current user to docker group

```
sudo usermod -aG docker <user-name>
sudo usermod -aG docker <ubuntu> => in my case ubuntu
exit
# relogin
```
* now issue is resolve after added the user to docker group below screen shot:
* ![Preview](./Images/docker17.png)

# Docker container lifecycle:
* overview
* ![Preview](./Images/docker18.png)

* Lets experiment this with nginx image [Refer Here](https://hub.docker.com/_/nginx)
* Create a container with name `mynginx` and image name `nginx`

```
docker container create --name mynginx nginx
```
![Preview](./Images/docker20.png)

* Lets start the container which requires container id or name

![Preview](./Images/docker21.png)

* Now lets pause and unpause the container
![Preview](./Images/docker22.png)

* Now, stop and remove the container
![Preview](./Images/docker23.png)

* Now run the container instead of creating it, run will create and run the container


# Containerization:
* This refers to the process of running the application in containers
* This majorly means creating a Dockerfile for every application developed by your dev team


## Case-Study: spring petclinic
* This is a sample java application
* Application download location [Refer Here](https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar)

* To run this application we need java 11 and 8080 port to access the application
* How this application is executed
![Preview](./Images/docker24.png)

### Manual steps: to this application:
   * Create an ubuntu linux vm and login into that
   * Now install jdk 11

```
sudo apt update
sudo apt install openjdk-11-jdk -y
```

* Now download the application
```
cd /tmp
wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar
```
* Now to run the application with below command:

```  
java -jar /tmp/spring-petclinic-2.4.2.jar
```
![Preview](./Images/docker25.png)

* Now access the application `http://<public-ip>:808`

![Preview](./Images/docker26.png)

### Another process or Manual Steps to above application through Docker:

* not to follow this way since it useless way, because when ever developer change his code then we needs to do same steps manually it will not be automated so it not good idea to follow
#### Steps:
```
docker pull openjdk:11
docker run -it --name java11 -p 40000:8080 openjdk:11 /bin/bash
java -jar /spring-petclinic-2.4.2.jar
=> then now until we create the image out of container to exit from /bin/bash
docker container --help
docker container commit --help
docker container commit java11 spc:manualwork
docker image ls
```

## Problem statement:
* We need to create a docker image for the application whenever there are code changes.
* The process
  * cannot be manual
  * has to simple
  * supports making changes
  * steps needs to be version controlled. 


## Docker Image information:
* Docker hub has 3 types of images
  * official images
  * Verified Publisher
  * Community Images

* Registries like DockerHub have repositories.
* Each Docker Image will have a Repository
* Docker image name convention  


###  For Offical Images
```
<repository>:<tag>

Image Name
nginx 
    => official repo => nginx
    => tag is latest
```

### For Non Official Images:

```
<username/registry>/<repository>:<tag>

Image Name
jenkins/jenkins:lts-jdk11
    => username = jenkins
    => repository => jenkins
    => tag => lts-jdk11
```

* Tag in Docker image represents a Image version.
* If the tag is not specified docker will replace tag with `latest version`


# Port forwarding/information:

#### Overview:
![Preview](./Images/docker27.png)

* Example:
```  
docker container run -d --name mynginx -p 44444:80 nginx
```

![Preview](./Images/docker28.png)


* Please Note:
    * 44444 port => is known as host port left side.
    * 80 port => is known as container port right side.
* with publishing host port number to container port we are unable to access our container application

* `-p` => this means small letter giving while publish the port number for container is we are giving some known port number 

* `-P` => this means we are not giving any port number as per our requirements, we are telling docker to assign random port number


* in our system/os we have ports range from `0` to `65535` so within this range of port we can give anything port number for our os host port. 

# Ways of Working Building Docker Images
 * Choose the right base image
* Composing a Dockerfile

* Simple Docker File:
   * Path: `./Dockerfile-1`

```
docker build -t localhost/spc -f Dockerfile .
docker image build -t spc:1.0 . 
docker image ls
```

# Run Image Testing Observation:
![Preview](./Images/docker29.png)

* Observations above image screen shot:
  * Not all the containers when executed will be in running state. the alpine container with the name interactive went into exited state

### information about interactive mode(-it), Deattached mode(-d) and Attached mode:

* IN detached mode the container will be started in the background whereas in attached mode the container will be started in foreground and STDIN, STDOUT, STDERR of the container will be attached to your terminal. Your terminal becomes unusable.
* IN interactive mode we will login into container terminal for some reason.

### Docker container can be executed in 3 ways
* detached
* attached
* interactive


# Dockerfile:
### Using docker file creating Containerization:
* Dockerfile is a set of instructions which help in building the docker image.
* To build a docker image (which is oci compliant) we need to
   * choose a base image
   * provide additional instructions to containerize the application
* For whole set of docker file instruction refer below:
  * [Refer Here](https://docs.docker.com/engine/reference/builder/)

Dockerfile Instructions:  
------------------------

### FROM: set base image
  * [Refer Here](https://docs.docker.com/engine/reference/builder/#from) for official docs

### LABEL: set metadata
   * [Refer Here](https://docs.docker.com/engine/reference/builder/#label) for official docs

### RUN: execute instructions for configuring your application
  * [Refer Here](https://docs.docker.com/engine/reference/builder/#run) for official docs
  * its is used to run linux command so before we use run check whether linux commands are present in the container then tried to use, if not find the alternative way or install required software 

### Expose: expose container ports
  * [Refer Here](https://docs.docker.com/engine/reference/builder/#expose) for official docs


### CMD: run the command during startup
   * [Refer Here](https://docs.docker.com/engine/reference/builder/#cmd) for official docs

### ADD: ADD supports to copy from url’s 
* instructions to copy the contents into image
```
ADD <src> <dest>
```
* [Refer Here](https://docs.docker.com/engine/reference/builder/#add) for official docs

### COPY: copy can copy from docker host into image
* instructions to copy the contents into image
* [Refer Here](https://docs.docker.com/engine/reference/builder/#copy) for official docs
```
COPY <src> <dest>
```

### WORKDIR: working directory
* [Refer Here](https://docs.docker.com/engine/reference/builder/#workdir) for official docs

### USER: sets the username
* [Refer Here](https://docs.docker.com/engine/reference/builder/#user) for official docs

### ARG: Parametrize while building image
* ARG can provide a way to pass build time variables (they are available only during image building)
* [Refer Here](https://docs.docker.com/engine/reference/builder/#arg) for official docs

### ENV: Environmental variables can be passed during container creation
* [Refer Here](https://docs.docker.com/engine/reference/builder/#env) for official docs

### ENTRYPOINT: we use entrypoint to execute multiple commands inside the container
* [Refer Here](https://docs.docker.com/engine/reference/builder/#entrypoint)
* about entrypoint below explaination as given please go throug it.

## Volume: Creates a mount point and marks it as holding externally mounted volumes from native host or other containers, to store the data 
* [Refer Here](https://docs.docker.com/engine/reference/builder/#volume)
* [Refer Here](https://docs.docker.com/storage/volumes/)

# Building springpetclinic

#### Important Steps to Note:

* while using `Run` command needs to check inside the container to add the `user` in the docker file and also using the different options for the `user`:

```
 docker container run -it  amazoncorretto:11-alpine3.17 /bin/sh
``` 
* after getting into container inside execute below commands to know what command is present inside the container to create or add user 
```
groupadd --help
useradd --help
adduser --help

Usage: adduser [OPTIONS] USER [GROUP]

Create new user, or add USER to GROUP

        -h DIR          Home directory
        -g GECOS        GECOS field
        -s SHELL        Login shell
        -G GRP          Group
        -S              Create a system user
        -D              Don't assign a password
        -H              Don't create home directory
        -u UID          User id
        -k SKEL         Skeleton directory (/etc/skel)
/ #
```
* Refer Below Screen Shot, using `Run` command added the user called `rajesh` and created home directory called `downloading_software` username passed in `-D`

![Preview](./Images/docker35.png)
![Preview](./Images/docker36.png)
![Preview](./Images/docker37.png)
![Preview](./Images/docker38.png)


* after used `Run`, `USER`, `WORKDIR` and `ADD` command wrote docker file: 

```
FROM amazoncorretto:11-alpine3.17
LABEL author="ajay"
RUN adduser -h /petclinic -s /bin/sh -D /petclinic
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar  spring-petclinic-2.4.2.jar
USER petclinic
WORKDIR /petclinic
EXPOSE 8080
CMD [ "java","-jar","spring-petclinic-2.4.2.jar" ]
```
* now run the container using above docker instruction using in dockerfile
```
 docker image build -t petclinic:v1 .
 ```
* now got error because `cmd` command executing the application with `root user` since we have created the petclinic as user and directory `java -jar spring-petclinic-2.4.2.jar`

* refer below screen shot for error:
![Preview](./Images/docker32.png)
![Preview](./Images/docker33.png)


* so now change the ownership for folder where it stored the destination `spring-petclinic-2.4.2.jar` in `ADD` command below code correction find it.
```
FROM amazoncorretto:11-alpine3.17
LABEL author="ajay"
RUN adduser -h /petclinic -s /bin/sh -D /petclinic
ADD --chown=petclinic:petclinic https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar  /petclinic/spring-petclinic-2.4.2.jar
USER petclinic
WORKDIR /petclinic
EXPOSE 8080
CMD [ "java","-jar","spring-petclinic-2.4.2.jar" ]
```

* refer below screen shots after correction done to `ADD` command changed ownership for created `user` and also add created directory location for downloading 

![Preview](./Images/docker34.png)


### Using `ARG` variable worte docker file below:
* now we have given user inputs or option for user to change the default `ARG` since what ever default is there user can change it while building the image see command for below examples:
* this is `ARG` is only while building the image not running the container. 

```
FROM amazoncorretto:11-alpine3.17
LABEL author="ajay"
ARG DOWNLOAD_LOCATION='https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar'
ARG USERNAME='petclinic'
ARG HOMEDIR='/petclinic'
RUN adduser -h /petclinic -s /bin/sh -D /petclinic
ADD --chown=${USERNAME}:${USERNAME} ${DOWNLOAD_LOCATION} ${HOMEDIR} /spring-petclinic-2.4.2.jar
USER ${USERNAME}
WORKDIR ${HOMEDIR}
EXPOSE 8080
CMD [ "java","-jar","spring-petclinic-2.4.2.jar" ]
```
* below is the command to use `ARG` while building the image:

```
docker image build --build-arg USERNAME=satish --build-arg HOMEDIR=/mtp -t spc:1.0 .
```

* refer the below screen shot for user passed the new ARG while building the image so that while building the image it took new values which user passed it.

![Preview](./Images/docker39.png)


### Using `ENV` variable wrote the docker file below:

```

FROM amazoncorretto:11-alpine3.17
LABEL author="ajay"
ARG DOWNLOAD_LOCATION='https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar'
ARG USERNAME='rajesh'
ARG HOMEDIR='/downloading_software'
ENV TEST=hello
RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
ADD --chown=${USERNAME}:${USERNAME} ${DOWNLOAD_LOCATION} ${HOMEDIR}/spring-petclinic-2.4.2.jar
USER ${USERNAME}
WORKDIR ${HOMEDIR} 
EXPOSE 8080
CMD [ "java","-jar","spring-petclinic-2.4.2.jar" ]
```

* while building the image nothing we have changed it below screen shot:

![Preview](./Images/docker40.png)

* below is the command to use `ENV` while running the container:

```
docker container run -d -e TEST=devops --name using-env -P env-test:1.0
```
* now while running the container user has passed different `env` value not given or taken default value which is mentioned in the docker file refer below screen shot:

* also after given different `env` we can see the environment variable added inside the container by executing below command and also refer the below screen shot: 

```
docker container exec using-env printenv
```

![Preview](./Images/docker41.png)

* now if user dint pass the new `env` value then it will take default value is given in the dockerfile below command and screen shot:

```
docker container run -d --name using-env1 -P env-test:1.0
```

```
docker container exec using-env1 printenv
```
![Preview](./Images/docker42.png)


## Game of Life – Exercise Solution:

* Manual steps to run game of life exercise:

```
docker run -d --name tomcat1 -P tomcat:9-jdk8

 docker container  ls

 docker exec -it tomcat1 /bin/bash

 wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war

To access the application below steps:

http://ipaddress:port/gameoflife
```

* refer below screen shot for above steps:
![Preview](./Images/docker43.png)


* Dockerfile steps to run same game of life for above:

```
FROM tomcat:9-jdk8
LABEL author="ajay"
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war  /usr/local/tomcat/webapps/
EXPOSE 8080
```
```
docker image build -t tomcat:9-jdk8 .

docker image ls

docker container run -d --name tomcat -P tomcat:9-jdk8

docker container ls

docker container exec -it tomcat /bin/bash
```

* To access the application below steps:

   `http://ipaddress:port/gameoflife`


* refer below screen shot:

![Preview](./Images/docker44.png)
![Preview](./Images/docker45.png)
![Preview](./Images/docker46.png)

## Nop Commerce Exercise:

* Manual Steps:

```
Take a base image with dotnet 7.0
copy the zip, unzip, create two folder bin, logs
Start the application by using /usr/bin/dotnet /nopCommerce/Nop.Web.dll --urls="http://0.0.0.0:5000"

mkdir nopCommerce
cd nopCommerce
sudo wget https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.4/nopCommerce_4.60.4_NoSource_linux_x64.zip
unzip nopCommerce_4.60.4_NoSource_linux_x64.zip
mkdir bin
mkdir logs
```

* [Refer Here](https://hub.docker.com/_/microsoft-dotnet-runtime/) for dotnet runtimes
*  [Refer Here](https://hub.docker.com/_/microsoft-dotnet-sdk/) for dotnet sdk

* Dockerfile Steps to run nopcommerce:

```
FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author="ajay"
COPY nopCommerce /nopCommerce
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
EXPOSE 5000
WORKDIR /nopCommerce
CMD ["dotnet", "Nop.Web.dll"]
```

or 

```
FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author=khaja
COPY nopCommerce /nopCommerce
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
EXPOSE 5000
WORKDIR /nopCommerce
CMD ["dotnet", "Nop.Web.dll","--URLS="http://0.0.0.0:5000"]
```

```
 docker image build -t nop:1.0 .

 docker image ls

  docker container run -it nop

  ls

  docker container run -d --name nop -P  nop:1.0

  docker container ls
  ```

* To access the application:

   `http://ipadress:hostportno`

## Multi staged dockerfile:

* [Refer Here](https://docs.docker.com/build/building/multi-stage/) For Multi Stage Dockerfile


* in multi staged dockerfile we can write multiple `From` and other things but what ever is our last session or last `From` that will be our docker image.
rest things will not be part of image they will be removed.

* Example below:

```
From alpine
Run update alpine

From openjdk
Run java --version

From Nginx
Run wegt
```

* so above first two `From` will be part of our image build for supporting software purpose, the last `From` be our image will create 
* then other two `From` will copy the content or supporting software for our docker image.
* so each `From` is called as stage and that is known as multi stage docker image or docker file.

* Example below multi stage dockerfile:

```
FROM alpine:3 AS downloader
ARG DOWNLOAD_LOCATION="https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.4/nopCommerce_4.60.4_NoSource_linux_x64.zip"
ADD ${DOWNLOAD_LOCATION} /nopCommerce/nopCommerce_4.60.4_NoSource_linux_x64.zip
RUN apk update && \
    apk add unzip && \
    cd /nopCommerce && \
    unzip nopCommerce_4.60.4_NoSource_linux_x64.zip && mkdir bin logs \
    && rm nopCommerce_4.60.4_NoSource_linux_x64.zip

FROM mcr.microsoft.com/dotnet/runtime:7.0
LABEL author="ajay" 
EXPOSE 5000
COPY --from=downloader /nopCommerce /nopCommerce
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
EXPOSE 5000
WORKDIR /nopCommerce
CMD ["dotnet", "Nop.Web.dll"]
```

* For above muti stage docker file refer below explaination:

* * With multi-stage builds, you use multiple `FROM` statements in your Dockerfile. Each `FROM` instruction can use a different base, and each of them begins a new stage of the build. You can selectively copy artifacts/zip/war file file from one stage to another, leaving behind everything you don't want in the final image.

* The following above Dockerfile has two separate stages: one for dowloading the zip file and unzipping it, and another for where we copy the .war file into final docker image.

* You only need the single Dockerfile. No need for a separate build script. Just run `docker build`

* The end result is a tiny production image with nothing but the .war file inside. None of the build tools required to build the application are included in the resulting image.

* How does it work? The second `FROM` instruction starts a new build stage with the `scratch` image as its base image. The `COPY --from=0/name-as downloader` line copies just the built .war file from the previous stage into this new stage. The microsoft SDK and any intermediate .war file are left behind, and not saved in the final stage image.

* **Name your build stages:**

* By default, the stages aren't named, and you refer to them by their integer number, starting with 0 for the first `FROM` instruction. However, you can name your stages, by adding an `AS <NAME>` to the `FROM` instruction. This example improves the previous one by naming the stages and using the name in the  `COPY`   instruction. This means that even if the instructions in your Dockerfile are re-ordered later, the `COPY` doesn't break.

* if we mention the name for stage it will take that name. 
* if we dint mention any name for stage then it will start taking default name like starting stage - 0 to n.. here ending stage is - 1 

* **Stop at a specific build stage:**
* When you build your image, you don't necessarily need to build the entire Dockerfile including every stage. You can specify a target build stage. The following command assumes you are using the previous `Dockerfile` but stops at the stage named `build`

`docker build --target <stage_name> build -t hello .`

```
docker image build  -t nop:1.2 .

docker image build --target imagebuild -t nop:0.0 .

docker container run -d --name nopgood -P nop:0.0

 docker container ls 
 ```

* To Access Applications:
`http://ipaddress:<port_no>`

## Sample:2

* build the spring petclinic application from code using jdk17 and maven

#### steps:
* code is available over github git clone https://github.com/spring-projects/spring-petclinic.git
* Ensure maven and jdk 17 exists. mvn package
* Now copy the jar into spc image

#### My steps:
```
local system login
git clone https://github.com/spring-projects/spring-petclinic.git
cd /spring-petclinic
vi Dockerfile
copy below code into Dockerfile

FROM maven:3-amazoncorretto-17 AS builder
COPY . /spring-petclinic
RUN  cd /spring-petclinic && mvn package


FROM amazoncorretto:17-alpine3.17 AS Imagebuild
LABEL author="ajay"
LABEL organization="learningthoughts"
ARG USERNAME='rajesh'
ARG HOMEDIR='/downloading_software'
ENV TEST=hello
RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
USER ${USERNAME}
WORKDIR ${HOMEDIR}
COPY --from=builder --chown=${USERNAME}:${USERNAME} /spring-petclinic/target/spring-petclinic-3.1.0-SNAPSHOT.jar "${HOMEDIR}/spring-petclinic-3.1.0-SNAPSHOT.jar"
EXPOSE 8080
CMD ["java", "-jar", "spring-petclinic-3.1.0-SNAPSHOT.jar"]

docker image build -t spc:1.0 .

docker image ls 

docker container run -d --name spring -P spc:1.0 
```

* To access Application:

`http://ipaddress:<port_no>`


## Process Of Docker image `Pull` and `Push` to different Registory  or Repository: 

#### Docker Hub 
 * Steps:
 
```
ubuntu@ip-172-31-27-74:~$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: ajaykumarramesh
Password:
WARNING! Your password will be stored unencrypted in /home/ubuntu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```
* Then Follow Below Steps:

```
docker image build -t nopcommerce:2.0 .

 docker images

 docker tag nopcommerce:2.0  localhost/nopcommerce:2.0

 docker tag localhost/nopcommerce:2.0 ajaykumarramesh/ajaykumar:nopcommerce-2.0

 docker push ajaykumarramesh/ajaykumar:nopcommerce-2.0

docker pull ajaykumarramesh/ajaykumar:nopcommerce-2.0
```
![Preview](./Images/docker54.png)


#### AWS
* Steps:

* Create `ECR` in Aws then follow below steps:

```
sudo apt install awscli

aws configure
AWS Access Key ID [None]: AKIA5VIYY73GKDHALAML
AWS Secret Access Key [None]: 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
Default region name [None]:
Default output format [None]:

ubuntu@ip-172-31-27-74:~$ aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 939039194828.dkr.ecr.us-west-2.amazonaws.com
WARNING! Your password will be stored unencrypted in /home/ubuntu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

* Then follow Below Steps:

```
docker build -t ajaykumar .
docker tag ajaykumar:latest 939039194828.dkr.ecr.us-west-2.amazonaws.com/ajaykumar:latest
docker push 939039194828.dkr.ecr.us-west-2.amazonaws.com/ajaykumar:latest
docker pull 939039194828.dkr.ecr.us-west-2.amazonaws.com/ajaykumar:latest
docker image ls
```

![Preview](./Images/docker47.png)
![Preview](./Images/docker48.png)


#### Azure
* Steps:

* Create `ACR` in Azure and follow `quickstart` documents for procedure and check `access key` for login credentials `username` and `password` then follow below steps:

```
docker login ajaykumar.azurecr.io
for username and password check accesskey and enble admin user
Username: ajaykumar
Password:
WARNING! Your password will be stored unencrypted in /home/ubuntu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded

docker build -t acr .
docker image ls
docker tag acr:latest ajaykumar.azurecr.io/acr:1.0
docker image ls
docker push ajaykumar.azurecr.io/acr:1.0
docker pull ajaykumar.azurecr.io/acr:1.0
```
![Preview](./Images/docker49.png)
![Preview](./Images/docker50.png)

#### JFROG

* Steps to create account:
   * Login using ur google account
   * create project
   * create repository 
      * select prebuilt repository
      * select docker  and create repository
  * in system enter
    * docker login 
    ```
    ubuntu@ip-172-31-27-74:~$ docker login practiceqt.jfrog.io
    Username: ajaykumar.fz16@gmail.com
    Password:
    WARNING! Your password will be stored unencrypted in /home/ubuntu/.docker/config.json.
    Configure a credential helper to remove this warning. See
    https://docs.docker.com/engine/reference/commandline/login/#credentials-store

    Login Succeeded
    ```
* refer below screen shot for above docker login credentials:

![Preview](./Images/docker51.png)

```
docker build -t jfrog .

docker images

docker tag jfrog:latest practiceqt.jfrog.io/docker-docker/jfrog:latest

docker push practiceqt.jfrog.io/docker-docker/jfrog

docker pull practiceqt.jfrog.io/docker-docker/jfrog
```

![Preview](./Images/docker52.png)

* below docker image scan report

![Preview](./Images/docker53.png)

* [Refer Here](https://practiceqt.jfrog.io/ui/scans-list/repositories/docker-docker-local/scan-descendants) Jfrog Account URL

#### Scan Docker Image:

* we can download `docker desktop` and `install extension marketplace` `Jfrog` through that we can scan all the docker image reer below screen shot

![Preview](./Images/docker55.png)

## Layers in Docker Image:

* Docker image is collection of read only image layers and meta-data

### Experiments:

* Pull the alpine:3.17 image and inspect and focus on layers

```
docker image pull alpine:3.17
docker image inspect alpine:3.17
```
* below screen shots show of alpine image there is only one layers because the alpine image instruction return only 1 each instruction works in docker as layers:
![Preview](./Images/docker56.png)

* Pull the jenkins/jenkins image and inspect and focus on layers

```
docker image pull jenkins/jenkins
docker image inspect jenkins/jenkins
```
* below screen shots show of jenkins image there is multiple layers because the jenkins image has multiple instruction so each instruction works in docker as layers:

![Preview](./Images/docker57.png)

* Use this below instruction in Dockerfile and build the image with name `exp:1.0`

```
FROM alpine:3.17

docker image build -t exp:1.0 .
```
* if directly we pull the image `alpine:3.17` from docker hub has same layer only `1`
* same instruction we put in the dockerfile and build the image `exp:1.0` also as same layer only `1`, there is no difference because both image as only `1` same `instruction`
* below screen shot proves it.

![Preview](./Images/docker58.png)

* **Now consider the below instruction in  dockerfile with name exp:1.1 and see the difference**

```
FROM alpine:3.17
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war /gameoflife.war
```

```
 docker image build -t exp:1.1 .
 docker images
 ```

* now observe the image size has been increased when we added above dockerfile one extra `instruction` 

![Preview](./Images/docker59.png)

* Now observe `1` layers also increased 
![Preview](./Images/docker60.png)

* Now as observed a new layer was created in `exp:1.1`

![Preview](./Images/docker61.png)

* **Now build the `exp:1.2` with the following below instruction in Dockerfile**

```
FROM alpine:3.17
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war /gameoflife.war
RUN mkdir test
RUN cp /gameoflife.war /test/gameoflife.war
```

```
docker image build -t exp:1.2 .
docker images
```
* now observe the image size has been increased when we added above dockerfile `3` extra `instruction`  

![Preview](./Images/docker62.png)

* Now observe `3` layers also increased

![Preview](./Images/docker63.png)
![Preview](./Images/docker64.png)

* Now we have observed above drawing screen shot that Writing too many RUN instructions is not a good idea, it looks climbsy so instead of writing the `Run` command to many time we can combine all the `Run` command in `one` and adding the  `\` next each line it will increase Readability of instruction. like below dockerfile code.

```
FROM alpine:3.17
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war /gameoflife.war
RUN mkdir test && \
    cp /gameoflife.war \
    /test/gameoflife.war \
```    

* Docker container when created will union all the image layers and one writable layer to create a logical disk. This is done by Storage Drivers. The most popular one is `overlay2`.
* refer below screen shot:
![Preview](./Images/docker65.png)

* [Refer Here](https://directdevops.blog/2019/09/27/impact-of-image-layers-on-docker-containers-storage-drivers/) for the article explaining layers and drivers.

* When we delete the container writable layer will also be deleted. To solve this we will learn docker volumes.

### Impact on layers or which Instructions will create layers:

* From
* ADD
* Run
* Copy

## ENTRYPOINT and CMD in docker files:

* Docker container when starting will use the following to formulate the start up command means at time of docker image start up.

```
ENTRYPOINT CMD # Both Entrypoint and CMD exists in Docker
ENTRYPOINT
CMD
```

* Whatever we have written in CMD can be overriten by passing arguments after image name during run/create

* refer below example for this above statement:

* using below instruction build dockerfile

```
FROM alpine:3.17
LABEL author="ajay"
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war  /gameoflife.war
Run mkdir test
Run cp /gameoflife.war  /test/gameoflife.war
CMD ["sleep", "1d"]
```

```
docker image build -t entrycmd:1.0 .
docker images
```

![Preview](./Images/docker66.png)

* Now above dockerfile observe carefully we have written `cmd sleep 1d` this means at the time of startup or appliation start time it will sleep for 1 day but this application if i run it should fail and container should not start because, i have not written anything to start up my application in `cmd`

```
docker container run -d --name exp entrycmd:1.0
docker container ls
```
![Preview](./Images/docker67.png)

* as per above screesn shot the image ran with mentione `cmd as sleep 1d` so application should not start it should be in exited state, but if we see the screen shot it saying that up and running , this means that what ever we mention in the   `cmd` will work so for 1 day it be showig as running post 1 day it will exited.


```
docker container run -d --name exp entrycmd:1.0

docker container run -d --name exp1 entrycmd:1.0 sleep 1s

docker container run -d --name exp3 entrycmd:1.0  echo hello
docker container ls -a
```

* check this below screen shot same as ran as `exp` but `exp` we mention as `cmd sleep 1d` so it showing like running and after 1 day it will exit.
where `exp1` and `exp2` samae `cmd sleep 1d` is written but even thosugh it is exited status application is not running.
* reason being after runing the container and after the image name we have passed something so because of that is exited can see in above command code session 
* refer below screen shot:

![Preview](./Images/docker68.png)
![Preview](./Images/docker69.png)


### Now see both `Entrypoint` and `CMD` in dockerfile

```
FROM alpine:3.17
ENTRYPOINT ["sleep"]
CMD ["1d"]
```

```
docker image build -t entrycmd:2.0 
docker container run -d --name exp4 entrycmd:3.0
docker container run -d --name exp5 entrycmd:3.0 10d
docker container run -d --name exp6 entrycmd:3.0 echo hello
docker container ls -a
```

![Preview](./Images/docker70.png)

* refer above screen shot for proof, in dockerfile we have mentioned `entrypoint` and `cmd` so when passing the arguments after image name only the `cmd` has overwritten but not `entrypoint`.

### To chage entrypoint in dockerfile

```
FROM alpine:3.17
ENTRYPOINT ["sleep"]
CMD ["1d"]
```

* we can change entrypoint by executing below command 

```
docker container run -d --name exp6 --entrypoint echo entrycmd:3.0  hello
```

* the output please refer  screen shot below:

![Preview](./Images/docker71.png)

#### Difference between fork vs exec linux:
* So the main difference between fork() and exec() is that fork starts new process which is a copy of the main process. the exec() replaces the current process image with new one, Both parent and child processes are executed simultaneously.

* [Refer Here](https://www.geeksforgeeks.org/difference-fork-exec/)

### Difference between shell form and exec form in Dockerfile

[Refer Here](https://emmer.dev/blog/docker-shell-vs.-exec-form/)

[Refer Here](https://engineering.pipefy.com/2021/07/30/1-docker-bits-shell-vs-exec/)

## Docker volumes:

#### Volumes definition:-

* Volumes are the preferred mechanism for persisting data generated by and used by Docker containers.
* Volumes are used to persist docker container data on Host OS, so we can have the data even if the container is deleted.
* If we don’t provide the physical location for persisting the data, then data will be stored inside the container and data will be deleted when we delete the container.

### Volumes can be created in 3 ways:

* **Host volume:** Here we persist the data in a physical location of Host OS/location. So, data will not be deleted when we delete the container...
   
      docker run -v /home/mount/data:/var/lib/mysql --name postgres-test postgres:latest

* **Anonymous/Container volume:** Here we persist the data inside the container. But data will be deleted when we delete the container.
     
      docker run -v /var/lib/mysql --name postgres-test postgres

* **Own Name by creating Volume:** in this we are going to give reference the volume by our own name which is created so that it will be easy to remember it.
     
      docker run -v my-vol:/var/lib/mysql --name postgres-test postgres
          

* Problem: Docker container deletes the writable layer when deleted i.e. all the changes done by the contianer is lost

* Refer Below article for Docker volume:
  * [Refer Here](https://directdevops.blog/2019/10/03/docker-volumes/)
  
* [Refer Here](https://docs.docker.com/storage/volumes/) For official documents


* **Simple Experiment:**
* running contianer on interactive mode as manually and done simple experiement below:

```
docker volume create my-vol
docker volume ls
docker container run -it --name test -v my-vol:/docs ubuntu:latest
cd docs
ls
touch {1..10}.txt
docker images
docker container ls -a
docker volume inspect my-vol
ls /var/lib/docker/volumes/my-vol/_data
```

* Refer below screen shot for above command:
![Preview](./Images/docker73.png)
![Preview](./Images/docker74.png)

* now container has been deleted refer below screen shot still data is avaiable at `os-host` under `my-vol`
location `/var/lib/docker/volumes/my-vol/_data`

![Preview](./Images/docker75.png)


* this is same like above but only not creating folder while enter inside the container like `-it` just while running container mentioning the folder name refer below command and screen shot for it.

```
docker container run -it --name test -v yes-vol:/data  ubuntu
```
![Preview](./Images/docker77.png)


* already take backup of data from previous container which is deleted can restore into different newly created container refer below screen shot:

![Preview](./Images/docker76.png)

* ** To Expirement take `mysql` image from docker hub it iin this image has deafult volume is in the docker file
* so when  run that `mysql` image by default strange volume is created please refer all below steps and screen shots:

![Preview](./Images/docker78.png)

* Now create the container some-mysql and look at volumes

```
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql
docker volume ls
 docker volume inspect c7cc2bb24fa4e540fbcf5453962bdc30aec06673bccb4cec66c57fee1419cb2f
 sudo ls /var/lib/docker/volumes/c7cc2bb24fa4e540fbcf5453962bdc30aec06673bccb4cec66c57fee1419cb2f/_data
```

![Preview](./Images/docker79.png)
![Preview](./Images/docker80.png)

* **Now create a volume and mount it it mysql with same `specific-mysql`:**

* refer below screen shot all commands and steps are there.

![Preview](./Images/docker81.png)
![Preview](./Images/docker82.png)


## Docker Networking:
* [Refer Here](https://directdevops.blog/2019/10/05/docker-networking-series-i/) for networking series in docker
* Docker defined a standard for container networking called as Container Networking Model (CNM)
* [Refer Here](https://docs.docker.com/network/) for official docker document

* CNM is the spec and libnetwork is the implementation

### Docker Native Network Drivers

* **Host**
   * here what host gets the ip address same ip addresss will get the even container but the problem is can cannot run multiple container since same ip address we cannot share to multiple containers
![Preview](./Images/docker92.png)   

* **Bridge**
    * Creates a bridge on the host that is managed by Docker.
   * All containers on Bridge Driver can communicate  among themselves
   * Default Driver
   * using bridge network multiple conatiner can communicate 
![Preview](./Images/docker93.png)
![Preview](./Images/docker94.png)


* **None**
    * none is nothing we cannot do anything
   
* **Overlay**
    * Used for multi-host networks.
    * uses local linux bridges & VXLAN to overlay container-to-container networking

* **MACVLAN**
    * uses Linux MACVLAN bridge to establish connection b/w container interfaces & parent host interfaces
    * MAC address can be attached to each container
### Docker Networking Scopes
  * Local: provides connectivity within host
  * Swarm: provides connectivity across swarm cluster

#### Definitons of `ip address`:

* Definitons of `ip address`
* range of ip address are avaialble
* `=> CIDR`
* ip address is range of `32` bits which is equally divide into `4` parts thas is below
   * x.x.x.x = 8.8.8.8 = `32` bits
   * this is `4` equal parts called `ipv4`
   * so now `x=8` bits
   * that is `xxxxxxxx` each consists of `01`
   * for an example below will take only `2` `xx` for demonstration
     * xx=> 01
            10
            00
            11
            => permitation and combination concept
            => 2^8=256 => 0 to 255 so in each bit we can have 256 numbers of bits so that bits consits of `0` or `1`
      * maximum range for above ilustration is 
      => 0.0.0.0 => 255.255.255.255
* ip adress will tel us 2 things:
what is `network id` and `host id` so to idtentify this we `subnet mask`
  * ip => 192.168.0.14
  *  sm => 255.255.0.0
  * so now keeping this two ip and sm we can tel which is network id and host id
    * network id => 192.168  
      host id    =>       0.14
* fisrt 16 bits are => network id
  second 16 bits are => host id
  example below
* 192.168.0.0/16 = below example.
* => 192.168 is network id it is fixed
* => 0.0/x.x is host id it is variable means not fixed fexiable always changes are varies system to sytem       

* [Refer Here](https://www.ipaddressguide.com/cidr) for CIDR Expander

* Before docker install checking ifconfig observe the screen shot:

![Preview](./Images/docker83.png)

* After docker install checking ifconfig observe the screen shot:

![Preview](./Images/docker84.png)

* Default networks in docker below.
```
docker network ls
```
![Preview](./Images/docker85.png)

* **Please Note:**

* when install docker and any contianer both will have `network interface` these `network interface` will connect with the help of `bridge network` which will get by default. that is wer we can do `port forwarding` and we able to access our applications.

* sample creation of network:
```
docker network create --subnet "192.168.0.0/24" testnet
docker network ls 
```
![Preview](./Images/docker86.png)

* when ever we create new network and network interface is getting created this what docker is doing it below screen shot:

![Preview](./Images/docker87.png)

* Examples Experiement deafult network bridge:

* i have created image `alpine` with two container called `p1` and `p2` so both containers i have not mentioned the which network it should assing, so it has taken default network called `bridge` below screen shot:

```
 docker container run -d --name p1 alpine sleep 1d
 docker container run -d --name p2 alpine sleep 1d
 docker network inspect bridge
```
![Preview](./Images/docker88.png)
![Preview](./Images/docker89.png)


* Examples Experiement own created network testnet:

* i have create two container `c1` and `c2` with assigning the network called `testnet` so these container will speak each other with assinged network called `testnet` below screen shot:

```
docker container run -d --name c1 --network testnet alpine sleep 1d
 docker container run -d --name c2 --network testnet alpine sleep 1d
 docker network inspect testnet
```
![Preview](./Images/docker90.png)
![Preview](./Images/docker91.png)

* Examples Experiement:
* create a container C1 and C2 in default bridge network

```
docker container run --name C1 -d alpine sleep 1d
docker container run --name C2 -d alpine sleep 1d
```
![Preview](./Images/docker95.png)

* Now examine default bridge network to find ips of C1 and C2

![Preview](./Images/docker96.png)
![Preview](./Images/docker97.png)
![Preview](./Images/docker98.png)

* Now lets ping C2 from C1 by using ip as well as name

![Preview](./Images/docker99.png)

* Two containers in default bridge are able to communicate with each other using ip addresses but not names i.e. name based resolution is not working

* Now create a new bridge network called as learn-net with cidr range `192.168.100.0/24`

```
docker network create -d bridge --subnet "192.168.100.0/24" learn-net
```
![Preview](./Images/docker100.png)

* Now lets create two containers L1 and L2 in the learn-net

```
docker container run --name L1 --network 'learn-net' -d alpine sleep 1d
docker container run --name L2 --network 'learn-net' -d alpine sleep 1d
```

* Now ping L2 from L1 using ip and name

```
docker container exec L1 ping -c4 L2
```

![Preview](./Images/docker101.png)

* In user defined bridge network name based as well ip based communication is enabled

### Lets Create nop-commerce application by creating volumes and networks

#### Overview like this below image we will create:

![Preview](./Images/docker102.png)

#### steps
  * Create a volume `nop-db`
   
   `docker volume create nop-db`

 * Create a network `nopnet`
 `docker network create -d bridge --subnet '10.100.100.0/24' nopnet`

* Create a mysql container with username nop, volume, password nop123 in the nopnet with name `nopdb`

```
docker container run -d --name nopdb \
    --network nopnet \
    -e "MYSQL_ROOT_PASSWORD=nop123" \
    -e "MYSQL_USER=nop" \
    -e "MYSQL_PASSWORD=nop123" \
    -e "MYSQL_DATABASE=nop" \
    -v nop-db:/var/lib/mysql \
    mysql:8
```

* Create the nop container on nopnet

`docker container run -d --name nop --network nopnet -P nop`

![Preview](./Images/docker103.png)
![Preview](./Images/docker104.png)

* Inspect network

`docker network inspect nopnet`

![Preview](./Images/docker105.png)

* Now watch the classroom video to bring up the this above application


## Docker Swarm:

### Docker Swarm Difinitions:

* The cluster maanagement & Orchestration features are embedded inside Docker Engine.
*  Docker swarm consists of multiple docker hosts which run in swarm mode.
* Two Roles **managers** and **workers** exist in Docker swarm
* **Manager** is responsible for membership & delegation
* **Worker** is responsible for running swarm services
* Each Docker Host can be a manager, a worker or both.
* In Docker Swarm **Desired State** is maintained. For instance if you are running one container in swarm on a particular node (Worker) and that node goes down, then Swarm schedules this nodes task on other node to maintain the state.
* **Task** is a running container which is part of swarm service managed by Swarm Manager

### Nodes:

* It is instance of the docker engine participating in Swarm.
* There are two kinds of nodes
  * Manager nodes:
     * You communicate to manager node to deploy applications in the form of Service Definitions.
     * Manager nodes dispatch unit of work called as tasks to the Worker ndoes

  * Worker nodes:
    * They receive & execute the tasks dispatched from manager nodes.
    * An agent runs on the worker node & reports on the tasks assigned to it

### Services and tasks:

* Service is the definition of the task to be executed.
* Typically it would be the application to be deployed.
* Two kinds of Service models are available
    * **Replicated Services model:** In this case swarm manager distributes a specific number of replica task among the nodes based upon the scale you set in the desired state
   * **Global Services Model:** In this case swarm runs one task for the service on every available node in the cluster.


#### Task:

* carries a Docker container and the commands to run inside the container.
* It is the atomic secheduling unit of swarm.
* Once a task is assigned to node, it cannot move to another node.
* It can only run on the assigned node or fail.

### Docker Networking Multi Host or Overlay Networking:

#### Overlay Network Driver

* Docker Swarm uses overlay networking to communicate between multiple Docker Hosts.
* In this series lets try to understand concepts of the Docker Overlay Network Driver


![Preview](./Images/docker123.png)

* In this diagram, the packet flow on an overlay network is shown. Here are the steps that take place when c1 sends c2 packets across their shared overlay network:

```
* c1 does a DNS lookup for c2. Since both containers are on the same overlay network the Docker Engine local DNS server resolves c2 to its overlay IP address 10.0.0.3.
* An overlay network is a L2 segment so c1 generates an L2 frame destined for the MAC address of c2.
* If this is the first time c1 has contacted c2, c1 issues an ARP request for c2, which is answered by the local operating system using an entry statically programmed by the local Docker Engine.
* The frame is encapsulated with a VXLAN header by the overlay network driver. The distributed overlay control plane manages the locations and state of each VXLAN tunnel endpoint so it knows that c2 resides on host-B at the physical address of 192.168.0.3. That address becomes the destination address of the underlay IP header.
* Once encapsulated the packet is sent. The physical network is responsible of routing or bridging the VXLAN packet to the correct host.
* The packet arrives at the eth0 interface of host-B and is decapsulated by the overlay network driver. The original L2 frame from c1 is passed to c2's eth0 interface and up to the listening application.
```

* When you create overlay network as mentioned in the swarm series, two network drivers are create
   * Overlay: This points to the overlay network
   * docker_gwbridge: The egress bridge is for traffic leaving the cluster. only one docker_gwbride exists per host. This bridge is used for ingress/egress communications not for container to container communications with in overlay.

* The underlying internal architecture look like this

![Preview](./Images/docker124.png)


#### Why do we need orchestrator:

* Handling the following as the scale of application will be large or towards production.

  * Common way to access applications in containers
  * Scaling containers
  * managing multi nodes
  * New Releases (Deployments)
  * Data Management
  * Networking
  * Self Healing

* The above activities are done by orchestrator and as we are dealing with containers we specifically call it container orchestration

![Preview](./Images/docker106.png)

#### Terms:
 * Client Server
 * Cluster
 * Distributed system
 * Master and Worker Nodes (Manager and Worker Nodes)

#### What are options to run my application in multi node

* Options:
  * Docker Swarm
  * Apache Mesos
  * AWS ECS
  * Azure Container Instances
  * Kubernetes

* **To Work with docker swarm needs one manager and two or one worker**
* so create two machine and name one as manager and another one as worker install docker on it.

* after installing execute below command to check network

```
docker network ls 
```
![Preview](./Images/docker107.png)

#### Docker Swarm Setup:
* In this series, I would be using 2 ubuntu 22 machines.
* One would be manager & other one would be workers.
* Install docker on all the machines by following docker install script
* Login into ssh session of the machie which would be manager.
* Ensure all the machines can be communicated (or pingable from manager)
* Make a note of private ip address of the manager (In this example the managers ip address would be 192.168.0.13) and then exec

```
docker swarm init --advertise-addr <Manager-ip>
# In my case this is
docker swarm init --advertise-addr 192.168.0.13
##OutPut##
Swarm initialized: current node (oxtr032wpf519jgnmv6398t0w) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-6dos3zkicd12u5uuh6tsouzvl7iwvyzffkxappzo6nf12hvi4y-a4ytuboygc2b0mj6ja4aexopo 192.168.0.13:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

* Execute `docker info` on the manager and observe the output should consists of Swarm: active and other info about Docker Swarm.
![Preview](./Images/docker108.png)

* Execute command `docker node ls` and you should see the status of the manager node
![Preview](./Images/docker109.png)

* Now login into other nodes and execute docker swarm join command which is output of the docker swarm init command as mentioned above.

```
docker swarm join --token SWMTKN-1-6dos3zkicd12u5uuh6tsouzvl7iwvyzffkxappzo6nf12hvi4y-a4ytuboygc2b0mj6ja4aexopo 192.168.0.13:2377
This node joined a swarm as a worker.
```
* Now ssh into the manager and execute `docker node ls` and you should be able to see two nodes information.

![Preview](./Images/docker110.png)

```
$ docker swarm --help

Usage:  docker swarm COMMAND

Manage Swarm

Commands:
  ca          Display and rotate the root CA
  init        Initialize a swarm
  join        Join a swarm as a node and/or manager
  join-token  Manage join tokens
  leave       Leave the swarm
  unlock      Unlock swarm
  unlock-key  Manage the unlock key
  update      Update the swarm

Run 'docker swarm COMMAND --help' for more information on a command.
```

* After initialling check using this command `docker network ls` we will a new tow network has created below screen shot:

![Preview](./Images/docker111.png)

* Lets create a `nginx` service by using the following command

```
docker service create --replicas 2 --name nginx-test nginx
```
* This command leads to creation of tasks and output would be like

![Preview](./Images/docker112.png)

* Execute docker service ls and the possible output would look like

```
 docker service --help
 docker service ls
```
![Preview](./Images/docker113.png)

* Lets inspect the service using `docker service inspect nginx-test` and the output of the command would be

```
$ docker service inspect nginx-test
[
    {
        "ID": "5pau5xlf5rfzubbpsga3hxri6",
        "Version": {
            "Index": 15
        },
        "CreatedAt": "2023-09-07T19:16:52.974438363Z",
        "UpdatedAt": "2023-09-07T19:16:52.974438363Z",
        "Spec": {
            "Name": "nginx-test",
            "Labels": {},
            "TaskTemplate": {
                "ContainerSpec": {
                    "Image": "nginx:latest@sha256:a0e1a5e765dea699ce6706e4d1943632140a5b0bc8970df3ceee63ea2c0badb2",
```

* Execute docker service ps nginx-test` command to findout on which node the tasks are executed.                            

![Preview](./Images/docker114.png)

* Lets scale the number of containers running nginx by using the following command `docker service scale nginx-test=4` and the output would be

```
$ docker service scale nginx-test=4
nginx-test scaled to 4
overall progress: 4 out of 4 tasks
1/4: running   [==================================================>]
2/4: running   [==================================================>]
3/4: running   [==================================================>]
4/4: running   [==================================================>]
verify: Service converged
```

* Now i am going to delete 2 containers from worker but even i delete it maintain the state, you observe below screen shot proof:

![Preview](./Images/docker115.png)
![Preview](./Images/docker116.png)

* Now see the observation i have deleted two contianer and updated the above screen shot, using `docker container ls` command and put below screen shot for proof.

![Preview](./Images/docker117.png)

#### Rolling updates to docker swarm:

* Execute the following command to deploy jenkins

`docker service create --name jenkins --replicas 2 --update-delay 10s --publish published=8081,target=8080 jenkins:1.609.1`

* Now navigate to ipaddress of any node and

`http://ip address:8081`

![Preview](./Images/docker118.png)

* Now lets try to update to the newer version of jenkins

![Preview](./Images/docker119.png)

#### Relevance to Docker Networking

* In this series so far we were able to run docker containers on different nodes from swarm manager.
* Now execute this command `docker network ls` on the manager and you should see the output which would look like

```
NETWORK ID          NAME                DRIVER              SCOPE
4fa602b7a4ec        bridge              bridge              local
c3ba8230b575        docker_gwbridge     bridge              local
436956ab2dd0        host                host                local
m6zbhh5cn5ag        ingress             overlay             swarm
dfa793d07248        none                null                local
```

* In this overlay network driver is used and scope for that driver is swarm.
* So we can conclude that Docker swarm uses overlay and bridge (docker_gwbridge) to enable multiple Docker Host Communications.

### How Docker Swarm Works?

* Docker swarm uses **RAFT** Consensus Algorithm to maintain a consistent internal state of the entire swarm and all the services running on it

![Preview](./Images/docker120.png)

### Manager Nodes

* Manager nodes handle cluster management tasks

* cluster state management
* service scheduling
* serving Swarm mode


```
To take advantage of swarm mode’s fault-tolerance features, Docker recommends you implement an odd number of nodes according to your organization’s high-availability requirements. When you have multiple managers you can recover from the failure of a manager node without downtime.
```

```
* A three-manager swarm tolerates a maximum loss of one manager.
* A five-manager swarm tolerates a maximum simultaneous loss of two manager nodes.
* An N manager cluster tolerates the loss of at most (N-1)/2 managers.
* Docker recommends a maximum of seven manager nodes for a swarm.
```

### Worker Nodes

* Instance of Docker Engine whose purpose is to execute containers
* They dont participate in Raft distributed state or any of the managers tasks.
* Worker Node can be made Manager node by using `docker node promote`. note: This has to be executed by Manager Node

### Docker Service LifeCycle

![Preview](./Images/docker121.png)

### External Access For Docker Services

### Ingress Mode Service Publishing

`docker service create --replicas 2 --publish mode=host,target=80,published=8080 nginx`

* In this mode the published port is exposed on the host where this service is running
* Load balancing doesn’t happen

![Preview](./Images/docker122.png)


### Activity (in docker) assign `memory` and `cpu` to docker container:

* Lets Create docker nginx container with `memory`

  ```
   docker container run -d -P --memory 128m nginx
   docker images
   docker stats
  ```
![Preview](./Images/docker125.png)

* Lets Create docker jenkins/jenkins container with `memory` and `cpu`

```
docker container run -d -P --name memcpu --cpus=0.5 --memory 256m jenkins/jenkins
docker images
 docker container ls
 docker stats
```
![Preview](./Images/docker126.png)
![Preview](./Images/docker127.png)

