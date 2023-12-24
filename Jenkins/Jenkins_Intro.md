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
* Jenkins has distributed builds where we can distribute the builds on different nodes by matching labels
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
git clone https://github.com/dummyreposito/spring-petclinic.git
cd spring-petclinic/
git branch
git checkout -b develop
git push -u origin develop
git branch
code . 
```
* in the above code if we are unable to create develop branch and push to remote repo then [Refer Here](https://www.a2hosting.com/kb/developer-corner/version-control-systems1/403-forbidden-error-message-when-you-try-to-push-to-a-github-repository/
) for trouble shot
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

* [Refer Here](https://github.com/dummyreposito/spring-petclinic/commit/1d86dc01f5c3888aaef674125ffb9afed521c03a) for declarative pipeline jenkinsfile with steps for building project 
* Create a project and build now
![Preview](./Images/jenkins176.png)
![Preview](./Images/jenkins177.png)
![Preview](./Images/jenkins178.png)
![Preview](./Images/jenkins179.png)
* Build result
![Preview](./Images/jenkins180.png)
![Preview](./Images/jenkins181.png)
![Preview](./Images/jenkins182.png)

### Note:
#### Creating mailtrap and sending post notification to E-mails
* needs to create account
* [Refer Here](https://mailtrap.io/inboxes/2526172/messages) for mailtrap account
* Mailtrap using to send fake emails notifications
![Preview](./Images/jenkins183.png)
![Preview](./Images/jenkins184.png)
![Preview](./Images/jenkins190.png)
![Preview](./Images/jenkins191.png)
![Preview](./Images/jenkins192.png)
![Preview](./Images/jenkins193.png)

#### Lets create declarative pipeline for game of life project
* [Refer Here](https://github.com/dummyreposito/game-of-life-july23.git) for game of life repo
* **Steps:**
```bash
git clone https://github.com/dummyreposito/game-of-life-july23.git
cd game-of-life-july23/
code .
# create Jenkinsfile and add pipeline steps to execute the game of life project
```
* [Refer Here](https://github.com/dummyreposito/game-of-life-july23/commit/b3551222a20eee05408f64963936c85e2a2aab85) for declarative pipeline for game of life
* Now Lets create and build the project game of life
![Preview](./Images/jenkins185.png)
![Preview](./Images/jenkins186.png)
![Preview](./Images/jenkins187.png)
![Preview](./Images/jenkins188.png)
* Build result
![Preview](./Images/jenkins189.png)


Email Notifications in Jenkins:
---------------------------------
* email notifications configurations in jenkins 
* **Steps:**
![Preview](./Images/jenkins194.png)
![Preview](./Images/jenkins195.png)
![Preview](./Images/jenkins196.png)
![Preview](./Images/jenkins197.png) 
* Lets send an email notifications when the
    * project failed :  `your build is success`
    * project success : `your build is failed`
* [Refer Here](https://github.com/dummyreposito/game-of-life-july23/commit/7584f3442148e5d75e564869e52291f73fdfca48) for declarative pipeline steps for sending email notifications
![Preview](./Images/jenkins198.png)
* In Mailtrap received email notification
![Preview](./Images/jenkins199.png)
* To Send Email Notification with Environmental variable
  * [Refer Here](https://github.com/dummyreposito/game-of-life-july23/commit/85bd5d462c7419c898c297dc9142109fa5eb41b6) for email notifications steps with Environmental variable
  * successfully received Email in mailtrap
  ![Preview](./Images/jenkins200.png)
  ![Preview](./Images/jenkins201.png)

#### To send microsoft teams/slack notification  
  * we can check in the google and configure 

Parameters from Jenkinsfile
---------------------------
* [Refer Here](https://github.com/dummyreposito/game-of-life-july23/commit/81a6b89d8edaea019f61668faf3a13bdca4fecc8) for declarative pipeline steps build with parameters 
* Now Build with Parameters
![Preview](./Images/jenkins202.png)
![Preview](./Images/jenkins203.png)
![Preview](./Images/jenkins204.png)
![Preview](./Images/jenkins205.png)
![Preview](./Images/jenkins206.png)

User Administration in Jenkins
-------------------------------
* In User administration in jenkins there are two types
### Authentication:
* **Jenkins own user database**
    * get user information or details from jenkins database 
       * means all the user information will be stored in var/lib/jenkins location
* **LDAP**
    * LDAP is a active directory which stores all the user information, if we choose LDAP as Authentication all the user details we can get from active directory
       * active directory is a implementation for LDAP
       * for this LDAP details or information watch sreeharsha video 
* **Unix User/Group database**
   * we can configure users from unix/user groups database means we can get the details for jenkins user administration purpose 
* **Delegate to servlet container** 
    * forward the user to some java program so the program will handle the user information for jenkins 
### Authorization:
* **Matrix-based-security**
#### Steps:
* Create Users
![Preview](./Images/jenkins207.png)
![Preview](./Images/jenkins208.png)
![Preview](./Images/jenkins209.png)
![Preview](./Images/jenkins210.png)
* Now give Authorization to user `dummy` using Matrix-based-security
![Preview](./Images/jenkins211.png)
![Preview](./Images/jenkins212.png)
* Now Add the User
![Preview](./Images/jenkins213.png)
![Preview](./Images/jenkins214.png)
![Preview](./Images/jenkins215.png)
* Now Login as user `dummy` and check the access to jenkins UI
![Preview](./Images/jenkins216.png)
* Now observe the below screen shot there is any extra permission apart from `read` for an example there is no `manage jenkins`,`build` etc
![Preview](./Images/jenkins217.png)

* **Role-based-strategy**
   * for role based strategy we needs to install the plugins called `Rose-based-strategy`
   ![Preview](./Images/jenkins218.png)
#### Steps:
* Now We have created three users 
![Preivew](./Images/jenkins221.png)
* Under `manage jenkins` => `security`=> select `Role-based-strategy` in Authorization
![Preview](./Images/jenkins219.png)
* Under `manage jenkins` Navigate to `Manage and Assing Roles`
![Preivew](./Images/jenkins220.png)
* Now Add the Role/Group and give the permissions
![Preivew](./Images/jenkins222.png)
* Now Assign Roles to the users which we have created earlier above
![Preview](./Images/jenkins223.png)
![Preview](./Images/jenkins224.png)
![Preview](./Images/jenkins225.png)
* Now Login in the private window and check the access for user `suresh`
![Preview](./Images/jenkins226.png)
![Preview](./Images/jenkins227.png)
* User suresh has assign the role to `developer` so he can `build` and `view` and cannot `delete the project` also cannot see `manage jenkins` and `some more options`
* Now Login in the private window and check the access for user `harish`
![Preview](./Images/jenkins228.png)
* User `Harish` is assing to `devops engineer` with `admin access` so he as the all the rights including `manage jenkins` and `deleting the project` 
![Preview](./Images/jenkins229.png)
![Preview](./Images/jenkins230.png)
* Now Login in the private window and check the access for user `chitra`
![Preview](./Images/jenkins231.png)
* User `chitra` is assign to role called `testing` with only `read access` so she will not have any access even she dont have `build`, `delete` and `manage jenkins` only she has   `view` access
![Preview](./Images/jenkins232.png)
![Preview](./Images/jenkins233.png)

* **Project based strategy**
#### Steps:
* Created two users
![Preview](./Images/jenkins234.png)
* Create New Java Project
![Preview](./Images/jenkins235.png)
![Preview](./Images/jenkins236.png)
![Preview](./Images/jenkins237.png)
![Preview](./Images/jenkins238.png)
* create python project
![Preview](./Images/jenkins239.png)
![Preview](./Images/jenkins240.png)
* Navigate => `Manage Jenkins`=>`Manage and Assign Roles`=> `Manage Roles`
* create Roles and pattern for project to access
![Preview](./Images/jenkins241.png)
![Preview](./Images/jenkins242.png)
![Preview](./Images/jenkins243.png)
* Now add users to permision of Roles
![Preview](./Images/jenkins248.png)
![Preview](./Images/jenkins249.png)
![Preview](./Images/jenkins250.png)
![Preview](./Images/jenkins251.png)
* Now Assign Roles for users which is created for projects
* Navigate => `Manage Jenkins`=> `Manage and Assign Roles`=>`Assign Roles`
![Preview](./Images/jenkins244.png)
![Preview](./Images/jenkins245.png)
![Preview](./Images/jenkins246.png)
![Preview](./Images/jenkins247.png)
* Now Login as user `anand` and check the access and project visibility, we have assigned for `anand` `Java-Roles-Project`
  * we have given user `anand` only read permission
![Preview](./Images/jenkins252.png)  
![Preview](./Images/jenkins253.png)
![Preview](./Images/jenkins254.png)
* Now Login as user `vijay` and check the access and project visibility, we have assigned for `vijay` `python-Roles-Project`
 * we have given user `vijay` more  permission compare to anand
![Preview](./Images/jenkins255.png)
![Preview](./Images/jenkins256.png) 

Maven – Remote Repo
--------------------
* Maven has 3 repositories
   * local repo (~/.m2)
   * Remote Repo: This exists in organization controlled environment
   * Central repo: This is public maven repository.  means like in screen shot shown from internet
   ![Preview](./Images/jenkins257.png)
* Workflows:
  * After every night build push the artifacts and pom.xml file to remote repo   
  * when resolving dependencies use remote repository.   
    * what above line specify means downloading dependencies from remote repo to local repo 

Artifact Repository
-------------------
* There are two popular options for java
   * jfrog/artifactory
   * Nexus
* Azure DevOps has Azure Artifacts
* In this series we will be using jfrog/artifactory for its multi language repository support.
### To Create Jfrog Free Account
* [Refer Here](https://jfrog.com/start-free/) only for 14 day free trail account later it will expire and we needs to create new account 
#### Steps:
* select google account to create jfrog account
![Preview](./Images/jenkins258.png)
* select the gmail account for jfrog account creation
![Preview](./Images/jenkins259.png)
![Preview](./Images/jenkins260.png)
![Preview](./Images/jenkins261.png)
![Preview](./Images/jenkins262.png)
![Preview](./Images/jenkins263.png)
![Preview](./Images/jenkins264.png)
* Create a repository
![Preview](./Images/jenkins265.png)
* select the repository which project we are working on, now ill select maven since i am working on java project 
![Preview](./Images/jenkins266.png)
![Preview](./Images/jenkins267.png)
![Preview](./Images/jenkins268.png)



Artifactory Jenkins integration with Jfrog
-------------------------------------------
#### For configuring jenkins with artifactory [Refer Here](https://directdevops.blog/2019/10/17/artifactory-configuration/)

* Login into jfrog
* create new group called `devops` and add the user into `devops` group 
![Preview](./Images/jenkins269.png)
![Preview](./Images/jenkins270.png)
* groups `devops` successfully created
![Preview](./Images/jenkins271.png)
* Generate the Access Token
![Preview](./Images/jenkins272.png)
![Preview](./Images/jenkins273.png)
![Preview](./Images/jenkins274.png)
* copy the token and paste into notpad
![Preview](./Images/jenkins275.png)
* Now Login into Jenkins
   * Install artifactory plugin in jenkins
   * Navigate to `Manage Jenkins` > `Plugins`
   ![Preview](./Images/jenkins276.png)
   ![Preview](./Images/jenkins277.png)
   * Now Navigate to `Manage Jenkins`=> `Credentials` 
   ![Preview](./Images/jenkins278.png)
   * create a credential with secret text, 
     * that is while creating group in user management we have created access token rite, that one we needs to paste into secret text column 
    ![Preview](./Images/jenkins279.png)
    ![Preview](./Images/jenkins280.png)
    ![Preview](./Images/jenkins281.png)

* Now Navigate to `Manage Jenkins` => `System` => `Jfrog`
![Preview](./Images/jenkins282.png)
![Preview](./Images/jenkins283.png)

### Now Lets Build FreeStyle spring-petclinic project and deploy artifact to artifactory repository (jfrog)
* These below links are just for reference
* [Refer Here](https://jfrog.com/help/r/jfrog-integrations-documentation/jenkins-artifactory-plug-in) for official docs of jfrog artifactory pipeline
* [Refer Here](https://github.com/jfrog/project-examples/tree/master/jenkins-examples/pipeline-examples/declarative-examples) for samples of jfrog jenkins pipelines
* [Refer Here](https://github.com/jfrog/project-examples/blob/master/jenkins-examples/pipeline-examples/declarative-examples/maven-example/Jenkinsfile) for specific jenkins pipeline using maven build the project and pushing to jfrog 
#### Steps FreeStyle spring-petclinic project:
* [Refer Here](https://github.com/dummyreposito/spring-petclinic) for spring-petclinic repo
![Preview](./Images/jenkins284.png)
![Preview](./Images/jenkins285.png)
![Preview](./Images/jenkins286.png)
![Preview](./Images/jenkins287.png)
![Preview](./Images/jenkins288.png)
![Preview](./Images/jenkins289.png)
* Build is result success
![Preview](./Images/jenkins290.png)

### Lets Build pipeline spring-petclinic project
* after build the artifact deploy to jfrog artifact repository 
* same project above we have builded as freestyle way but now we are doing in pipeline way


#### Steps:
![Preview](./Images/jenkins291.png)
![Preview](./Images/jenkins292.png)
![Preview](./Images/jenkins293.png)
* Build result got success and select build info to see artifact in jfrog
![Preview](./Images/jenkins294.png)
* check jenkins has deployed artifact of spring petclinic project into jfrog artifactory repository 
![Preview](./Images/jenkins295.png)
* The pipeline example of jenkinsfile

```Jenkinsfile

