# AzureDevOps:

* Azure DevOps was earlier called as Visual Studio Team Services
* Azure DevOps offers services to
   * manage agile projects
   * test management
   * Pipelines

* **Features of Azure DevOps:**
  * **Management:**
     * Azure Boards
     * Agile Management
  * **Testers:**
     * Test Management
  * **DevOps:**
     * Pipelines
  * **Developer:**
     * Version Control System

* Azure DevOps Features Artitecture:
![Preview](./Images/azdevops1.png)

### Azure DevOps setup:
* **Azure DevOps Server:**
  * We need to install azure devops software on Windows Servers
  * we needs to manage this azure devops software
* **Azure DevOps Services:**
  * This is already hosted by microsoft
  * We have just use by creating account
  * We can create account using
    * GitHub
    * Microsoft Account

### AzureDevOps Plans:
![Preview](./Images/azdevops2.png)
 * Free:
   * 1 Free Microsoft-hosted CI/CD (1800 minutes/month)
   * 1 Free Self-Hosted CI/CD
   * Azure Source Repos => free
   * Azure Artifacts 2 GB

* **Azure DevOps Account Creation Steps:**
  * if you have github account then login with it start free
  * if you have microsoft account or azure cloud account then login with it
  ![Preview](./Images/azdevops3.png)
  ![Preview](./Images/azdevops4.png)
  ![Preview](./Images/azdevops5.png)
  ![Preview](./Images/azdevops6.png)
  ![Preview](./Images/azdevops7.png)
* All Is Well Done Account Creation

### High level overview AzureDevOps:
![Preview](./Images/azdevops7.png)

* **AzureDevOps Services offered:**
  * **Wiki:**
     * we can create all the project related documentation for go through or for new comer to team to have overview of projects
  * **Boards:**
     * Its kind of jira, we track the work and create ticket and assign to team members  
     * Below Options avaiable:
       * product backlog
       * sprint backlogs
       * burn down charts
       * Scrum board  
     * **Azure Repos:**
        * Here manage all the source code/store all the source code of the projects
     * **Azure Pipelines:**
        * This is to manage CI/CD PipeLines and Execute our pipelines of the projects
     * **Azure Test Plans:**
        * Test management i.e. Test cases, executions, defects and reports are managed here
     * **Azure Artifacts:**
        * Here stores all build packages
        * After building the packages during the running of pipeline which will be getting artifacts/war/ear files will be stored here.

### DevOps pipeline High level overview                 
* Why do we need to do Continuous Integrations?
  * We do Continuos integrations multiple times in a day from day 1 of the project so that we can avoid surprises during big bang integrations.
  * Which means to avoid the issues the end of the closure of the project or sprints
* To perform automated integrations we need tools
  * build/package the code
  * run the tests
  * evaluate the test results  

* The idea is perform continuous integration for almost every change submitted by developer(s)
* This practice is recommended to avoid integration failures during later stages of the project
* Big bang integration leads to lot of technical debts.
* Continuous integration ideal workflow:
![Preview](./Images/azdevops8.png)
* The idea of Continuous integration is do give immediate feedback to the developer, about code status.

### Unit Tests:
* This generally represents smaller tests which test functionality at a unit level.
* Developers are responsible for developing unit tests
* With every change done by developer all the unit test needs to be executed and reports should be shown.
* For executing unit tests, each platform has multiple tools like below:
  * java: junit
  * dotnet: mstest, nunit
  * javascript: mocha, jasmine
  * python: pytest

* We need to show the test results with every change.
* here there is some trick with developers because they write unit tests something like below:
  ```py
  assert True == True
  ```
   * so this means this above line in the code says unit test will never fail in entire life, so to over come this issue or from developers tricks we have something called `Code Coverage tools`  
* Code Coverage tools should be included with test runs and code quality reports.
* Some organizations fail the builds based on these results which are often represented as Quality Gates.
* Notify the team via email/slack/teams the results of the build.
* CI pipelines start from source code repositories and end with artifact repository

### Terms:
* **Repository:** 
   * This represents a storage and it also has ability to store versions and history of changes.
* **Source Code Repository:**
   * This repository is used for storing code. This maintains history of every change that is done
   * **Examples:**
      * Git
      * Subversion
      * TFC
      * Perforce
* **Artifact:** 
   * Result of the build package.
* **Artifact Repository or Package Repository:** 
    * This repository is used for storing build packages/artifacts
    * **Examples:**
       * Jfrog/Artficatory
       * Nexus
       * **Docker:**
          * Container registries
     
### Difference between unit test and integration test:
* Unit test: means what developer written the code will test by developer, means test the entire code.
  * For an Example: in shopping cart add or remove the product checking in the order or cart this is known as unit test
* Integration test: means testing on all dependencies of what ever developer wrote the code.
  * For an Example: if a shopping cart the payment has done then order should be completed so there is some communication between payment and order this is known as integration test, how we will write the test from shopping cart we will write dummy order and then try to finish it, we are trying to test two components dependencies. 

### What does it mean to build the code:

* Developers write code using high level languages, but systems understand low level.
* To do this conversions we have three options:
  * **Compiler:**
    * High level to low level before executing the application.
    * Per Operating system we have a different release
  * **Interpreter:**
    * High level to low level during application execution.
    * Releases are same for different os
    * In every os we need to install interpreter
### Hybrid:
![Preview](./Images/azdevops9.png)

Azure DevOps Pipelines:
-----------------------
* Pipeline is collection of stages and stage is collection of jobs and job is collection of steps
* Stage: This represents a logical activity in ci/cd pipelines, examples: build, test, deploy. Each stage can be executed on a different agent/platform 
* In one stage we can multiple Jobs and if required they can run in parallel.

#### Azure DevOps has two ways of building pipelines:
   * Classic Pipelines
   * Azure Pipelines YAML

* **Classic Pipelines:**
   * We rely on user interface(UI)
   * Like jenkins freestyle(UI)
     * **_Drawback:_**
       * History will be missing
     * **_Advantages:_**
       * Easy to start
* **Azure Pipelines YAML:**
   * Pipeline as Code. 
   * We will define pipelines steps in a file `azure-pipelines.yaml` and add it to the version control system (git)
   * Like jenkins pipeline projects and `azure-pipelines.yaml` is like a `(Jenkinsfile)`
     *  **_Advantage:_**
        * History will be maintained
     * **_Disadvantage:_**
         * Learning curve for writing pipeline

* **Azure DevOps has agents:** 
   * Agent is where the build is executed.
   * Like jenkins node
* **There are two types of agents:**   
   * **_Microsoft Hosted agents:_**
      * which azure will create a agent for us and once build is completed it will delete the agent, but we needs to tel azure where is agent.
      * These are machines which will be created on demand by Azure DevOps and will be delete upon build completion.
   * **_Self Hosted Agents:_**
      * These are machines managed by us, we add these machines as agents to Azure DevOps.
      
