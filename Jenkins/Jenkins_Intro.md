# Continuous Integration and Continuous Delivery/Deployment

* Jenkins is like crontab because jenkins will integrate with other tools or what ever we say jenkins it will do and it will call the other tool.
* it is just like crontab, jenkins will not do any work nor it doesn't know anything, just it will call other tools to do the work thats it. 
* jenkins can do anything and everything, that we can do in commandline 
* jenkins never does the work
* jenkins will calls the command which does the work

---

### Continuous Integration:

* when ever developer will commit the code to any remote/centralize repository it wil start testing and checking quality of the code and deploy to lower environment
* the moment developer submit the code we will build the package and do some small  testcase/run performance test
is known as continues integration 
* chain => VCS submit the code => build package => unittest.

### Continuous Delivery:
* the moment developer submit the code and we will build the package and do unittesting, security testing and performance testing, and deploy to the up to pre-prod/UAT environment is known as continues delivery   
* chain => VCS submit the code => build package => unittesting => ST env => PT env => pre-prod/UAT env
* where ever developer will commit the code to any remote/centralize repository it will start testing with lower environment is known as continues delivery   

### Continuous Deployment:
* where ever developer will commit the code to any remote/centralize repository it will start testing with lower environment and deploy to production 
* the moment developer submit the code and we will build the package and do some unittesting, security testing and performance testing, and deploy to the up to prod/live environment is known as continues deployment
* chain => VCS submit the code => build package => ST env => PT env => UAT env => prod/Live environment


### Jenkins Default Home Directory
* /var/lib/Jenkins
* where all our projects/jobs related information will contain

### Adding jenkins user to No Passwd Authentication
#### Ubuntu: 
* this below editor is NaNo 
* Switch to root
       
    * sudo su - 
    * visudo
* go=>to=>  
`Allow members of group sudo to execute any command`
* Add this below line to above member group
    
  * jenkins ALL=(ALL:ALL) NOPASSWD:ALL
* Save changes visudo file    
   
   * Control O
   * Enter
   * Control X

### Adding jenkins user to No Passwd Authentication
#### Linux
* this below editor is VI
* Switch to root
       
    * sudo su - 
    * vi sudoers
* go=>to=>     
`Allow members of group sudo to execute any command`
* Add this below line to above member group
    
  * jenkins ALL=(ALL:ALL) NOPASSWD:ALL
  * Save changes sudoers file
  * :wq!

### what is plugin
* Plugin will add functionality to jenkins not to our system/instance, even if we install plugin in jenkins just we can use that functionality or option of that plugin but we have to install same plugin like software in the instance then only jenkins will call that tool if not no. 

### Workspace

* /var/lib/jenkins/workspace/, is a folder in our instance where all our project or jobs will execute
* where it will generate the artifact means war.file or jar. file

### Jobs

* is a folder where all our projects/jobs nextBuildNumber, build history, config.xml file will generate

### Dummy Repos which can use for practice purpose

* https://github.com/spring-projects/spring-petclinic.git


### Complier
* complier is a tool which translate from one launguage to another.
* once compliation is done dont need a complier  

### Interpreter 
* interpreter belongs to example of translator we need always till the translation is taken place

### Jar contain byte code, it executes by its own

### War contain byte code, and it required some webserver or application server to work 

### .net contain dll/exe means interpretor 


### Dependencies

* Whenever a software project is developed, they have lot of dependencies
* before building the code in the local instance or in jenkins, dependencies have to be present locally and that plugin should be installed in jenkins under manage jenkins so that we can use that fancy UI of that software and work.
* if locally that software is not present means we cannot build the code, we will get error saying command not found 

### To manage these dependencies, every programming language has some kind of package manager 

Follow Below:
------------
* dotnet: nuget is the package manager
  * In case of dotnet Dependencies contain in these files or formate packages.config/packages.json

* java: maven can handle package management

   * In case of java Dependencies contain in these files or formate Pom.xml

* python: pip is the package manager

   * In case of python Dependencies contain in these files or formate requirements.txt 

* nodejs: npm can handle package management

  * In case of nodejs Dependencies contain in these files or formate package.json 

Jenkins Terms Needs to Understand
----------------------------------