pipeline{
    agent any
    options{
        timeout(time:30, unit: 'MINUTES')
    }
    triggers{
        pollSCM('* * * * *')
    }
    tools{
        jdk 'JDK_17'
    }
    stages{
        stage('git checkout'){
            steps{
            git branch: 'develop', url: 'https://github.com/dummyreposito/spring-petclinic.git'
            }
        }
        stage ('Artifactory configuration') {
            steps {
                 rtMavenDeployer (
                    id: "spc_DEPLOYER",
                    serverId: "jrog",
                    releaseRepo: 'spc-app-libs-release-local',
                    snapshotRepo: 'spc-app-libs-snapshot-local'
                )

        }
        }
          stage ('Exec Maven') {
            steps {
                rtMavenRun (
                    tool: 'Maven 3.9.6',  // Tool name from Jenkins configuration
                    pom: 'pom.xml',
                    goals: 'clean install',
                    deployerId: "spc_DEPLOYER"
                   // buildName: "${JOB_NAME}",
                    // buildNumber: "${BUILD_ID}"
                )
            }
        }
        stage ('Publish build info') {
            steps {
                rtPublishBuildInfo (
                    serverId: "jrog"
                )
            }
        }
        stage('Junit Results'){
            steps{
            junit testResults: '**/target/surefire-reports/TEST-*.xml' 
            }
        }
    }
    }