### Classic AzureDevops Projects:
* Starting first classic azuredevops project
* **_Steps:_**  
  * Create a project
  * Select repos and Select drop down of Learning_AzureDevOps 
  * Select import respository
  ![Preview](./Images/azdevops10.png)
  * Provide git url of repo to clone
  * then click on import
  ![Preview](./Images/azdevops11.png)
  * Now it will copy/import spring-petclinic repo into ur azuredevops repo
  ![Preview](./Images/azdevops12.png)
  ![Preview](./Images/azdevops13.png)
  * Set Main as default branch
  ![Preview](./Images/azdevops14.png)
  * Lets click on setup build 
  ![PReview](./Images/azdevops15.png)
  * Now select maven since my build tools is maven to build the project/package
  * Now it will show us the yaml pipeline formate which is going to run with these yaml formate commands
  * so save and run
  ![Preview](./Images/azdevops16.png)
  * creating pipeline
  ![Preview](./Images/azdevops18.png)
  * So now created job and its status in queue
  ![Preview](./Images/azdevops18.png)
  * now got error since we dont have microsoft hosted agent nor self hosted agent.
  * To solve this error we need to raise parallelism request, azure will grant us the microsoft agent to run the job [Refer Here](https://aka.ms/azpipelines-parallelism-request)
  * Raising request steps:
  ![Preview](./Images/azdevops21.png)
  ![Preview](./Images/azdevops22.png)
  ![Preview](./Images/azdevops23.png)
  * Now after submitting the request azure will take two days to provision microsoft agent
  * so after two days azure will give free server that is known as microsoft agent.
  ![Preview](./Images/azdevops19.png)
  ![Preview](./Images/azdevops20.png)
   
Configuring Self Hosted Agent in Azure DevOps:
---------------------------------------------
* Self Hosted Agent is the linux/windows/mac/our laptop instance managed by us
![Preview](./Images/azdevops24.png)

### Configuring Self hosted agents:
* Linux [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/linux-agent?view=azure-devops)
* Windows [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/windows-agent?view=azure-devops)
* Mac [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/osx-agent?view=azure-devops)

* To maintain collection of Agents, Azure has Agent pools. By default we will have two pools
  * default: for self hosted agents
  * Azure Pipelines: for Microsoft hosted agents

* Lets create self hosted agent as ubuntu linux vm and install, configure and run the agent

* **Steps:**
  * create ec2/vm 
  * Install required software to run the build for my project to run i needs openjdk-17

  ```bash
  sudo apt update
  sudo install openjdk-17-jdk
  sudo install maven -y 
  ```
  * go to azure devops UI select agent pools and click on default agent for self hosted and add the agent to run your project
 ![Preview](./Images/azdevops25.png)
 * select default and click on agents and add new agent
 ![Preview](./Images/azdevops26.png)
 * Now choose your agent based on your  machine.
 * i am choosing linux since i created ec2 machine with ubuntu linux
 ![Preview](./Images/azdevops28.png)
 * Now follow the steps in the screen shot or else ill put below also the steps just for reference

 ```bash
 # download the agent and configure
 cd /tmp
 wget https://vstsagentpackage.azureedge.net/agent/3.227.2/vsts-agent-linux-x64-3.227.2.tar.gz
# switch to home directory 
cd ~
# create a directory and switch to it
mkdir myagent && cd myagent 
# untar the downloaded tar file
tar -zxvf /tmp/vsts-agent-linux-x64-3.227.2.tar.gz 
# Configure the agent
./config.sh
# fill all the details after this above command and refer screen shot below
accept license agreement => enter => yes
Enter server url => https://dev.azure.com/ajaybillafz16
Enter authentication type for PAT => enter
Enter personal access token => qmr5hqob55642qj2hsjkda65fde6be4hexqt2qxidbm6ilzsyvnq
Enter agent pool => enter if default is your pool name, if not then provide your name of the pool
Enter agent name => enter for default name
Enter work folder => enter for default folder called _work
# finally only once to run then below command
./run.sh
# finally for ever to run then 
./svc.sh
```
![Preview](./Images/azdevops34.png)
![Preview](./Images/azdevops35.png)
![Preview](./Images/azdevops36.png)
* Now check agent is online
![PReview](./Images/azdevops37.png) 
* Now navigate to azure devops ui to azure pipeline
![PReview](./Images/azdevops38.png)
* Now we have to change the pools name in `azure-pipelines.yaml`
* navigate to repos 
![PReview](./Images/azdevops41.png)
* select `azure-pipelines.yml` and click on edit
![Preview](./Images/azdevops42.png)
* change pool name to `default` and commit the changes
![PReview](./Images/azdevops43.png)
![Preview](./Images/azdevops44.png)
![Preview](./Images/azdevops45.png)
* after changing default pool name, this is another change refer screen shot
![Preview](./Images/azdevops48.png)
* Lets run pipeline again
![PReview](./Images/azdevops39.png)
![Preview](./Images/azdevops40.png) 
* For the first time it will ask for permission just provide it 
* click on view
![Preview](./Images/azdevops46.png)
* Click on permit
![Preview](./Images/azdevops47.png)
* where it is building the job in our server which we created and hosted/configured the self agent
![Preview](./Images/azdevops49.png)
![Preview](./Images/azdevops50.png)
* Build got success
![Preview](./Images/azdevops51.png)

* **Steps to generate PAT:**
 * To Get Personal Access Token(PAT)
   * navigate to user setting right on top
  ![Preview](./Images/azdevops29.png)
   * select PAT
   * click new token
  ![Preview](./Images/azdevops30.png)
   * select scopes/access with option 
     * full access
     * custom defined access (in companies most of we will use restricted access only)
   * Now here i am choosing full access
   * fill the details and click create
   ![Preview](./Images/azdevops31.png)
   * once token is created copy some where, if not after closing the window it not be see.
   ![Preview](./Images/azdevops32.png)
   ![Preview](./Images/azdevops33.png)

* Azure Pipelines are represnted in YAML Format. YAML is used as a Data representation format

### YAML Writing Method:
* YAML is name value pair collection
* syntax

`<name>: <value>`

* Value holds data and types of data are
* Simple/Scalar:
     * text: `course: AzureDevOps` or `course: "AzureDevOps"` or `course: 'AzureDevOps'`
     * number: `duration: 120`
     * boolean `online: yes` or `online: true`

* Complex:
   * list/array/plural
```yaml
tools: 
- git
- maven
- jfrog
- sonarqube
```

* object/map/dictionary
```yaml
address:
flat: 407
building: mytrivanam
street: ameerpet main road
area: ameerpet
landmark: metro
pincode: 500016
```

* Sample YAML:
  * Writing a resume:

```yaml
contact:
  mobile: 9999999
  email: info@qt.in
# here below pipe symbol represents as multiple text.
# if we needs to write or address multiple text then # we can use pipe symbol  
CareerObjective: |
    A motivated individual with in-depth knowledge of languages 
    and development tools, seeking a position in a growth-oriented 
    company where I can use my skills to the advantage of the 
    company while having the scope to develop my own skills.
ExpertiseAreas:
  - Project Management
  - DevOps
WorkExperience:
  - organization: Radiant Spark
    duration: 03/2014 - present
    designation: senior software engineer
    randr:
      - Eat healthy
      - Drink every night
      - sleep on time
  - organization: Technet
    duration: 03/2011 - 02/2014
```

* Now lets look at azure-pipelines.yaml sample:

```yaml
trigger:
  - main
pool: default
steps:
  - task: Bash@3
    inputs:
      targetType: 'inline'
      script: 'mvn package'
```

Azure DevOps YAML Schema:
--------------------------
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/?view=azure-pipelines) for azure devops yaml schema official docs
* Generally the pipeline as a code is represented in a file called as `azure-pipelines.yaml`.
* The name of the file is not fixed. We can give any name but `azure-pipelines.yaml` is most widely used.
* Azure Pipelines is collection of
  * **Stages:** Each Stage is collection of Jobs
  * **Job:** Each job is collection steps
  * **Step:** A unit of activity. Which we want to perform using azure devops pipeline
![Preview](./Images/azdevops52.png)

* If we have only one stage then Azure Pipeline is collection of Jobs and 
  * if Azure pipeline has only one stage and one job then Azure pipeline can be considered as set of steps
* Like below screen shot:
![Preview](./Images/azdevops53.png)
* If we multiple stages then we needs to write jobs and steps multiple
* if in case we dont have multiple stages, means only one stage then not required to write stage, job, directly we can write steps. and the actual work is done at the step level. means perform/implementation.

### Sample of writing azure devops pipelines yaml:

* **_First Version (Stage,job and steps):_**

```yaml
---
pool: default
stages:
- stage: buildpackage
  displayName: build package using maven
  jobs:
  - job: buildpackage
    displayName: build package using maven
    steps:
    - bash: 'mvn package'  
```
* check in repos `azure-pipelines.yaml` we have added the above code and run
![Preview](./Images/azdevops54.png)

* check the pipeline display name for stage and display name for job, it is our identification we wrote 
![Preview](./Images/azdevops55.png)


* **_Second Version (Job and steps)_**
```yaml
---
pool: default
jobs:
  - job: buildpackage
    displayName: build package using maven
    steps:
    - bash: 'mvn package' 
```
* check in repos `azure-pipelines.yaml` we have added the above code and run
![Preview](./Images/azdevops56.png)
* check the pipeline display name for job, it is our identification we wrote, also in this pipeline there is no stage even though job is running
![Preview](./Images/azdevops57.png)


* **_Third version (steps)_**
```yaml
---
pool: default
steps:
  - bash: 'mvn package'
```
* check in repos `azure-pipelines.yaml` we have added the above code and run
![Preview](./Images/azdevops58.png)
* check the pipeline there is no display name at all,it is our identification we wrote, but here only steps we wrote, also in this pipeline there is no stage and job even though job is running
![Preview](./Images/azdevops59.png)

* Based on situation we decide what should write on above work flow of azure devops pipeline of yaml.

* so based on the above screen shot proof, it proves that if it is only one stage then not required to write stage or job directly we can write steps since, the third version is also worked with spring petclinic
* so now it proves we can write any of these one in `the azure-pipelines.yaml` file 

## Azure DevOps Steps:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/steps?view=azure-pipelines) for list of types
### Types of Steps:

* **task:** 
   * reusable build/deploy/utility steps
* **script:** 
   * Runs a script using cmd.exe on Windows and Bash on other platforms.
* **powershell:**
    *  Runs a script in a powershell
* **pwsh:** 
    * Runs a script in a powershell core on Windows, macOS, and Linux.
* **bash:**
    *  Runs a script in Bash on Windows, macOS, and Linux.
* **download:**
   * Downloads artifacts associated with the current run or from another Azure Pipeline that is associated as a pipeline resource.
* **downloadBuild:**
   * Downloads build artifacts.
* **getPackage:**
   * Downloads a package from a package management feed in Azure Artifacts or Azure DevOps Server.
* **publish:**
   * Publishes (uploads) a file or folder as a pipeline artifact that other jobs and pipelines can consume.
* **template:**
   * Define a set of steps in one file and use it multiple times in another file.
* **reviewApp:**
   * Downloads creates a resource dynamically under a deploy phase provider.
* **checkout:**
    * Configure how the pipeline checks out source code