### Artifact:
* Artifact means after we build the code we get war/jar file that is known as artifact
* the result of our code is known as artifact
* To generate the artifact we will use MSbuild for 
.net applications
* To generate the artifact we will use maven/gradle for java applications

### Unit Test:
* In Java Junit is test case will test the code after build
* In Microsoft mstest/nunit  is test case will test the code after build
* In Python  pytest is test case will test the code after build
* In Nodejs jasmine mocha is test case will test the code after build
* what ever tools we want we can run but at the end of the day most of CI/CD system understand to generate the JUnit xml file reports as a test result 

### Code Coverage:
* We will use sonar qube to code analysis and check the quality of code and bugs 

### Static Code Analysis:
* We will use sonar qube 

### Artifact Repository:
* We will use Jfrog
* Azure artifact

### Build Code Work Flow:
![Preview](./Images/jenkins7.png)


To script Generate Pipeline Syntax
----------------------------
### Steps:
* When creating pipeline project=> click on `Pipeline Syntax` 
![Preview](./Images/jenkins9.png)
* New Tab will be opened called `Generate Declarative Directive`
![Preview](./Images/jenkins10.png)
![Preview](./Images/jenkins11.png)
![Preview](./Images/jenkins12.png)
![Preview](./Images/jenkins13.png)

Using Jenkins to build Maven Projects
--------------------------------------
### Required software:
* **Jenkins configuration in Master Node:**
   * Install jenkins
   * jdk 17
* Adding jenkins user to sudoers Group:
  * why we are adding jenkins user to sudoers is because wile executing pipeline jenkins should not ask for password or authentication 
#### Steps For Ubuntu:
```bash
sudo visudo
# give permission to jenkins user without password
jenkins ALL=(ALL:ALL) NOPASSWD:ALL
# save the changes in the editor
CTRL + O
CTRL + X 
```
* Install and configure maven in Jenkins
  * means needs to switch to jenkins user then install maven
```bash
sudo su -
su - jenkins
sudo apt install maven -y 
mvn --version
```  