```

Static code Analysis
--------------------
#### Sonar Qube: means we will install sonar qube on our local system like ubuntu/linx and start using it
* for in this scenario we will use For static code analysis lets use sonar cloud.
* [Refer Here](https://docs.sonarsource.com/sonarcloud/advanced-setup/ci-based-analysis/jenkins-extension-for-sonarcloud/#:~:text=Configure%20SonarCloud%3A,created%20as%20a%20) for sonar cloud configuration docs
* [Refer Here](https://www.sonarsource.com/products/sonarcloud/signup/) to create sonar cloud free account
* [Refer Here](https://directdevops.blog/2019/01/05/sonarqube/) for configuring and installing sonar qube

#### Now lets create a sonarqube static code analysis project and build it:
* Jenkins integration with sonar cloud
#### Steps:
* **Create Sonar cloud account:**
![Preview](./Images/jenkins296.png)
![Preview](./Images/jenkins297.png)
![Preview](./Images/jenkins298.png)
![Preview](./Images/jenkins299.png)
![Preview](./Images/jenkins300.png)
![Preview](./Images/jenkins301.png)
![Preview](./Images/jenkins302.png)
![Preview](./Images/jenkins303.png)
![Preview](./Images/jenkins304.png)
* we are done with creating sonar cloud account as well as project in sonar cloud
* Generate the token in the sonar cloud to configure in the jenkins credentials
![Preview](./Images/jenkins305.png)
![Preview](./Images/jenkins306.png)
![Preview](./Images/jenkins307.png)
* Make sure you the token copy it now, you won't be able to see it again!
* **Login into jenkins and configure sonar cloud token for credentials:**
* Navigate => `Manage Jenkins`=> `Credentials`
![Preview](./Images/jenkins308.png)
![Preview](./Images/jenkins309.png)
![Preview](./Images/jenkins310.png)
* Login into jenkins and go to `Manage Jenkins`=> `Plugins` install `SonarQube Scanner`
![Preview](./Images/jenkins311.png)
![Preview](./Images/jenkins312.png)
* **Log into Jenkins and configure SonarQube Scanner:**
* Navigate to `Manage Jenkins` => `Configure System`
![Preview](./Images/jenkins313.png)

* Lets create pipeline for spring petclininc project and build with static code analysis
![Preview](./Images/jenkins314.png)
![Preview](./Images/jenkins315.png)
![Preview](./Images/jenkins316.png)
* Now Build is success and observe extra icon has deducted of sonar qube, if we click on that icon it will take us to sonar cloud seen our project with code quality 
![Preview](./Images/jenkins317.png)
![Preview](./Images/jenkins318.png)
* check in sonar cloud dashboard about code quality 
![Preview](./Images/jenkins319.png)
![Preview](./Images/jenkins320.png)
![Preview](./Images/jenkins321.png)

* The pipeline code 
```Jenkinsfile
pipeline{
    agent any
    options{
        timeout(time:30, unit: 'MINUTES')
    }
    triggers{
        pollSCM('* * * * *')
    }
    tools{
        jdk 'JDK_17'
        maven 'Maven 3.9.6'
    }
    stages{
        stage('git checkout'){
            steps{
            git branch: 'develop', url: 'https://github.com/dummyreposito/spring-petclinic.git'
            }
        }
      
       
         stage('SonarQube analysis') {
            steps {

                // performing sonarqube analysis with "withSonarQubeENV(<Name of Server configured in Jenkins>)"
                withSonarQubeEnv('SONAR_Cloud') {
                // requires SonarQube Scanner for Maven 3.2+
                    sh 'mvn clean package sonar:sonar -Dsonar.organization=jenkins-projects -Dsonar.token=ceed9f04368e4216d7ca900c2cb65a08e708e70f -Dsonar.projectKey=jenkins-projects'
                }
            }
        }
        stage('Junit Results'){
            steps{
            junit testResults: '**/target/surefire-reports/TEST-*.xml' 
            }
        }
    }
    }
```

### Note:
* for different ecosystem means for different projects to do practice we can refer this link for azure devops projects 
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/ecosystems?view=azure-devops)

Git Hooks
------------
* Hooks help us in adding custom behavior to Git
* and also helps in predefined messages while adding, commit with local repo and remote repo.
* To handle local events git has client side hooks and to handle remote events git has server side hooks.
* [Refer Here](https://www.atlassian.com/git/tutorials/git-hooks) for git hooks docs 
![Preview](./Images/jenkins322)
* In .git folder you have hooks folder
![Preview](./Images/jenkins323.png)
* [Refer Here](https://github.com/aitemr/awesome-git-hooks) for sample hooks repo
* For Remote repositories which are self hosted, we can change the hooks
* For remote repo which is cloud hosted there we have to deal with access control for stopping users from pushing changes etc.


Webhooks in Jenkins:
--------------------
* [Refer Here](https://www.blazemeter.com/blog/how-to-integrate-your-github-repository-to-your-jenkins-project)
* Webhooks means integrating jenkins with github repository, any code is committed to github repository jenkins job will trigger automatically known as webhooks. 
![Preview](./Images/jenkins324.png)





















      



   