* Azure DevOps allows us to create reusable steps where we fill the yaml and it does the rest. This is done by Task.
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/reference/?view=azure-pipelines) for task
* If you want to develop a reusable task [Refer Here](https://learn.microsoft.com/en-us/azure/devops/extend/develop/add-build-task?view=azure-devops) 

#### Install Azure Pipelines Extension into Visual Studio Code:
 * Azure Pipelines Microsoft microsoft.com
 ![Preview](./Images/azdevops60.png)

### We started writing simple yaml for maven using task:

```yaml
---
pool: default
steps:
- task: Maven@4
  inputs:
    mavenPomFile: 'pom.xml'
    goals: 'package'
    publishJUnitResults: true
    testResultsFiles: '**/surefire-reports/TEST-*.xml'
    javaHomeOption: Path
    jdkVersionOption: '1.17'
    jdkDirectory: '/usr/lib/jvm/java-17-openjdk-amd64'
    mavenVersionOption: Path
    mavenDirectory: '/usr/share/maven'
```
![Preview](./Images/azdevops61.png)
![Preview](./Images/azdevops62.png)

# Build a dotnet application:
   * Project url NopCommerce:[Refer Here](https://github.com/nopSolutions/nopCommerce)
   * branch: master
   * pre-req’s: in the azure agent:
        * git
        * dotnet 7 sdk [Refer Here](https://learn.microsoft.com/en-us/dotnet/core/install/linux-ubuntu-2204)
```bash
sudo apt-get update && \ 
sudo apt-get install -y dotnet-sdk-7.0
dotnet --list-runtimes
```        
### Manual steps:

```
git clone https://github.com/nopSolutions/nopCommerce.git
cd nopCommerce/
git checkout master
# below command is to build the project release version
dotnet build src/NopCommerce.sln -c Release
# to check the list of test commands
dotnet test --help
# to test the project below command
dotnet test  src/Tests/Nop.Tests/Nop.Tests.csproj -o TestResults  -c Release
# Publishes the application and its dependencies to a folder for deployment to a hosting system
#  The dotnet publish command's output is ready for deployment to a hosting system
dotnet publish src/Presentation/Nop.Web/Nop.Web.csproj -c Release -o published/
```
* check below screen shot for testresult and publish folder
![PReview](./Images/azdevops63.png)

### Dotnet projects: 
  * have two modes of building they are:
     * **Debug:**
        * Debug is to build develop environment 
     * **Release:**
        * Release is for rest of envionment means apart from develop environment
     * this is called as configuration `-c`    

### Command references for dotnet projects:
* **build:** [Refer Here](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-build)
* **test:** [Refer Here](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-test)
* **publish:** [Refer Here](https://learn.microsoft.com/en-us/dotnet/core/tools/dotnet-publish)

## Azure DevOps Pipeline:
* azure devops pipeline for Build a dotnet application for above manual steps:
* Our agent is still default  
* make sure agent is online

### Build Steps:

```
dotnet build src/NopCommerce.sln -c Release
dotnet test -c Release src/Tests/Nop.Tests/Nop.Tests.csproj -o TestResults/
dotnet publish src/Presentation/Nop.Web/Nop.Web.csproj -c Release -o published/
```

* clone the repo in your local system to write azure-pipelines.yaml 
```bash
mkdir azure devops
cd azure devops
git clone https://ajaybillafz16@dev.azure.com/ajaybillafz16/Learning_AzureDevOps/_git/nopCommerce.git
cd nopCommerce/
code .
# create file 
azure-pipelines.yaml
# Add the below content in the `azure-pipelines.yaml`
pool: default
steps:
- task: DotNetCoreCLI@2
  displayName: NopCommerce 
  inputs:
    command: build
    projects: src/NopCommerce.sln
    configuration: Release 
# add, commit and push to azure repo
git add .
git commit -m "added azure-pipelines.yaml"
git push origin master 
```
* create new pipeline in azure devops
   * navigate to pipelines
   * click on new pipelines
   * select the azure repo, where is your code is contain
   * select the repository
   * Select existing an Azure Pipelines YAML file
   * select branch and provide path for your pipeline
   * click save and run pipeline 
* Build success:
![Preview](./Images/azdevops64.png)

### When should the project be built/trigger:
   * option 1: Whenever code is pushed/commit/changed to some branch
   * option 2: At schedule time
   * option 3: On Pull Request

### Sections in Azure DevOps pipeline yaml:
* trigger (option 1)[Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/trigger?view=azure-pipelines) Continuous integration triggers, commit/push/change

```bash
git add .
git commit -m "added trigger"
git push origin master
```   
* when we execute above command adding trigger section in `azure-pipelines.yaml` build starts automatically mean it triggers the build

```yaml
pool: default
trigger:
- master
steps:
- task: DotNetCoreCLI@2
  displayName: NopCommerce 
  inputs:
    command: build
    projects: src/NopCommerce.sln
    configuration: Release 
``` 
![Preview](./Images/azdevops66.png)  
![Preview](./Images/azdevops65.png)

* schedules (option 2) [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/schedules?view=azure-pipelines) and [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/schedules-cron?view=azure-pipelines#examples)

```bash
git add .
git commit -m "added schedules cron"
git push origin master
``` 
* when we execute above command adding schedule cron section in `azure-pipelines.yaml` build starts automatically at `every 5 minutes means` it triggers the build at `every 5 minutes`
* check below screen shot for proofs

```yaml
pool: default

schedules:
- cron: '*/5 * * * *'
  displayName: myfirst cron schedules
  always: true
  branches:
    include:
      - master 
steps:
- task: DotNetCoreCLI@2
  displayName: NopCommerce 
  inputs:
    command: build
    projects: src/NopCommerce.sln
    configuration: Release 
```
* check this below screen shot one build started at scheduled cron time, and another build is already in queue for next run at scheduled cron time, cron duration is `every 5 minute`
![Preview](./Images/azdevops67.png)
![Preview](./Images/azdevops68.png)
![PReview](./Images/azdevops69.png)
* check this below screen after first build started at `12:50` so now at `12:55` again second build started so that means the schedule cron is working
![Preview](./Images/azdevops70.png)
![preview](./Images/azdevops71.png)
![PReview](./Images/azdevops72.png)

* pr (option 3) => this one sir has not done the experiment.

#### As per above build steps, try with testing the project with test result:

```yaml
pool: default

trigger:
- master
steps:
- task: DotNetCoreCLI@2
  displayName: NopCommerce 
  inputs:
    command: build
    projects: src/NopCommerce.sln
    configuration: Release 
- task: DotNetCoreCLI@2
  displayName: NopCommerce-Test
  inputs:
    command: test
    projects: '**/*.Tests.csproj'
    configuration: Release 
    publishTestResults: true  
```

```bash
git add .
git commit -m "added test result for project"
git push origin master
```
* when executed above command build started and this time it will show or execute test result for the project since we have added another task called test.
![Preview](./Images/azdevops73.png)
![Preview](./Images/azdevops74.png)

#### Publishing build artifacts:
* As per above build steps, trying with publish the project and zip the files after publish
* and also using azure system variable with using predefined variables of azure.
* also trying to provide the location for publishing the artifact after building the code, incase if we dint give the output location or folder for publish azure is giving random or some strange location.
* changing the names displayed during build for below
   * build the code
   * test the code
   * publish the code

* after using azure system predefined variable we got the staging directory and build number, observe the screen shot below, this is only for explore purpose 

```yaml
pool: default

trigger:
- master
steps:

- bash: "echo staging directory $(Build.ArtifactStagingDirectory) and number $(Build.BuildNumber)"  
- bash: env  
- task: DotNetCoreCLI@2
  displayName: build the NopCommerce 
  inputs:
    command: build
    projects: src/NopCommerce.sln
    configuration: Release 
- task: DotNetCoreCLI@2
  displayName: publish NopCommerce
  inputs:
    command: publish
    projects: '**/*.Web.csproj'
    configuration: Release
    zipAfterPublish: true
```
![Preview](./Images/azdevops77.png)
* in this below screen shot we can see many env apart from our os, so that is the azure env variable we can use these azure variable by using this syntax: `$(variable-name)`

![PReview](./Images/azdevops78.png)


* when executed below pipeline build started and it build the artifact and published artifact to we specified directory with the help of azure system predefined variable.

```yaml
pool: default
trigger:
- master
steps:
- bash: "echo staging directory $(Build.ArtifactStagingDirectory) and number $(Build.BuildNumber)"  
- bash: env  
- task: DotNetCoreCLI@2
  displayName: build the NopCommerce 
  inputs:
    command: build
    projects: src/NopCommerce.sln
    configuration: Release 
- task: DotNetCoreCLI@2
  displayName: publish NopCommerce
  inputs:
    command: publish
    projects: '**/*.Web.csproj'
    configuration: Release
    zipAfterPublish: true
# here below arguments we used to publish the artifact and store in this below location so i have used azure system predefined variable    
# also i can use this below directory location.
###  arguments: '-0 $(BUILD_REPOSITORY_LOCALPATH)/published'
# but what azure tells is to store artifact, use specific location so we are antoher location that is below    
    arguments: "-o $(Build.ArtifactStagingDirectory)/Published" 
```
```bash
git add .
git commit -m "added publish and zip publish"
git push origin master
```
* observe this below screen shot published artifact to specified directory and location
* as we said to zip the artifact published and store in directory name called published and location used as azure system predefined variable location that is ` /home/ubuntu/myagent/_work/1/a/Published/` 
![Preview](./Images/azdevops76.png)
![Preview](./Images/azdevops79.png)
![Preview](./Images/azdevops80.png)

* **PublishBuildArtifacts:**
  * Now still we are unable to download the zip file after published so for that we will use something called `PublishBuildArtifacts` [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/tasks/reference/publish-build-artifacts-v1?view=azure-pipelines) 
  * after we follow/write another task called `PublishBuildArtifacts` then we can able to download the published zip file.
  * in this example we giving publishing location as container so that zip file will store in the azure devops container itself. here we have other option like azure file share but not interested. 
  * but further we can store in two places, azure artifact repo or jfrog repo to store all the artifact.

 ```yaml
 pool: default

trigger:
- master
steps:

- bash: "echo staging directory $(Build.ArtifactStagingDirectory) and number $(Build.BuildNumber)"  
- bash: env  
- task: DotNetCoreCLI@2
  displayName: build the NopCommerce 
  inputs:
    command: build
    projects: src/NopCommerce.sln
    configuration: Release 
- task: DotNetCoreCLI@2
  displayName: publish NopCommerce
  inputs:
    command: publish
    projects: '**/*.Web.csproj'
    configuration: Release
    zipAfterPublish: true   
    arguments: "-o $(Build.ArtifactStagingDirectory)/Published"
- task: PublishBuildArtifacts@1
  displayName: publish artifact available to download
  inputs:
    PathtoPublish: '$(Build.ArtifactStagingDirectory)/Published/Nop.Web.zip'
    ArtifactName: 'nop'
    publishLocation: 'Container'
 ``` 

```bash
git add .
git commit -m "added publish and zip publish"
git push origin master
```
* after executing above command build will start trigger automatically and does all the below work. 

* check below screen shot published artifact and available to download
![Preview](./Images/azdevops81.png)
* go to job and click on artifact to download
![Preview](./Images/azdevops82.png)
* after clicking artifact, it will navigate to artifact page and allow us to download check below screen shot.
![Preview](./Images/azdevops83.png)

* check below screen shot changed name for build,test and publish
![Preview](./Images/azdevops75.png)


## Variables in Azure DevOps Pipelines:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch) for official docs entire variables

### Three Types of variables:
* **user-defined variables:**
   * [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch#user-defined-variables)
* **System variables:**
   * [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch#system-variables)   and for predefined variables [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/build/variables?view=azure-devops&tabs=yaml)
* **Environment variables:**
   * [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch#environment-variables)   

* Syntax for using variables: `$(Variable-Name)`

## Microsoft Hosted Agents:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/agents/hosted?view=azure-devops&tabs=yaml) for the official docs

* so far we building the azure pipeline in self hosted agent, but now we will build azure pipeline in microsoft hosted agent.

#### Benefits/advantages of using microsoft hosted agents:
* azure will created vm for us when we specify/selecting image name
* all the software by default will be installed by azure 

#### Disadvantages of using microsoft hosted agents:
* azure will provision virtual machines with a 2 core CPU, 7 GB of RAM, and 14 GB of SSD disk space. this is for Windows and Linux. we cannot increase the configuration of microsoft hosted agent. 
* incase we needs something more configuration then needs to choose self agent hosted only.
* cost is more compare to self hosted agent because azure is going to created vm for us, by just specifying vm image name.

* Refer below for pool syntax:
   * microsoft hosted agent pool syntax
     * [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pool?view=azure-pipelines) and [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/pool?view=azure-pipelines#poolobjectproperties) 

* In this example we will build our `azure-pipelines.yaml` in microsoft hosted agent
* Steps:
  * pre-requisite:  
   * check free minutes are available for build the azure pipelines in microsoft hosted agent
   * if not click on parallel job and add 1 parallel job which azure will charge for that
   * then write your azure-pipelines.yaml and run the pipeline 
* how to check microsoft hosted agent has been provisioned by azure after parallelism request has been raised 
* **Steps:**
   * navigate to azure devops 
   * click on agent pool 
   ![Preview](./Images/azdevops84.png)
   * click on azure pipelines and select agents
   * can see hosted agent online in green colour 
   ![Preview](./Images/azdevops85.png)


* Lets run nopCommerce on Microsoft Hosted Agent:

```yaml

pool: 
  name: Azure Pipelines # mention the Name of a pool in agent pool from azure devops UI 
  vmImage: ubuntu-22.04 # Name of the VM image you want to use select azure document in the Microsoft-hosted pool
trigger:
- master
steps:
- bash: "echo staging directory $(Build.ArtifactStagingDirectory) and number $(Build.BuildNumber)"  
- bash: env  
- task: DotNetCoreCLI@2
  displayName: build the NopCommerce 
  inputs:
    command: build
    projects: src/NopCommerce.sln
    configuration: Release 
- task: DotNetCoreCLI@2 
  displayName: publish NopCommerce
  inputs:
    command: publish
    projects: '**/*.Web.csproj'
    configuration: Release
    zipAfterPublish: true   
    arguments: "-o $(Build.ArtifactStagingDirectory)/Published"
- task: PublishBuildArtifacts@1
  displayName: publish artifact availabel to download
  inputs:
    PathtoPublish: '$(Build.ArtifactStagingDirectory)/Published/Nop.Web.zip'
    ArtifactName: 'nop'
    publishLocation: 'Container'
```

```
git add .
git commit -m "added pipeline for microsoft hosted agent"
git push origin master
```
* after executing the above command build will run automatically and build the azure pipelines 

* check below screen shot all details available
![Preview](./Images/azdevops86.png)


## Jobs in Azure DevOps Pipelines:
* Using jobs we will build azure pipelines
* since we are using one stages so not required to write stage directly we can write multiple jobs
* We will be using multiple jobs in Azure DevOps Pipeline
* One job builds dotnet code
* Other job builds the docker image
* so this is called parallel job execution and this is the advantages of jobs 

#### Manual commands:
  * we already know manual commands to build dotnet project since ignoring it manual steps for that we can copy from above in some other examples
  * Docker manual commands:

  `docker image build -t devops/nopCommerce .`

* Needs to install docker:
   * since we are using docker to build the image

```
curl -fsSL https://get.docker.com -o install-docker.sh
sh install-docker.sh
# sudo usermod -aG docker ubuntu
#exit
# relogin
docker info
```
* **Please Note:**
   * building the dotnet project ill be running on self hosted agent, so no needs to install docker on it, only install dotnet sdk for it
   * building the docker image ill be running on microsoft hosted agent so install only docker on it. but on microsoft hosted agent already all the software has been installed so just cross verify it. 

* Lets create pipeline for jobs:

```yaml


```

```bash
git add .
git commit -m "added jobs"
git push origin master
```
* when above command build will trigger automatically and produce the output

* check below screen shot parallel execution of jobs is happening self hosted agent is building dotnet project and microsoft hosted agent is building docker image 
* Executions of jobs will happen by default in parallel
![Preview](./Images/azdevops87.png)
![PReview](./Images/azdevops88.png)

## Depends On:
 * In this example let us understand depends on concept by create some dummy examples in azure pipelines.
#### Scenario:
* We have 3 jobs
   * sanity check jobs
   * dotnet build jobs
   * docker build jobs
* We need to execute dotnet build and docker build in parallel but after sanity check is done.
* In these cases we use `dependsOn`     

```yaml


```

```bash
git add .
git commit -m "added depends on"
git push origin master
```

* when executing above command build will start automatically and jobs will build

* check this below screen shot only sanity check job is running rest are in ideal for 2 minutes
![Preview](./Images/azdevops89.png)
![Preview](./Images/azdevops90.png)

* check this below screen shot after 2 minutes of sanity check executing, rest two jobs that is dotnet and docker job is started
![Preview](./Images/azdevops91.png)

#### Failure in the parent job will stop executing all the child jobs:
* if one job is failed then rest of all its dependencies or child jobs will fail because pipeline will get halt and stop executing other jobs
* so if needs to continue further fix the job which is failed then continue 

```yaml
---

trigger:
- master

jobs:
- job: sanitychecking
  displayName: to understand depends on 
  pool: default
  steps:
  - bash: "echo intentionally making this job to fail && exit 100" 
- job: dotnetbuild
  displayName: build dotnet code 
  pool: default
  dependsOn: sanitychecking
  steps:
  - bash: "echo staging directory $(Build.ArtifactStagingDirectory) and number $(Build.BuildNumber)"  
  - bash: env  
  - task: DotNetCoreCLI@2
    displayName: build the NopCommerce 
    inputs:
      command: build
      projects: src/NopCommerce.sln
      configuration: Release 
  - task: DotNetCoreCLI@2 
    displayName: publish NopCommerce
    inputs:
      command: publish
      projects: '**/*.Web.csproj'
      configuration: Release
      zipAfterPublish: true   
      arguments: "-o $(Build.ArtifactStagingDirectory)/Published"
  - task: PublishBuildArtifacts@1
    displayName: publish artifact availabel to download
    inputs:
      PathtoPublish: '$(Build.ArtifactStagingDirectory)/Published/Nop.Web.zip'
      ArtifactName: 'nop'
      publishLocation: 'Container'
- job: dockerbuild
  displayName: docker image build
  pool:
    name: Azure Pipelines
    vmImage: ubuntu-latest
  dependsOn: sanitychecking  
  steps:
  - task: Docker@2
    inputs:
      command: 'build'   
      Dockerfile: '**/Dockerfile' 
# we can give just tag name or we can mention with build id, this tag name is image name.       
      tags: devops/nopCommerce:$(Build.BuildId) 
```

```bash
git add .
git commit -m "added intentionally failure of job"
git push origin master
```

* when executing above command build will get started automatically and job starts building

* check this below screen shot when one job is failed so that other job also will fail
![Preview](./Images/azdevops92.png)
![PReview](./Images/azdevops93.png)

## Enable System Diagnostics:
* Enable System Diagnostics for pipelines failing due to unknown reasons, what is the benefits of enabling it.? 
* so when we enable system diagnostics we will get some extra information while running the build what will happen in the azure agent will show us ver detailed so that it will helpful in debugging or trouble shooting.
* Enabling system diagnostic, what azure devops will do is it will too much of information from the agent where build is running 
* Enabling system diagnostic is waste of time because it will increase our build time  

* click on Run pipeline
![PReview](./Images/azdevops94.png)
* check the box Enable system diagnostics and click Run to see the difference in running output with some extra information is displayed
![PReview](./Images/azdevops96.png)


## strategy: matrix, maxParallel:
* Using of matrix while defining multiple jobs, we can even define execution order of jobs for an example: we have written 20 jobs but we want to execute only 2 jobs so this we can achieve by using matrix and maxprallel 
* Using matrix job strategy we can build on multiple platforms 
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-job-strategy?view=azure-pipelines) for official docs to understand completely strategy matrix

## Key concepts Azure DevOps:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/get-started/key-pipelines-concepts?view=azure-devops) for below
* Continuous delivery
* Continuous integration
*  Continuous Deployment


## Azure DevOps Service Connections:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml) for official docs for Azure service connection
* Azure DevOps Service Connections gives options to integrate/connect with different providers
* what is above line means:
  * for an example we are creating some docker image and we want to push that created docker image to our private repository like - dockerhub, ACR, ECR, and Jfrog. so to connect these repository we needs to authenticate with our credentials, this credentials we needs write in azure devops yaml file which is not good approach since any one can miss use it.
  * For this reason the concept of Azure DevOps Service Connections came into picture it will facilitate  us to connect any repository. 
* so that while write writing our pipeline we dont have to give any credentials to connect external repository only we need is create azure service connection and provide that connection name in the pipeline  

### Lets create a service connection to docker hub:

#### Steps:
* First create repository in docker hub and provide that repository name in azure pipelines yaml file
![Preview](./Images/azdevops103.png) 
* login into azure devops
* navigate => project settings => select Service connections 
* click on create Service connections
![Preview](./Images/azdevops97.png)
* Choose a service or connection type
![Preview](./Images/azdevops98.png)
* fill details below screen shot
![Preview](./Images/azdevops99.png)
![Preview](./Images/azdevops100.png)
* click verify and save
![Preview](./Images/azdevops101.png)
![Preview](./Images/azdevops102.png)

```yaml
---

trigger:
- master

- job: dockerbuild
  displayName: docker image build
  pool:
    name: Azure Pipelines
    vmImage: ubuntu-latest
   
  steps:
  - task: Docker@2
    inputs:
      containerRegistry: mydockerhub 
      command: 'buildAndPush'  
      repository: ajaykumarramesh/nopfromazuredevops 
      Dockerfile: '**/Dockerfile' 
      tags: $(Build.BuildId)
```

```bash
git add .
git commit -m "added docker repository to push"
git push origin master
```

* when executing above command build will get started automatically and it will build docker image and push to docker hub registry.

![Preview](./Images/azdevops104.png)
* check docker hub there will be a image
![Preview](./Images/azdevops105.png)
![PReview](./Images/azdevops106.png)

## Parameters Variable in Azure DevOps Pipelines:
* [Refer](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/runtime-parameters?view=azure-devops&tabs=script) for parameters
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/parameters-parameter?view=azure-pipelines) for parameter yaml schema
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/runtime-parameters?view=azure-devops&tabs=script#parameter-data-types) Parameter data types
* Parameters variable means giving users a flexibility to change the value or pass the value or select the values 

### Examples for parameter variables:
* We have added a parameter for container registry:

```yaml
---  
parameters:
- name: containerRegistry
  displayName: service connection for docker hub
  type: string 
  default: mydockerhub  
trigger:
- none
jobs:
- job: dockerbuild
  displayName: docker image build
  pool:
    name: Azure Pipelines
    vmImage: ubuntu-latest
   
  steps:
  - task: Docker@2
    inputs:
      containerRegistry: ${{parameters.containerRegistry}}
      command: 'buildAndPush'  
      repository: ajaykumarramesh/nopfromazuredevops 
      Dockerfile: '**/Dockerfile' 
      tags: $(Build.BuildId)
```

```bash
git add .
git commit -m "added parametes"
git push origin master
```
* after executing above command, build will not start automatically since i have mentioned trigger is `none`
so we have to run build manually then it will ask the user to select the value/option for `service connection name for docker hub`, since we have set `parameters variable for container registry`.

* Parameters variable means giving users a flexibility to change the value or pass the value or select the values 

* check this below screen shot it is asking what is the service connection for docker hub.? so here if we give more then one value then we can select the option, but in this example i have given only one option that is `mydockerhub` so it showing only one option so this way we can give user flexibility using parameters variable
* and also here user should type a value to change it. 
![Preview](./Images/azdevops107.png)
* so important why we are giving default value is, if we dint mention default value then automate build will not run, since default is not mention and build will fail , in case if it is manual build then not required to give default value


* Check this below example same as above but we set `default = false` and mentioned the two values `mydockerhub and ACR` so it will ask us to select the value when we run the pipeline

```yaml
---  
parameters:
- name: containerRegistry
  displayName: service connection for registry 
  type: string 
  default: false
  values:
    - mydockerhub
    - ACR     
trigger:
- none 
jobs:
- job: dockerbuild
  displayName: docker image build
  pool:
    name: Azure Pipelines
    vmImage: ubuntu-latest
   
  steps:
  - task: Docker@2
    inputs:
      containerRegistry: ${{parameters.containerRegistry}}
      command: 'buildAndPush'  
      repository: ajaykumarramesh/nopfromazuredevops 
      Dockerfile: '**/Dockerfile' 
      tags: $(Build.BuildId)
```

```
git add .
git commit -m "added parameters variable of two values"
git push origin master
```
* after executing above command we needs to run pipeline manually since we set trigger to `none`
and then it will show two option of values to select, we needs to select any one to run the build.
![Preview](./Images/azdevops108.png)
![Preview](./Images/azdevops109.png)
* check below screen shot build is running after selected value
![Preview](./Images/azdevops110.png)
* created docker image and pushed to dockerhub
![Preview](./Images/azdevops111.png)
* here user cannot type the value as text, rather user can select the values out of two.  
* here we have set default to false, so it will not take any default value out of two, and also always default is false, so in case it should select default value then we needs to pass default value nor set default to true
* so important why we are giving default value is, if we dint mention default value then automate build will not run, since default is not mention and build will fail , in case if it is manual build then not required to give default value

### Example same as above/similar:  
* This example pipeline includes an `image` parameter with three hosted agents as `string` options. In the jobs section, the `pool` value specifies the agent from the parameter used to run the job. The `trigger` is set to none so that you can select the value of `image` when you manually trigger your pipeline to run.

```yaml
---
parameters:
- name: image
  displayName: Pool Image
  type: string
  default: ubuntu-latest
  values:
  - windows-latest
  - ubuntu-latest
  - macOS-latest
    
trigger: none
    
jobs:
- job: build
  displayName: build
  pool: 
    vmImage: ${{ parameters.image }}
  steps:
  - script: echo building $(Build.BuildNumber) with ${{ parameters.image }}
```

```bash
git add .
git commit -m "added parameters variable of three values"
git push origin master
```
* after executing above command, we needs to run the pipeline manually then we needs to select the Pool Image. If we don't make a selection, then the default option, `ubuntu-latest` gets used.

* check this below screen shot it shows three values to select the option, and out of which `ubuntu-latest` shows default
![Preview](./Images/azdevops112.png)

* check this below screen shot after select default value and ran the pipeline the output of pipeline is shown as per `-script`
![Preview](./Images/azdevops113.png)

* here user cannot type the value as text, rather user can select the values out of three.  
* here we have set default to false, so it will not take any default value out of three, and also always default is false, so in case it should select default value then we needs to pass default value nor set default to true
* so important why we are giving default value is, if we dint mention default value then automate build will not run, since default is not mention and build will fail , in case if it is manual build then not required to give default value


## User Defined Variables in Azure Devops:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch#user-defined-variables) User-defined variables
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/variables?view=azure-pipelines) user-defined variable yaml schema 
#### Understand variable syntax:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch#understand-variable-syntax) To Understand variable syntax
* Azure Pipelines supports three different ways to reference variables:
  * macro, 
  * template expression, and 
  * runtime expression.
* You can use each syntax for a different purpose and each have some limitations.
* **In a pipeline:**
  * template expression variables `${{ variables.var }}` get processed at compile time, before runtime starts.
  * Macro syntax variables `$(var)` get processed during runtime before a task runs.
  * Runtime expressions `$[variables.var]` also get processed during runtime but are intended to be used with `conditions` and `expressions`.When you use a runtime expression, it must take up the entire right side of a definition.
     * For example, `key: $[variables.value]` is valid
     * For example, `$[variables.key]: value` or `key: $[variables.value] foo` not valid
* Variable three different types of syntax table:
![Preview](./Images/azdevops116.png)

* user defined is variable is for us to use within the pipeline instead of hardcoding the pipeline.
it is not for user to pass the variable or option. 


### Example of String Variable:
* We have added a simple variable for docker file location

```yaml
---  
variables:
  dockerfilelocation: '**/Dockerfile' 

trigger:
- none  

jobs:
- job: dockerbuild
  displayName: docker image build
  pool:
    name: Azure Pipelines
    vmImage: ubuntu-latest
   
  steps:
  - task: Docker@2
    inputs:
      containerRegistry: ${{parameters.containerRegistry}}
      command: 'buildAndPush'  
      repository: ajaykumarramesh/nopfromazuredevops 
      Dockerfile: $(dockerfilelocation)  
      tags: $(Build.BuildId)
```

```bash
git add .
git commit -m "added string variable"
git push origin master
```

* after executed above command, needs to run build manually since trigger set to `none`

* so observe the above pipeline instead of hardcoding the dockerfile location we have used variable 
* by using variable it found out the dockerfile and build the image and push to docker hub registry and image version/tag is `67`
![Preview](./Images/azdevops114.png)
![PReview](./Images/azdevops115.png)

## Multi Stage pipeline in Azure Devops:
* there is two things in multistage pipeline
   * Approval
   * Non Approval
* Stages pipeline are sequently execution of build, step by step, for an example first it will build then it will deploy
* where as jobs pipeline is parallel execution of build.   

### The basic pipeline Overview of Multi Stage:
![Preview](./Images/azdevops117.png)

### Example of Multi Stage pipeline:
* So this example of pipeline is for non approval
   * directly build and deploy the application with out approval process

#### Manual steps

```bash
# Remove all contianer
docker container rm -f $(docker container ls -a -q)
# remove all images
docker image rm -f $(docker image ls -q)
docker container run -d --name nop -P ajaykumarramesh/nopfromazuredevops
```

#### YAML File Used:

```yaml

```

```bash
git add .
git commit -m "added multistage pipeline"
git push origin master
```

* after executing above command build will execute automatically and execute sequently order stage by stage.  

* check this below screen shot how stages looks
![Preview](./Images/azdevops118.png)
* check this below screen shot how build will execute stage by stage, first stage it will build and second stage it will deploy the application.
![Preview](./Images/azdevops119.png)

## Approvals in Azure DevOps:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/approvals?view=azure-devops&tabs=check-pass) for approval process
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/environments?view=azure-devops) for creating environment
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/yaml-schema/jobs-deployment?view=azure-pipelines) for deployment yaml schema

### Environment: 
* Allows us to add resources in 
   * kubernetes
   * virtual machines
* what this above means is we can deploy our applications in kubernetes cluster nor in virtual machines, but for us both is not required because we going to call terraform to create kubernetes nor ansible to create virtual mahcine in this case so we will select always Resource as `none` but if it is necessary that already our k8s cluster or virtual machine is created and we want to deploy our application in that. then we will go with other option selecting Resource as `k8s` or `virtual machine`

### Steps:
* Create an environment
* Navigate pipelines => Environment
![Preview](./Images/azdevops120.png)
![PReview](./Images/azdevops121.png)
* check this below screen shot what it says:
  * Your environment is ready to use in pipeline YAML  `environment: deployment-docker` so this environment block we will use in our azure pipeline yaml to see the approval process. 
![Preview](./Images/azdevops122.png)
* **Now Approvals and checks:**
* click on plus symbol to add approvals and checks
![Preview](./Images/azdevops123.png)
* Follow the screen shots
![PReview](./Images/azdevops124.png)
![Preview](./Images/azdevops125.png)
![Preview](./Images/azdevops126.png)
* here we have selected `none` because already we have an `self hosted agent` so we are going to deploy docker on our own agent.
* But environment support/allow us to add resources in the `kubernetes` or `virtual machine`.
* for more brief about environment look definition above.

* Now we are going to use Deployment and environment in our yal file to see the approval process.

* in this example we are using strategy run once but for other strategy refer deployment yaml schema

```yaml
---  
trigger:
  - master

parameters:
- name: containerRegistry
  displayName: Service Connection For Docker Image
  default: 'mydockerhub'
- name: vmImage
  displayName: Microsoft Hosted Agent Name
  default: 'ubuntu-22.04' 
  values:
  - windows-2022
  - windows-2019
  - ubuntu-22.04
  - ubuntu-20.04  

variables:
  dockerfilelocation: '**/Dockerfile' 
  
stages:
- stage: buildstage  
  displayName: build application  
  jobs:
  - job: dockerbuild
    displayName: docker image build
    pool:
      name: Azure Pipelines
      vmImage: ${{parameters.vmImage}} 
    steps:
    - task: Docker@2
      inputs:
        containerRegistry: ${{parameters.containerRegistry}}
        command: 'buildAndPush'  
        repository: ajaykumarramesh/nopfromazuredevops 
        Dockerfile: $(dockerfilelocation)  
        tags: $(Build.BuildId)

- stage: deploystage
  displayName: deploy the application
  
  jobs:
  - deployment: deploycontainer
    displayName: Run the nop commerce
    pool: default 
    environment: deployment-docker
    strategy: 
      runOnce:
        deploy:
          steps:
          - bash: docker container rm -f $(docker container ls -a -q)
            displayName: Remove all the docker container 
          - bash: docker image rm -f $(docker image ls -q)
            displayName: Remove all the docker image
          - bash: docker container run -d --name nop -P ajaykumarramesh/nopfromazuredevops:$(Build.BuildId)  
            displayName: Run the application      
```

```bash
git add .
git commit -m "added deployment and environment"
git push origin master
```
* after executing above command build will start automatically and execute deployment and with environment of approval process.

* build started sequently 
![PReview](./Images/azdevops127.png)

* look at the below screen shot `deploy the application stage` is waiting for approval. since we have added environment for approval 
![PReview](./Images/azdevops128.png)
* Now just allow permission to execute pending stage
![PReview](./Images/azdevops129.png)
![PReview](./Images/azdevops130.png)
![Preview](./Images/azdevops131.png)
* approval has been done and check passed pending stage is started 
![PReview](./Images/azdevops132.png)
* after approval pending stage ran successfully and got executed 
![Preview](./Images/azdevops133.png)
![PReview](./Images/azdevops134.png)

### Approval Functions:
* In Approval there are many options but we have used only `approval`, others are below mentioned, in case if we want to use these just refer above docs for brief and we can use it.
![Preview](./Images/azdevops135.png)
![Preview](./Images/azdevops136.png)
  * Branch control
  * Business hours
  * Evaluate artifact
  * Exclusive lock
  * Invoke Azure function
  * Invoke REST API
  * Query Azure Monitor Alerts
  * Required template

### Deployment:
* A deployment job is a collection of steps to be run sequentially
* A deployment job can be used to target an entire environment (group of resources)
* we can record deployment history on a specific resource within the environment
*  deployment history view within environments
*  we can list the commits and work items that were deployed to the environment. 

### multiple environments approvals:
![Preview](./Images/azdevops137.png)

#### Steps:
* should create 3 environment as per above image QA,PT and ST and set the approvals for it, we dont have multiple users, so we are setting one single user for multiple testing approvals.
![Preview](./Images/azdevops138.png)

```yaml
---  
trigger:
  - master

parameters:
- name: containerRegistry
  displayName: Service Connection For Docker Image
  default: 'mydockerhub'
- name: vmImage
  displayName: Microsoft Hosted Agent Name
  default: 'ubuntu-22.04' 
  values:
  - windows-2022
  - windows-2019
  - ubuntu-22.04
  - ubuntu-20.04  

variables:
  dockerfilelocation: '**/Dockerfile' 
  
stages:
- stage: buildstage  
  displayName: build application  
  jobs:
  - job: dockerbuild
    displayName: docker image build
    pool:
      name: Azure Pipelines
      vmImage: ${{parameters.vmImage}} 
    steps:
    - task: Docker@2
      inputs:
        containerRegistry: ${{parameters.containerRegistry}}
        command: 'buildAndPush'  
        repository: ajaykumarramesh/nopfromazuredevops 
        Dockerfile: $(dockerfilelocation)  
        tags: $(Build.BuildId)       
- stage: deploystage_QA 
  displayName: QA environment deploy the application
  jobs:  
  - deployment: deploycontainer
    displayName: Run the nop commerce
    pool: default 
    environment: deployment-QA 
    strategy: 
      runOnce:
        deploy:
          steps:
          - bash: docker container rm -f $(docker container ls -a -q)
            displayName: Remove all the docker container 
          - bash: docker image rm -f $(docker image ls -q)
            displayName: Remove all the docker image
          - bash: docker container run -d --name nop -P ajaykumarramesh/nopfromazuredevops:$(Build.BuildId)  
            displayName: Run the application      
- stage: PT_stage
  displayName: running PT 
  jobs:
  - deployment: checkingapplicationperforamnce
    displayName: PT
    pool: default
    environment: deployment-PT
    strategy:
      runOnce:
        deploy:
          steps:
          - script: echo perforamnce test is success and 100%
- stage: ST_stage 
  displayName: running ST
        
  jobs:
  - deployment: checkingapplicationsecurity
    displayName: ST 
    pool: default
    environment: deployment-ST
    strategy:
      runOnce:
        deploy:
          steps:
          - script: echo security test is success and 99.9%          
```

```bash
git add .
git commit -m "added multi stage approval"
git push origin master
```

* after executing above command build will start automatically and deploy the application to QA environment, and check PT and ST. and in each stage it will ask for approvals after gets approvals then check will pass and stage will execute until unless gets approvals stage will not execute.
![PReview](./Images/azdevops139.png)

* check below screen shot QA environment watiting for approval to execute the stage.
![Preview](./Images/azdevops140.png)
* after gives permission or approved stage started running
![Preview](./Images/azdevops141.png)
* after approved check is passed and pending stage build started running, and another two stage is waiting for their turn of approvals since we all know stages or stage will run sequentially not like job parallel. 
![Preview](./Images/azdevops142.png)
* check below screen shot PT stage is waiting for approval
![Preview](./Images/azdevops143.png)
* after approval PT stage is running now
![Preview](./Images/azdevops145.png)
![Preview](./Images/azdevops144.png)
* check below screen shot ST stage is waiting for approval
![Preview](./Images/azdevops146.png)
* after approved ST stage build start running it
![Preview](./Images/azdevops147.png)
![Preview](./Images/azdevops148.png)
* overall all the builds of stage got completed ran successfully 
![Preview](./Images/azdevops149.png)

## Notifications in Azure Devops:
* There are in Built notifications in azure devops:
  * [Refer Here](https://learn.microsoft.com/en-us/azure/devops/organizations/notifications/about-notifications?view=azure-devops) for in built notifications
  * [Refer Here](https://learn.microsoft.com/en-us/azure/devops/service-hooks/overview?view=azure-devops) for Service hooks

* choosing the Notifications in Azure DevOps keep you and your team informed about project activity, including changes to work items, code reviews, pull requests, source control files, and builds.
* Notifications are delivered through email or service hook,based on the delivery properties defined in the subscription.
* We can send an notification for types of events
  * [Refer Here](https://learn.microsoft.com/en-us/azure/devops/organizations/notifications/oob-supported-event-types?view=azure-devops)

#### In Built Notification in Azure Devops:
* all options available in the notification section and also we just needs to configure which notification we required so here azure devops will send an notification to our account mail id.
* for notification configuration process just follow above links of docs 

#### Integrate with service hooks:
* service hooks configure of your azure pipelines status update in the slack/microsoft teams etc: 
* for service hooks configuration refer the above links of docs.

#### Fake smtp server:
* We need to send an azure pipelines status via email or an update in Teams/Slack, we can use below fake smtp server
* this app we can use to send an notification like mail or slack/teams it is a fake smtp server, we will get some default smtp server details with that we can do some RND for our pipelines.
* [Refer Here](https://mailtrap.io/) for mailtrap fake smtp server

#### Custom Notifications from pipeline:
* for this we can use mailtrap fake smtp server configure but not required since azure devops as all the options with in the azure UI as `notifications` and `service hooks` so not required us to go outside.
* really if we want to go outside of microsoft means azure devops then we can choose below called `Azure DevOps MarketPlace`

### Azure DevOps MarketPlace: 
* Azure DevOps Market place gives us external tasks developed by community and use them in your pipelines
* few tasks or few tools are not there in azure devops task reference so in this case we needs to go external task for to use in our pipeline
* for an example:
   * terraform and ansible is not there in azure devops task reference so in this case we can go for external tasks
* [Refer Here](https://marketplace.visualstudio.com/azuredevops/) external marketplace task reference   

![Preview](./Images/azdevops150.png)

* Example steps install terraform extension:
![Preview](./Images/azdevops151.png)
![Preview](./Images/azdevops152.png)
#### The main purpose of azure devops marketplace:
*  is to add the extensions, which is not available in the azure devops, so that we use as external service and connect from azure devops and do some activities.
* what is the activities means:
  * for an example:
    * we can add some template in github and connect github from azure devops and we can call the template through azure-pipelines.yaml 
      * is the one way of example
    * another way examples is jfrog is not there in azure devops so now i want to some artifact to publish or push in the jfrog repository, so by installing jfrog extension through azure devops market place we can connect to jfrog and push the artifact. 
#### Two ways to install azure devops external extensions
* one way is to click above link and install it 
* second way is: 
  * click on bag symbol 
  ![Preview](./Images/azdevops211.png)
  * select which option to choose
  ![Preview](./Images/azdevops212.png)
* even we install or uninstall on the same bag symbol  
---

## Templates:
* templates is reusable, we can keep all the stage,jobs and steps in the template file called `x` and main code in file called `azure-pipelines.yaml` and we can call the `x` template to execute ur steps in the `azure-pipelines.yaml` 
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/templates?view=azure-devops&pivots=templates-includes) for templates docs
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/resources?view=azure-devops&tabs=schema) for resources type
* [Refer Here](https://docs.aws.amazon.com/codebuild/latest/userguide/sample-source-version.html) for source ref

#### lets create a reusable template for java based application:
* we are using very simple reusable template not so useful. 
#### Steps:
* Create a new folder in spring-petclinic repo called as templates with a file name `maven-template.yaml` with following content.

```yaml
pool: default 
trigger: 
  - main 

steps:
- task: Maven@4
  inputs:
    mavenPOMFile: pom.xml
    goals: package
    publishJUnitResults: true
    testResultsFiles: '**/TEST-*.xml'
    javaHomeOption: Path
    jdkVersionOption: '1.17'
    jdkDirectory: '/usr/lib/jvm/java-17-openjdk-amd64'
    mavenVersionOption: Path
    mavenDirectory: '/usr/share/maven'
```
* Now add the following in azure-pipelines.yaml in the spring-petclinic repo 

```yaml
pool: default 
trigger: 
  - main 

steps:
  - template: template/maven-template.yaml 
```

```bash
git add .
git commit -m "added template for pipeline"
git push origin main
```
* after executing above command build will start automatically and `azure-pipeline.yaml` file will call the template that is `maven-template.yaml` file and execute maven commands and builds the project 
![PReview](./Images/azdevops153.png)

* Now lets create real reusable template using parameters variable.
* Lets create template parameters file called `maven-template.yaml`

```yaml
parameters:
- name: mavenPOMFile
  displayName: pom location
  type: string
  default: pom.xml

- name: goals
  displayName: maven goals
  type: string
  default: package
  values:
  - clean
  - validate
  - package
  - test
  - compile
  - install
  - deploy 

- name: publishJUnitResults
  displayName: pjunitresult location
  type: boolean
  default: true

steps:
- task: Maven@4
  inputs:
    mavenPOMFile: ${{parameters.mavenPOMFile}}
    goals: ${{parameters.goals}}
    publishJUnitResults: ${{parameters.publishJUnitResults}}
    testResultsFiles: '**/TEST-*.xml'
    javaHomeOption: Path
    jdkVersionOption: '1.17'
    jdkDirectory: '/usr/lib/jvm/java-17-openjdk-amd64'
    mavenVersionOption: Path
    mavenDirectory: '/usr/share/maven'
```
* in azure-devops pipeline add below yaml code to call template with parameters values

```yaml
pool: default 
trigger: 
  - main 

steps:
  - template: template/maven-template.yaml 
    parameters:
      mavenPomFile: pom.xml
      goals: test # even here we can change default value this is the option 
      publishJUnitResults: false # even here we can change default value this is the option 
```

```bash
git add .
git commit -m "added template with parameters"
git push origin main
```
* after executing above command build will start automatically azure pipeline will call template with parameters and runs the builds
* so here in `azure-pipelines.yaml` we can change the default values which we have defined in the template for parameters.
* When you consume the template in your pipeline, specify values for the template parameters.

* check this below screen shot, i have defined parameters default value in the template `maven-template.yaml` as `package` but i changed in the `azure-pipelines.yaml` `test` so build start with `test` the code not `package` it.
![Preview](./Images/azdevops154.png)

* check this below screen shot, i have defined parameters default value in the template `maven-template.yaml` as `true` but i changed in the 
`azure-pipelines.yaml` as `false` so project builds without `publishJUnitResults`
![Preview](./Images/azdevops155.png)


* Lets create reusable template with parameters for stage:

* add the following yaml code in the folder called template and file `docker-template.yaml`

```yaml
parameters:
- name: containerRegistry
  displayName: Service Connection For Docker Image
  default: 'mydockerhub'
- name: vmImage
  displayName: Microsoft Hosted Agent Name
  default: 'ubuntu-22.04' 
  values:
  - windows-2022
  - windows-2019
  - ubuntu-22.04
  - ubuntu-20.04  


  
stages:
- stage: buildstage  
  displayName: build application  
  jobs:
  - job: dockerbuild
    displayName: docker image build
    pool:
      name: Azure Pipelines
      vmImage: ${{parameters.vmImage}} 
    steps:
    - task: Docker@2
      inputs:
        containerRegistry: ${{parameters.containerRegistry}}
        command: 'buildAndPush'  
        repository: ajaykumarramesh/nopfromazuredevops 
        Dockerfile: '**/Dockerfile'   
        tags: $(Build.BuildId)
           
         
        
- stage: deploystage 
  displayName: deploy the application

  jobs:  
  - deployment: deploycontainer
    displayName: Run the nop commerce
    pool: default 
    environment: deployment-QA 
    strategy: 
      runOnce:
        deploy:
          steps:
          - bash: docker container rm -f $(docker container ls -a -q)
            displayName: Remove all the docker container 
          - bash: docker image rm -f $(docker image ls -q)
            displayName: Remove all the docker image
          - bash: docker container run -d --name nop -P ajaykumarramesh/nopfromazuredevops:$(Build.BuildId)  
            displayName: Run the application     
```

* add the following yaml code in the `azure-pipelines.yaml` and we needs to call template from azure-pipelines.yaml by specify the path of the template and defining parameters values
* When you consume the template in your pipeline, specify values for the template parameters.

```yaml
---  
trigger:
  - master  
stages:
  - template: template/docker-template.yaml
    parameters:
      containerRegistry: 'mydockerhub'
      vmImage: 'ubuntu-22.04'
```

```bash
git add .
git commit -m "added template with parameters"
git push origin master
```
* after executing above command build will start automatically and calls the template from azure-pipelines and runs the builds and execute 

* check this below screen shot stage are executing when we call template from azure-pipelines
![PReview](./Images/azdevops156.png)

* Even can use Variable templates with parameter but i am not doing this example because it same for above yaml code in template file just add variable and call variable and parameters in azure-pipelines.yaml file, thats it..

### Lets create an azure repo with reusable templates
* with name `ADOTemplate`
#### Steps: to create new azure repo
* navigate to => repos 
* click new repository
![Preview](./Images/azdevops157.png)
* click on create after filling details
![Preview](./Images/azdevops158.png)
![PReview](./Images/azdevops159.png)
* click clone and copy git url
* go to local system and clone the repo

```bash
git clone https://ajaybillafz16@dev.azure.com/ajaybillafz16/Learning_AzureDevOps/_git/ADOTemplate
ls
cd ADOTemplate/
code .
```
* after opening ADOTemplate in visual studio code 
just create two folder called 
`maven-template` and file called `maven-template.yaml`
and `docker-template` and file `docker-template.yaml`
* Now we have created Repo called `ADOTemplate` and two reusable template below screen shot
![Preview](./Images/azdevops160.png)

* add the following yaml code into template called `maven-template.yaml`

```yaml
parameters:
- name: mavenPOMFile
  displayName: pom location
  type: string
  default: pom.xml

- name: goals
  displayName: maven goals
  type: string
  default: package
  values:
  - clean
  - validate
  - package
  - test
  - compile
  - install
  - deploy 

- name: publishJUnitResults
  displayName: pjunitresult location
  type: boolean
  default: true

steps:
- task: Maven@4
  inputs:
    mavenPOMFile: ${{parameters.mavenPOMFile}}
    goals: ${{parameters.goals}}
    publishJUnitResults: ${{parameters.publishJUnitResults}}
    testResultsFiles: '**/TEST-*.xml'
    javaHomeOption: Path
    jdkVersionOption: '1.17'
    jdkDirectory: '/usr/lib/jvm/java-17-openjdk-amd64'
    mavenVersionOption: Path
    mavenDirectory: '/usr/share/maven'
```

* add the following yaml code in `azure-pipelines.yaml` and call the template which is present in ADO-Template repos means different repos from azure-pipelines.

```yaml
---

pool: default 
trigger: 
  - main 

resources:
  repositories:
    - repository: templates
      name: ADOTemplate
      type: git
      ref: main

steps:
  - template: maven-template/maven-template.yaml@templates 
    parameters:
      mavenPomFile: pom.xml
      goals: package   
      publishJUnitResults: true
```

```bash
git add .
git commit -m "added templates details in azure pipelines"
git push origin main
```
* after executing above command build will start automatically and calls template from ADOTemplate repo and execute the build.
![Preview](./Images/azdevops161.png)

* Lets create same as above for docker reusable template in azure devops different repo called `ADOTemplate`
* add the following content in the template called `docker-template.yaml`

```yaml
parameters:
- name: containerRegistry
  displayName: Service Connection For Docker Image
  default: 'mydockerhub'
- name: vmImage
  displayName: Microsoft Hosted Agent Name
  default: 'ubuntu-22.04' 
  values:
  - windows-2022
  - windows-2019
  - ubuntu-22.04
  - ubuntu-20.04  


  
stages:
- stage: buildstage  
  displayName: build application  
  jobs:
  - job: dockerbuild
    displayName: docker image build
    pool:
      name: Azure Pipelines
      vmImage: ${{parameters.vmImage}} 
    steps:
    - task: Docker@2
      inputs:
        containerRegistry: ${{parameters.containerRegistry}}
        command: 'buildAndPush'  
        repository: ajaykumarramesh/nopfromazuredevops 
        Dockerfile: '**/Dockerfile'   
        tags: $(Build.BuildId)
           
         
        
- stage: deploystage 
  displayName: deploy the application

  jobs:  
  - deployment: deploycontainer
    displayName: Run the nop commerce
    pool: default 
    environment: deployment-QA 
    strategy: 
      runOnce:
        deploy:
          steps:
          - bash: docker container rm -f $(docker container ls -a -q)
            displayName: Remove all the docker container 
          - bash: docker image rm -f $(docker image ls -q)
            displayName: Remove all the docker image
          - bash: docker container run -d --name nop -P ajaykumarramesh/nopfromazuredevops:$(Build.BuildId)  
            displayName: Run the application  
```
* add the following yaml code in `azure-pipelines.yaml` and call the template which is present in ADO-Template repos means different repos from azure-pipelines.

```yaml
---  
trigger:
  - master


resources:
  repositories:
    - repository: templates
      name: ADOTemplate
      type: git
      ref: main 

stages:
  - template: docker-template/docker-template.yaml@templates 
    parameters:
      containerRegistry: 'mydockerhub'
      vmImage: 'ubuntu-22.04'        
```

```bash
git add .
git commit -m "added docker-template and template details in azure-pipelines"
git push origin master
```
* after executing above command build will start automatically and calls template from ADOTemplate repo and execute the build.
![Preview](./Images/azdevops162.png)

### Lets Use Github Repo For Reusable Template:
* we can keep the reusable template in github repo and call that template in azure-pipelines.yaml

#### Steps:
* create repository in github 
![Preview](./Images/azdevops163.png)
![Preview](./Images/azdevops164.png)
* to go your local terminal 
```bash
git clone git@github.com:codesquareZone/AzureDevops.git
mkdir maven-template
touch maven-template.yaml
code .
```
* add following yaml code in the template called `maven-template.yaml`

```yaml
parameters:
- name: mavenPOMFile
  displayName: pom location
  type: string
  default: pom.xml

- name: goals
  displayName: maven goals
  type: string
  default: package
  values:
  - clean
  - validate
  - package
  - test
  - compile
  - install
  - deploy 

- name: publishJUnitResults
  displayName: pjunitresult location
  type: boolean
  default: true

steps:
- task: Maven@4
  inputs:
    mavenPOMFile: ${{parameters.mavenPOMFile}}
    goals: ${{parameters.goals}}
    publishJUnitResults: ${{parameters.publishJUnitResults}}
    testResultsFiles: '**/TEST-*.xml'
    javaHomeOption: Path
    jdkVersionOption: '1.17'
    jdkDirectory: '/usr/lib/jvm/java-17-openjdk-amd64'
    mavenVersionOption: Path
    mavenDirectory: '/usr/share/maven'
```
* push the above created folder, file and content of yaml file to newly created azure devops repository

```bash
git add .
git commit -m "added maven-template"
git push origin master
```

#### Lets create service connection for github account to connect from azure pipelines:
### Steps:
* navigate to service connection
* Follow all below screen shots for refernce
![Preview](./Images/azdevops165.png)
![PReview](./Images/azdevops166.png)
* select Authentication method
* provide OAuth Configuration
`AzurePipelines`
* click on Authorize
![Preview](./Images/azdevops167.png)
* after we click on Authorize pop box will open so now confirm the `Authorize AzurePipelines`
![Preview](./Images/azdevops168.png)
* After Authorize confirmation check screen shot below service connection name and github is showing by default 
![Preview](./Images/azdevops169.png)
* provide Description, grant access permission click on save
![Preview](./Images/azdevops170.png)
![Preview](./Images/azdevops171.png)

* add following yaml code in the `azure-pipelines.yaml` and will tamplate which is in the github repo

```yaml
---

pool: default 
trigger: 
  - main 

resources:
  repositories:
    - repository: templates
      name: codesquareZone/AzureDevops # github full name + repo name 
      type: github
      endpoint: github.com_codesquareZone
      ref: master

steps:
  - template: maven-template/maven-template.yaml@templates 
    parameters:
      mavenPomFile: pom.xml
      goals: package   
      publishJUnitResults: true
```

```bash
git add .
git commit -m "added template details in azure-pipelines.yaml"
git push origin main
```
* after executing above command the build will start automatically and azure-pipelines will call template from github repo and runs the build execution.
![Preview](./Images/azdevops172.png)

### Spotify Clone Project Exploring:
* exploring nodejs project 

* [Refer Here](https://github.com/John-Weeks-Dev/spotify-clone) for spotify clone project
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/ecosystems/javascript?view=azure-devops&pivots=pipelines-yaml) for publishing nodejs
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/artifacts/npm?view=azure-devops&tabs=yaml) for Publish npm packages to Azure Artifacts feeds
* [Refer Here](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm#using-a-node-version-manager-to-install-nodejs-and-npm) for installing required software
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/artifacts/npm/npmrc?view=azure-devops&tabs=windows%2Cyaml) for Set up your project and connect to Azure Artifacts feed

#### Steps:
* Import spotify clone project in azure repo
![Preview](./Images/azdevops173.png)
![Preview](./Images/azdevops174.png)

* clone the spotify clone project into our local system:

```bash
git clone https://ajaybillafz16@dev.azure.com/ajaybillafz16/Learning_AzureDevOps/_git/spotify-clone.git
cd spotify-clone/
code .
```
* create file called `azure-pipelines.yaml` and add the following content.

```yaml
---

trigger:
  - master

pool:
  name: Azure Pipelines
  vmImage: ubuntu-22.04


steps:
  - task: Npm@1
    displayName: install spotify
    inputs:
      command: 'install'
      
  - task: Npm@1
    displayName: build spotify 
    inputs:
      command: 'custom'
      customCommand: run build
```

```bash
git add .
git commit -m "added azure pipleines"
git push origin master
```
* after executed above command build started automatically and runs the builds 
![Preview](./Images/azdevops175.png)

## Variable Groups in Azure Devops:
* Variable groups store values and secrets that you might want to be passed into a YAML pipeline or make available across multiple pipelines. You can share and use variable groups in multiple pipelines in the same project.
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/variable-groups?view=azure-devops&tabs=yaml)

### To create group variable follow below steps:
#### Steps:
* Naviagate to Library
* Click on variable group
![Preview](./Images/azdevops176.png)
* provide Variable group name
* provide Description
* Add Variables by click `+ symbol ADD`
  * provide username and password 
  * change variable type to secret for password by click on the lock symbol
* all details marked with blue ink observe screen shot below
![Preview](./Images/azdevops177.png)
* check below screen shot after click lock symbol changed variable type to secret
![Preview](./Images/azdevops178.png)
* click on save
![Preview](./Images/azdevops179.png)
![Preview](./Images/azdevops180.png)
* Now we needs to give permission for this variable to which project should use this variable
* click on Pipeline permissions
![Preview](./Images/azdevops181.png)
* click on + symbol select the project to allow permission
![Preview](./Images/azdevops183.png)
* incase if we dint give permission then this project pipeline will not run it will ask for permission while running oberve below screen shot
![Preview](./Images/azdevops184.png)
![Preview](./Images/azdevops185.png)
* Thats it end
* even we can add approval process if in case we needed observe below screen shot:
![Preview](./Images/azdevops186.png)
![Preview](./Images/azdevops187.png)
* Even we can link secret from azure key vault as variable
![Preview](./Images/azdevops189.png)

* How to use above created variable in the pipeline

* add the following yaml code in the `azure-pipelines.yaml`

```yaml

---

trigger:
  - master

pool:
  name: Azure Pipelines
  vmImage: ubuntu-22.04

variables:
  - group: myvariable

steps:
  - task: Npm@1
    displayName: install spotify
    inputs:
      command: 'install'
      
  - task: Npm@1
    displayName: build spotify 
    inputs:
      command: 'custom'
      customCommand: run build
    
  - script: "echo $(username) $(password)" 
```

```bash
git add .
git commit -m "added group variable"
git push origin master
```
* after executing above command build will trigger automatically and calls the group variable which we created under library
![Preview](./Images/azdevops188.png)


### To set variables in the Pipeline/Scripts:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/set-variables-scripts?view=azure-devops&tabs=bash#set-an-output-variable-for-use-in-the-same-job)
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch#understand-variable-syntax) Understand variable syntax

* add the following yaml code in the `azure-pipelines`

```yaml
---

variables:
   - group: myvariable
   - name: one
     value: initialValue 
trigger:
  - master
pool:
  name: Azure Pipelines
  vmImage: ubuntu-22.04
steps:
  - task: Npm@1
    displayName: install spotify
    inputs:
      command: 'install'
      
  - task: Npm@1
    displayName: build spotify 
    inputs:
      command: 'custom'
      customCommand: run build
    
  - script: "echo $(username) $(password)"  

  - script: |
        echo ${{variables.one}} # outputs initialValue
        echo $(one)
    displayName: First variable pass
  - bash: echo "##vso[task.setvariable variable=one]secondValue"
    displayName: Set new variable value
  - script: |
        echo ${{variables.one}} # outputs initialValue
        echo $(one) # outputs secondValue
    displayName: Second variable pass 
```

```bash
git add .
git commit -m "added task.setvariable in pipelines"
git push origin master
```
* after executing above command build will start automatically and calls the variable and set the variable in script and calls it.

* First variable calls in the pipeline
![Preview](./Images/azdevops190.png)
* Sets the new variable value

`- bash: echo "##vso[task.setvariable variable=one]secondValue"`
![Preview](./Images/azdevops191.png)
* Now it will call the new variable which is set in the script/pipelines
![Preview](./Images/azdevops192.png)


           or 
* same exambple as above for set variables in the Pipeline/Scripts, just changed some code.

```yaml
---

variables:
   - group: myvariable 
trigger:
  - master

pool:
  name: Azure Pipelines
  vmImage: ubuntu-22.04

steps:
  - task: Npm@1
    displayName: install spotify
    inputs:
      command: 'install'
      
  - task: Npm@1
    displayName: build spotify 
    inputs:
      command: 'custom'
      customCommand: run build

  - script: "echo $(username) $(password)"  

  - bash: |
       echo "##vso[task.setvariable variable=myVar;]foo"
    displayName: set new variable value   

  - bash: |
       echo  "You can use macro syntax for variables: $(myVar)" 
    displayName: call new variable
```
* observe the below screen shot after builds executed 
![Preview](./Images/azdevops193.png)
![Preview](./Images/azdevops194.png)


### Locking branches:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/repos/git/lock-branches?view=azure-devops) for locking branch

## Azure Devops Artifacts:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/artifacts/feeds/project-scoped-feeds?view=azure-devops) to create azure artifact feed

* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/artifacts/publish-maven-artifacts?view=azure-devops) for Set up your project to publish to azure feed

### maven project pbulish to azure artifact feed steps below:
#### Steps:
* create feed in azure artifact
![Preview](./Images/azdevops195.png)
* click on create
![Preview](./Images/azdevops196.png)
* click on Connect feed 
![Preview](./Images/azdevops197.png)
* select software/build tools which to connect in our case example maven, we need to select based on our build tools for project
![Preview](./Images/azdevops198.png)
* Now do the Project setup:
  * to publish build artifact to azure feed 
* As per screen shot below just follow it
![Preview](./Images/azdevops199.png)
![Preview](./Images/azdevops200.png)
![Preview](./Images/azdevops201.png)
* for this above second screen shot follow the below steps
`Add or edit the settings.xml file in ${user.home}/.m2`
* go to home directory 

```bash
cd ~
cd .m2
vi settings.xml
# copy the content in the second screen shot into settings.xml file and save it
# only replace personal access token as below screen shot in the settings.xml file
```
![Preview](./Images/azdevops202.png)
* For first screen shot changed the content, below is reference screen shot how i changed it, just look it.
![Preview](./Images/azdevops203.png)
![Preview](./Images/azdevops204.png)

* add the following content in the `azure-pipelines.yaml` so that it will build the package and push to azure artifact feed.

```yaml
---

pool: default 
  
trigger: 
  - main 
steps:
  - task: Maven@4
    displayName: build package
    inputs:
      mavenPOMFile: pom.xml
      goals: package
      publishJUnitResults: true
      testResultsFiles: '**/TEST-*.xml'
      javaHomeOption: Path
      jdkVersionOption: '1.17'
      jdkDirectory: '/usr/lib/jvm/java-17-openjdk-amd64'
      mavenVersionOption: Path
      mavenDirectory: '/usr/share/maven'

  - task: Maven@4
    displayName: publish package to azure feed 
    inputs:
      mavenPOMFile: pom.xml
      goals: deploy 
      publishJUnitResults: true
      testResultsFiles: '**/TEST-*.xml'
      javaHomeOption: Path
      jdkVersionOption: '1.17'
      jdkDirectory: '/usr/lib/jvm/java-17-openjdk-amd64'
      mavenVersionOption: Path
      mavenDirectory: '/usr/share/maven'  
```

```bash
git add .
git commit -m "added deploy task to azure-pipelines.yaml"
git push origin main
```
* after executing the above command build start automatically and it build the package and push to azure artifact repository 

* it has build the package
![Preview](./Images/azdevops205.png)
* it has pushed package to azure artifact
![Preview](./Images/azdevops206.png)
![Preview](./Images/azdevops207.png)
![Preview](./Images/azdevops208.png)
![Preview](./Images/azdevops209.png)
![Preview](./Images/azdevops210.png)

### Deployment groups in AzureDevops:
* [Refer Here](https://learn.microsoft.com/en-us/azure/devops/pipelines/release/deployment-groups/?view=azure-devops)