* Lets build spring petclinic [Refer Here](https://github.com/spring-projects/spring-petclinic)
  * software requirements To build spring petclinic: 
    * jdk 17
    * maven
* Create a free style project to build spring petclinic
![Preview](./Images/jenkins15.png)
![Preview](./Images/jenkins16.png)
* Free style project sections
![Preview](./Images/jenkins17.png)
* General: This represents the project information
![Preview](./Images/jenkins18.png)
* Source Code Managent: This represent the code to be used for ci/cd pipelines
![Preview](./Images/jenkins19.png)
* Build Triggers: This represent when to build the project
  * Build Periodically: If the project has to be build based on schedule, write cron expression into this, but here if there is a change in git or not it will build because we have mentioned cron expression to build at that particular period. 
  * Poll SCM: this represents jenkins polling scm (asking git is there any changes that i should build it) and the cron expression represents how frequently poll scm should ask git for it. for example if any new commit id is there then only it will build if not, it will not build. 
![Preview](./Images/jenkins20.png)
* Build Environment: This represents the environmental configuration
![Preview](./Images/jenkins21.png)
* Build Steps: These are actual activities that are performed during execution.
![Preview](./Images/jenkins22.png)
![Preview](./Images/jenkins23.png)
* Post Build actions: Actions to be performed after completion of build
![Preview](./Images/jenkins24.png)
![Preview](./Images/jenkins25.png)
* To trigger build manually
![Preview](./Images/jenkins26.png)
* Jenkins build got success
![Preview](./Images/jenkins30.png)
* Test results
![Preview](./Images/jenkins31.png)
![Preview](./Images/jenkins32.png)


### Where Jenkins executes all its project and how jenkins works:
* Under Jenkins Home `var/lib/jenkins` it executes all the project information
![Preview](./Images/jenkins27.png)
* Under `Jobs` it executes projects
![Preview](./Images/jenkins28.png)
![Preview](./Images/jenkins29.png)
* In `config.xml`
  * it will contain all the steps which we written in jenkins UI or all the build steps even if code formate
* In `nextBuildNumber`
  * it will contain what is the next build number when we execute the job
* Under ` builds`
   * permalinks: contain build status
* Under `workspace`
  * Git url will clone in this directory called `workspace` and  our project will execute and generate artifact


### Jenkins Terms
* **Jenkins home:**
   * Jenkins home is a folder where jenkins stores all of is configuration. In the above case the workspace is `/var/lib/jenkins`. If you want to change the workspace deal with `JENKINS_HOME` by setting the environment variable we can chagne the default `Jenkins Home`
* **Backup of Jenkins:**
    * is to take backup of `Workspace` that is `/var/lib/jenkins`    
* **Project:**
   * This contains the actvity that needs to be performed on triggers.
     * This project is stored as xml file in workspace
     * Types Of Project:
        * Freestyle project: This is UI based configuration
        * Pipeline: This is instructions expressed in some code format that is jenkins file.
* **Build:** 
   * This represents the execution of project. Every build for a project has a running number called as `Build id` or `Build Number`

* **Node:**
   * This represents the machine on which build can be executed.
   * Each Node can be configured to handle multiple builds by executors.
     * On Jenkins UI as per below screen shot we can see how many executors are there. based on that so many executors can execute the project on jenkins, so we have two executors so that we can build two different projects, not same two project, if same tow project builds is called concurrent builds.
     * Eventually we can change the executors also if required.
     ![Preview](./Images/jenkins14.png)


Managing different versions of the tools using jenkins
------------------------------------------------------
* incase if we have two version of same software then we follow this procedure in the jenkins UI
* Lets go to manage jenkins and navigate to tools => Maven installations
![Preview](./Images/jenkins33.png)
![Preview](./Images/jenkins34.png)
* Now lets configure the spring petclinic to use `top level maven targets`
![Preview](./Images/jenkins35.png)
* Now build the project manually
![Preview](./Images/jenkins36.png)


Distributed Builds
--------------------

* **Setup:**
  * Fork Spring petclinic [Refer Here](https://github.com/dummyreposito/spring-petclinic)
    * requirements to build
      * java jdk 17
      * maven 3.9

  * Fork game of life [Refer Here](https://github.com/dummyreposito/game-of-life-july23) 
      * requirements to build
         * java 8
         * maven(any version it will work)

  * Fork nopcommerce [Refer Here](https://github.com/dummyreposito/nopCommerce-july23)
      * requirements to build
          * dotnet 7
* To handle different builds with different software needs, we tend to use different servers.
* Jenkins has distributed builds where we can distribute the builds on differnt nodes by matching labels
![Preview](./Images/jenkins37.png)
* While creating a project we can set labels and expect them to be executed on the node matching labels

### How to add multiple nodes to jenkins
* Lets create 2 ubuntu vms 
  * out of which one we makes a jenkins master and another as jenkins node
* **Install required software on jenkins master node:**
   * java jdk 17
   * jenkins 
```bash
sudo apt update 
sudo apt install openjdk-17-jdk -y 
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install jenkins
```
* Add jenkins master node to sudoers permission without password
```bash
sudo visudo
jenkins ALL=(ALL:ALL) NOPASSWD:ALL
CTRL O
CTRL X
```
* **Install required software on jenkins node-1:**
   * java jdk 17
   * maven 3.9
```bash
sudo apt update && sudo apt install openjdk-17-jdk -y
# maven installation
cd /tmp/
wget https://dlcdn.apache.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz
sudo mkdir /usr/share/maven
sudo tar -xvzf apache-maven-3.9.6-bin.tar.gz -C /usr/share/maven
# Adding to Path Variable:
sudo vi /etc/environment
# add /usr/share/maven/apache-maven-3.9.6/bin to the PATH variable
source /etc/environment
mvn --version
```   
* Like below screen shot should save in the environment variable
![Preview](./Images/jenkins38.png)
* Now lets configure `node` to the `jenkins master` with label `JDK-17`
  * On Jenkins UI Navigate to `Manage Jenkins` => `Nodes and Clouds`
  ![Preview](./Images/jenkins39.png)
  ![Preview](./Images/jenkins40.png)
  ![Preview](./Images/jenkins41.png)
  ![Preview](./Images/jenkins42.png)
  ![Preview](./Images/jenkins43.png)
  ![Preview](./Images/jenkins44.png)
  ![Preview](./Images/jenkins45.png)
  ![Preview](./Images/jenkins46.png)
  ![Preview](./Images/jenkins47.png)
  ![Preview](./Images/jenkins48.png)

### Lets setup spring petclinic to execute node-1
* Configure spc-day build same as last session/above free style project setting procedure with one restriction in General section, that where should this project should run with `node-1`
![Preview](./Images/jenkins49.png)
![Preview](./Images/jenkins50.png)
![Preview](./Images/jenkins51.png)
![Preview](./Images/jenkins52.png)
![Preview](./Images/jenkins53.png)
![Preview](./Images/jenkins54.png)
* Now build and verify the console output
![Preview](./Images/jenkins55.png)
![Preview](./Images/jenkins56.png)

### Jenkins Node-2 Configuration
* **Required Software:**  
  * on the jenkins node-2 we required ` Java JDK-17` to jenkins master connect the node-2 and execute our application
  * To run project game of life on node-2 we would require `java jdk-8` and `maven`
* Lets create new VM called as `node-2`
* On the node2 lets create a new user called as `devops` and give sudo no password access

```
# addding user and setting password
sudo adduser devops
# adding user to sudoers and setting with no passwd
sudo visudo
devops ALL=(ALL:ALL) NOPASSWD:ALL
CTRL O 
CTRL X
```
* enable password based authentication

```bash
sudo vi /etc/ssh/sshd_config
# Change password Authentication to yes
sudo systemctl restart sshd
exit
# Login as devops user
ssh -i .\id_rsa_AjaykumarRamesh devops@34.125.216.77
sudo apt update
```
* Install jdk 8 and jdk 17

```
sudo apt update 
sudo apt install openjdk-17-jdk openjdk-8-jdk -y 
sudo apt install maven -y 
```
* Now execute `java -version`
![Preview](./Images/jenkins57.png)
* Lets configure JDK 17 and JDK 8 paths in tools section of jenkins UI
![Preview](./Images/jenkins58.png)
* Now needs to configure node-2 to jenkins master
  * Note: Here we connect node-2 with usernname and password not with ssh
  * see the below screen shot
![Preview](./Images/jenkins59.png)
![Preview](./Images/jenkins60.png)
![Preview](./Images/jenkins61.png)
![Preview](./Images/jenkins62.png)
![Preview](./Images/jenkins63.png)
* Now lets try building game of life project
![Preview](./Images/jenkins64.png)
![Preview](./Images/jenkins65.png)
![Preview](./Images/jenkins66.png)
![Preview](./Images/jenkins67.png)
![Preview](./Images/jenkins69.png)
* Now lets add processing the test results `**/surefire-reports/TEST-*.xml`
![Preview](./Images/jenkins70.png)
![Preview](./Images/jenkins71.png)
* As a result of this project build i will get `gameoflife.war` which is called as `artifact`.
  *  lets configure jenkins to archive the artifacts
      which is `gameoflife.war`
  ![Preview](./Images/jenkins72.png)
  ![Preview](./Images/jenkins73.png)
  * as per above screen shot should click the gameoflife.war file download since it is achieved   

* Note: The health of the builds is represented as weather in jenkins
  * cloudy means builds are failing
  * sunny means the builds are successful
  ![Preview](./Images/jenkins74.png)

### Jenkins Node-3 Configuration
* **Required Software:** 
  * on the jenkins node-2 we required ` Java JDK-17` to jenkins master connect the node-2 and execute our application
  * install `dotnet 7 sdk` for running nop comerce
     * To install dotnet 7 sdk [Refer Here](https://learn.microsoft.com/en-us/dotnet/core/install/
     linux-ubuntu-2204)
    ```
    sudo apt-get update && \
    sudo apt-get install -y dotnet-sdk-7.0
    dotnet --version
    dotnet --help
    sudo apt install openjdk-17-jdk -y
    ```
  * Lets create new VM called as `node-3`
* Lets configure node-3 agent in jenins master UI
![Preview](./Images/jenkins75.png)
![Preview](./Images/jenkins76.png)
![Preview](./Images/jenkins77.png)
![Preview](./Images/jenkins78.png)

* to build the dotnet project we need to restore nuget packages
* Manual steps below are to build the dotnet projects
```
dotnet restore src/NopCommerce.sln
# For night builds
dotnet build  -c "Release" src/NopCommerce.sln
# For day builds
dotnet build  -c "Debug" src/NopCommerce.sln
```
* Now lets try building NopCommerce project
![Preview](./Images/jenkins79.png)
![Preview](./Images/jenkins80.png)
![Preview](./Images/jenkins81.png)
![Preview](./Images/jenkins82.png)
![Preview](./Images/jenkins83.png)
![Preview](./Images/jenkins84.png)

Upstream and Downstream projects
--------------------------------
* If the project A triggers the Project B then
   * Project B is downstream of Project A
   * Project A is upstream of Project B
    ![Preview](./Images/jenkins85.png)
* Lets create New View `Experimental` and also create `Project A,B and C` 
![Preview](./Images/jenkins86.png)
![Preview](./Images/jenkins87.png)
![Preview](./Images/jenkins88.png)
![Preview](./Images/jenkins89.png)
![Preview](./Images/jenkins90.png)
![Preview](./Images/jenkins91.png)
![Preview](./Images/jenkins92.png)
![Preview](./Images/jenkins93.png)
![Preview](./Images/jenkins94.png)
![Preview](./Images/jenkins95.png)
![Preview](./Images/jenkins96.png)
![Preview](./Images/jenkins97.png)
![Preview](./Images/jenkins98.png)
![Preview](./Images/jenkins99.png)
![Preview](./Images/jenkins100.png)
* Now Lets Configure Upstream and Downstream of projects A and B
![Preview](./Images/jenkins101.png)
![Preview](./Images/jenkins102.png)
![Preview](./Images/jenkins103.png)
* Now Lets Configure Upstream and Downstream of projects C and B
![Preview](./Images/jenkins104.png)
![Preview](./Images/jenkins105.png)
![Preview](./Images/jenkins106.png)
![Preview](./Images/jenkins107.png)
* Now Lets Run Project A, so it has dependencies for calling Project B and Project B will Call Project C
* so if i run Project A and other projects will run because it is dependencies 
* observe the below screen shot for proof
![Preview](./Images/jenkins108.png)
![Preview](./Images/jenkins109.png)
![Preview](./Images/jenkins110.png)

Parametrized Builds
-------------------
* While building the jobs, sometimes we would like users to pass some information. of selecting some choices.This is called as parameters.
* Lets enable parameters for some jenkins project/job
![Preview](./Images/jenkins111.png)
![Preview](./Images/jenkins112.png)
![Preview](./Images/jenkins113.png)
![Preview](./Images/jenkins114.png)
![Preview](./Images/jenkins115.png)
* observe below screen shot after we set parameters the `build` option is change to `Build with Parameters`
![Preview](./Images/jenkins116.png)
* When click on `Build with Parameters` below options we will get it so needs to choose one out of it
![Preview](./Images/jenkins117.png)
![Preview](./Images/jenkins118.png)  
* Build got success as per choice which we choose it
![Preview](./Images/jenkins119.png)  

Jenkins Environmental variables
--------------------------------
* Jenkins injects environmental variables into every job in addition to environmental variables present on node
* Lets create environment demo
* These are the server node-2 environmental variables
![Preview](./Images/jenkins120.png)
* Now executing environmental variable through jenkins on node-2
![Preview](./Images/jenkins121.png)
![Preview](./Images/jenkins122.png)
![Preview](./Images/jenkins123.png)
![Preview](./Images/jenkins124.png)
* Now build the printenv project
![Preview](./Images/jenkins125.png)
* observe here when used same command which is used on node-2 in jenkins UI to execute `printenv` we can see some more other environmental variables which was not there in the node-2, so this means jenkins has some kind of environmental variables
![Preview](./Images/jenkins126.png)
* To view environmental variables Naviage to build steps => execute shell => click on ` the list of available environment variables`
![Preview](./Images/jenkins127.png)
![Preview](./Images/jenkins128.png)
* [Refer Here](https://www.jenkins.io/doc/book/pipeline/jenkinsfile/#using-environment-variables) for docs on environmental variables in jenkins
* **Building the project Sample using environmetal variables:**
![Preview](./Images/jenkins129.png)
![Preview](./Images/jenkins130.png)
* Result
![Preview](./Images/jenkins131.png)

How to take backup of jenkins
-----------------------------
* 1st Option is take backup of in jenkins master `var/lib/jenkins` folder location 
* 2nd option is for backup of configuration files
  * Go To Manage Jenkins => Plugins => Click on => Available Plugin 
  * In List we can select anything, but i have select out of one
  ![Preview](./Images/jenkins132.png)
  ![Preview](./Images/jenkins133.png)
  ![Preview](./Images/jenkins134.png)
  ![Preview](./Images/jenkins135.png)
  ![Preview](./Images/jenkins136.png)
  ![Preview](./Images/jenkins137.png)
  ![Preview](./Images/jenkins138.png)
  ![Preview](./Images/jenkins139.png)
  ![Preview](./Images/jenkins140.png)
  ![Preview](./Images/jenkins141.png)
  ![Preview](./Images/jenkins142.png)
  * In the jenkins server check on the location backup has created observe below screen shot
  ![Preview](./Images/jenkins143.png)

Which plugin should be installed to monitor jenkins
---------------------------------------------------
* [Refer Here](https://plugins.jenkins.io/monitoring/) for monitoring jenkins docs
* Under => `Manage Jenkins` => `Plugins` install `monitoring plugin`
![Preview](./Images/jenkins144.png)
![Preview](./Images/jenkins145.png)
* Click on below screen shot marked for monitoring observation
![Preview](./Images/jenkins146.png)
![Preview](./Images/jenkins147.png)
![Preview](./Images/jenkins148.png)

### Jenkins Plugins can be installed from:
   * Market place
     * searching plugins in available plugin
   * Uploading the plugin
      * Under => `Manage Jenkins` `Plugins` => `Advanced Settings` 
      * we can browse and upload the plugin
      ![Preview](./Images/jenkins149.png)
### Jenkins plugin has two extensions while uploading
   * jpi (Jenkins plugin interface)
   * hpi (hudson plugin interface)

Pipeline as Code
----------------
* This is expressing CI/CD pipeline in terms of some code/expressions/statements
* This is part of version control i.e. each change done to the steps will have history
* [Refer Here](https://www.jenkins.io/doc/book/pipeline/pipeline-as-code/) for official docs Pipeline as Code 
* Example of Jenkins pipeline
```
node("JDK-11-MVN") {
  stage("get-code") {
    sh " git clone https://github.com/spring-projects/spring-petclinic.git && cd spring-petclinic"
  }
  stage("build") {
    sh "mvn package"
    junit '**/surefire-reports/TEST-*.xml'
  }
}
```
* The only manual work would be to go to jenkins UI and create a pipeline project and configure where your pipeline is or jenkinsfile location.

### Pipeline as Code in Jenkins
  
  * **_Jenkins has two flavours_:**
     * **Scripted Pipeline**
       * Heavily dependent on programming language called groovy 
       * groovy is a java based language
       * in scripted pipeline we can call groovy code, we can write what ever we want in groovy.
       * if our project/application has lots logic to write then we can go with scripted pipeline
       * This was developed where you can execute groovy language directly

     * **Declarative Pipeline**  
        * if our project/application is straight forward then we go with declarative pipeline
        * Jenkins has created a DSL (Domain specific Language) which is mostly inspired from traditional jenkins

#### Create a Scripted Pipeline
* Create a game of life project
![Preview](./Images/jenkins150.png)
![Preview](./Images/jenkins151.png) 
* Pipeline can be written directly in jenkins UI or can be chosen from source code management(Git)
![Preview](./Images/jenkins152.png)
### pipeline syntax: 
* To take help to create pipeline syntax in jenkins UI 
  * Open pipeline syntax in jenkins UI
  ![Preview](./Images/jenkins153.png)
  ![Preview](./Images/jenkins154.png)
  ![Preview](./Images/jenkins155.png)
  ![Preview](./Images/jenkins156.png)
  ![Preview](./Images/jenkins157.png)
  ![Preview](./Images/jenkins158.png)
  ![Preview](./Images/jenkins159.png)
* Created the scripted pipeline following structure with help of `pipeline syntax`
![Preview](./Images/jenkins160.png)
* Build now manually 
![Preview](./Images/jenkins161.png)
* Build got success
![Preview](./Images/jenkins162.png)
![Preview](./Images/jenkins163.png)  
* Sample scripted pipeline

```
node('JDK_8') {
    
   
   stage('git checkout') {
       git branch: 'master ', url: 'https://github.com/dummyreposito/game-of-life-july23.git'
   }
   
   stage('defining java tool'){
       jdk = tool name: 'JAVA_8', type: 'jdk'
       env.JAVA_HOME = "${jdk}"  
       sh "${jdk}/bin/java -version"
   }
  
   stage('build'){
   sh 'mvn package'
   }
   
   stage('Archive the artifacts'){
       archiveArtifacts artifacts: 'gameoflife-web/target/gameoflife.war', followSymlinks: false
   }
   stage(' Publish JUnit test result report'){
       junit '**/surefire-reports/TEST-*.xml'
   }
} 
```

### Scripted Pipelines
 * Generally we create a file called as `Jenkinsfile`
 * Basic structure: [Refer Here](https://www.jenkins.io/doc/book/pipeline/syntax/#scripted-pipeline) for Scripted Pipeline information
![Preview](./Images/jenkins170.png)
* [Refer Here](https://www.jenkins.io/doc/pipeline/steps/#pipeline-steps-reference) for all Pipeline Steps Reference  
* In scripted and declartive pipelines when we install plugins we get extra steps.

Create a Declarative Pipeline
-----------------------------
* This has different structure in pipeline not for creating the project
![Preview](./Images/jenkins164.png)
![Preview](./Images/jenkins165.png)
![Preview](./Images/jenkins166.png)
* **Declarative Pipeline structure:**

```
pipeline{
    agent { label 'JDK-17'}
    stages{
        stage('git'){
            steps{
             git branch: 'main', url: 'https://github.com/dummyreposito/spring-petclinic.git'   
            }//steps
        }//stage
        stage('build'){
            steps{
                sh 'mvn package'
            }//steps
        }//stage
    }//stages
}//pipeline
```
* Build now
![Preview](./Images/jenkins167.png)
![Preview](./Images/jenkins168.png)
![Preview](./Images/jenkins169.png)

### Declarative Pipelines
* Here also we create a file called as `Jenkinsfile`
* Basic structure: [Refer Here](https://www.jenkins.io/doc/book/pipeline/syntax/#declarative-pipeline) for Declarative Pipeline information
![Preview](./Images/jenkins171.png)
### Lets create a declarative pipeline by exploring most options in Declarative pipeline
* [Refer Here](https://github.com/dummyreposito/spring-petclinic) for the spring petclinic repo

* **Steps:**

```bash
 git clone git@github.com:dummyreposito/spring-petclinic.git
cd spring-petclinic/
git branch
git checkout -b develop
git push -u origin develop
git branch
code . 
```
* So now we have cloned the repo and create a develop branch and also in spring petclicnic code create `Jenkinsfile`
* We have developed the basic skeleton of declarative pipeline

```

pipeline{
    agent {label 'JDK-17'}
    options{
        timeout(time:30, unit: 'MINUTES')
    }
    triggers{
        poolSCM('* * * * *')
    }
    tools{
        jdk 'JDK-17'
    }
    stages{
        stage('git checkout'){
            steps{
            
            }
        }
        stage('build and deploy'){
            steps{
               
            }
        }
        stage('reporting'){
            steps{

            }
        }
    }
}

```
#### pipeline steps reference:
* Now using pipeline steps reference we will write all the steps in pipeline and build the project
* observe some screen shots for pipeline steps reference
![Preview](./Images/jenkins175.png)
![Preview](./Images/jenkins172.png)
![Preview](./Images/jenkins173.png)
![Preview](./Images/jenkins174.png)

* [Refer Here](https://github.com/dummyreposito/spring-petclinic/commit/8dbd2df0a75baf4683150f6935cc57750c38c98d) for declarative pipeline jenkinsfile with steps for building project 
* Create a project and build now
![Preview](./Images/jenkins176.png)
![Preview](./Images/jenkins177.png)
![Preview](./Images/jenkins178.png)










      



   







