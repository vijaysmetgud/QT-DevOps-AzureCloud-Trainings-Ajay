Using ADD command wrote docker file:
----------------------------------------

FROM  openjdk:11
ADD  https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar /spring-petclinic-2.4.2.jar

EXPOSE 8080

CMD  ["java","jar","/spring-petclinic-2.4.2.jar"]

=================================================================================================================================


Using Run command wrote docker file:
----------------------------------------

FROM  amazoncorretto:11-alpine3.17

LABEL author="ajay"

RUN curl -fsSL https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar -o spring-petclinic-2.4.2.jar

EXPOSE 8080

CMD ["java","-jar","/spring-petclinic-2.4.2.jar"]

=========================================================================================================================================


Using Run, USER, WORKDIR and ADD command wrote docker file:
------------------------------------------------------------

FROM amazoncorretto:11-alpine3.17

LABEL author="ajay"

RUN adduser -h /petclinic -s /bin/sh -D petclinic
ADD --chown=petclinic:petclinic https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar  /petclinic/spring-petclinic-2.4.2.jar

USER petclinic

WORKDIR /petclinic

EXPOSE 8080

CMD [ "java","-jar","spring-petclinic-2.4.2.jar" ]

------------------------------------------------------------------------------------------------------

FROM amazoncorretto:11-alpine3.17

LABEL author="ajay"

RUN adduser -h /opt -s /bin/sh -D rajesh

ADD --chown=rajesh:rajesh https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar  /opt/spring-petclinic-2.4.2.jar

USER rajesh

WORKDIR /opt

EXPOSE 8080

CMD [ "java","-jar","spring-petclinic-2.4.2.jar" ]

==================================================================================================================================================================


Using ARG variable wrote docker file:
------------------------------------------

FROM amazoncorretto:11-alpine3.17
LABEL author="ajay"
ARG DOWNLOAD_LOCATION='https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar'
ARG USERNAME='rajesh'
ARG HOMEDIR='/downloading_software'
RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
ADD --chown=${USERNAME}:${USERNAME} ${DOWNLOAD_LOCATION} ${HOMEDIR}/spring-petclinic-2.4.2.jar
USER ${USERNAME}
WORKDIR ${HOMEDIR} 
EXPOSE 8080
CMD [ "java","-jar","spring-petclinic-2.4.2.jar" ]
=======================================================================================================


Using ENV variable wrote docker file:
------------------------------------------

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
===================================================================================================================

Game of life application running:
----------------------------------------

FROM tomcat:9-jdk8
LABEL author="ajay"
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war  /usr/local/tomcat/webapps/
EXPOSE 8080
===================================================================================================================


NopCommerce application running:
------------------------------------

FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author="ajay"
COPY nopCommerce /nopCommerce
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
EXPOSE 5000
WORKDIR /nopCommerce
CMD ["dotnet", "Nop.Web.dll"]


             or 


FROM mcr.microsoft.com/dotnet/sdk:7.0
LABEL author=ajay
COPY nopCommerce /nopCommerce
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
EXPOSE 5000
WORKDIR /nopCommerce
CMD ["dotnet", "Nop.Web.dll","--URLS="http://0.0.0.0:5000"]

====================================================================================================================

Multi stage dockerfile for nopCommerce:
----------------------------------------------

if we mention the name for stage it will take that name 
if we dint mention any name for stage then it will start like default starting stage - 0 to n.. here ending stage is - 1
-----------------------------------------------------------------------------------------------------------------------

FROM alpine:3 AS downloader
ARG DOWNLOAD_LOCATION="https://github.com/nopSolutions/nopCommerce/releases/download/release-4.60.4/nopCommerce_4.60.4_NoSource_linux_x64.zip"
ADD ${DOWNLOAD_LOCATION} /nopCommerce/nopCommerce_4.60.4_NoSource_linux_x64.zip
RUN apk update && \
    apk add unzip && \
    cd /nopCommerce && \
    unzip nopCommerce_4.60.4_NoSource_linux_x64.zip && mkdir bin logs \
    && rm -rf nopCommerce_4.60.4_NoSource_linux_x64.zip

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS imagebuild
LABEL author="ajay" 
EXPOSE 5000
COPY --from=downloader /nopCommerce /nopCommerce
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
EXPOSE 5000
WORKDIR /nopCommerce 
CMD ["dotnet", "Nop.Web.dll"]

=======================================================================================

Multi stage dockerfile for springpetclinic:
---------------------------------------------

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
===============================================================================================================

Using volume wrote dockerfile:
----------------------------------------

FROM tomcat:9-jdk8
LABEL author="ajay"
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war  /usr/local/tomcat/webapps/
EXPOSE 8080
VOLUME [ "/docs" ]
================================================================================================================

