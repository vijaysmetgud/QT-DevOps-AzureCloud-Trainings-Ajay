
Workshop – Project - Assumption
------------------
* Its a predefined, means just an assumption how we are going to do the workshop, just setting up predefined all the steps.

* Project which will be doing in workshop [Refer Here](https://github.com/nopSolutions/nopCommerce)
* We will create a pull request based on workflow
![Preview](./Images/jenkins.png)

#### Two Types of workflow:
* In Release Branch (Night build)
* will be doing two workflow
  * Docker/Container based workflow: 
     * In Terraform we will be doing following workflow is (DevSecOps)
     * here when ever developer pushes the code build the code and package over here is `docker image`
     * we will also discuss about 
        * Security Scans
           * SCA
           * SAST
           * DAST
     * After doing scan we will be using terraform to  create 
        * Kubernetes cluster and Deploy application into it.      
* Another workflow is:
   * VM based Workflow
     * From Terraform we will create below resources may be aws/azure and will be deploying nop commerce application into VM. 
       * VM
       * Database

---

Actual Workshop Steps:
----------------------
* CI/CD Pipeline Based on Jenkins

### Virtual Machine or Cloud Based Deployment
 * We will be building a CI/CD Pipeline of a .net platform based application

### Steps:
   1. Jenkins Master and Node setup with OS Ubuntu
      * Jenkins Master
         * software requirements:
            * openjdk-17
            * jenkins
      * Node:      
         * software requirements:
            * openjdk-17
            * .net 7 sdk
            * git
            * zip 
   2. Build steps: Manual
   ```bash
   git clone https://github.com/dummyreposito/nopCommerceJuly23.git
   dotnet restore src/NopCommerce.sln
   dotnet build -c Release src/NopCommerce.sln
   dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj -o publish
   mkdir publish/bin publish/logs
   zip -r nopCommerce.zip publish
   ```            
### Jenkins file
* To build the NopCommerce and zip the file created jenkinsfile

```Jenkinsfile
pipeline {
   agent any
  
    stages {
        stage('vcs') {
            steps {
                git branch: 'develop', 
                    url: ' https://github.com/dummyreposito/nopCommerceJuly23.git'    
            }
            
        }
        stage('package') {
            steps {
                sh 'dotnet restore src/NopCommerce.sln'
                sh 'dotnet build -c Release src/NopCommerce.sln'
                sh 'dotnet publish -c Release src/Presentation/Nop.Web/Nop.Web.csproj -o publish'
                sh 'mkdir publish/bin publish/logs && zip -r nopCommerce.zip publish'
                archive '**/nopCommerce.zip'
            }
            
        }
    }
}
``` 

```
git add .
git commit -m .
git push origin develop
```
* Lets Build NOPCommerce for above steps:
![Preview](./Images/jenkins1.png)
![Preview](./Images/jenkins2.png)
![Preview](./Images/jenkins3.png)
![Preview](./Images/jenkins4.png)
* Build Result Success
![Preview](./Images/jenkins5.png)
* build is success and created archieve the nopcommerce.zip click to download it.
![Preview](./Images/jenkins6.png)
![Preview](./Images/jenkins7.png) 

### Container Based Deployment:
#### Steps:
   1. Jenkins Master and Node setup with OS Ubuntu
       * Jenkins Master
         * software requirements:
            * openjdk-17
            * jenkins
      * Node:      
         * software requirements:
            * openjdk-17
            * git
            * zip 
            * Docker
            * Terraform
            * azure cli
            * kubectl 
* Needs to authenticate azure-cli with az login and docker with docker login

```
# For Azure
az login
# Docker 
docker login
```

   2. build steps: Manual
   ```
   git clone https://github.com/dummyreposito/nopCommerceJuly23.git
   # create a new branch 
   git checkout -b dev-container
   code .
   # replace latest with Git Commit id or build id
   docker image build -t nopcommerce:latest .
   docker container run -d --name noptest -P nopcommerce:latest
   docker image tag nopcommerce:latest ajaykumarramesh/nopcommerce:latest
   docker image push ajaykumarramesh/nopcommerce:latest
   ```

### Creating kubernetes cluster from terraform:
#### Workflow:   
![Preview](./Images/jenkins8.png)

* Create manually Resources for backend in azure cloud UI.
```
backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "qttfstate"
    container_name       = "tfstates"
    key                  = "nopcommerce.tfstate"
  }
```
* [Refer Here](https://github.com/dummyreposito/nopCommerceJuly23/tree/dev-container/deploy_Infrastructure) for terraform code to create infrastructure

* [Refer Here](https://github.com/dummyreposito/nopCommerceJuly23/tree/dev-container/k8s) for for the k8s manifest

#### Manual deployment steps for terraform and k8s 
```
cd deploy_Infrastructure
terraform init
terraform fmt 
terraform apply -auto-approve
az aks get-credentials --resource-group rg-mutual-hare --name cluster-logical-heron
kubectl get nodes
kubectl apply -f ./k8s/nop-deploy.yaml
```
### Jenkinsfile:
* for above steps
```Jenkinsfile
pipeline {
    agent {label 'Node_Docker'}
    stages {
        stage('vcs') {
            steps {
                git branch: 'dev-container', 
                    url: 'https://github.com/dummyreposito/nopCommerceJuly23.git'    
            }
            
        }
        stage('package') {
            steps {
                sh 'docker image build -t nopcommerce:latest .'
                sh 'docker image tag nopcommerce:latest ajaykumarramesh/nopcommerce:latest'
                sh 'docker image push ajaykumarramesh/nopcommerce:latest'
                
            }            
        }
        stage('terraform') {
            steps {
                sh 'cd deploy_Infrastructure && terraform init && terraform apply -auto-approve' 
                //sh 'echo "$(terraform output kube_config)" > ./azurek8s && export KUBECONFIG=./azurek8s && kubectl apply -f ../k8s/nop-deploy.yaml'
            }
        }
        stage('k8s_deploy'){
            steps{
            sh 'az aks get-credentials --resource-group rg-mutual-sheepdog --name cluster-adjusted-glowworm && kubectl apply -f ./k8s/nop-deploy.yaml' 
            }

        }

    }
}
```
* Lets Build NopCommerce pipeline projects
![Preview](./Images/jenkins9.png)
![Preview](./Images/jenkins10.png)
![Preview](./Images/jenkins11.png)
* Build now
![Preview](./Images/jenkins11.png)
![Preview](./Images/jenkins12.png)
* now acces the application 

`http://20.253.20.251:3000`

`http://external ip:svc-portn-o`

---

Flow of CI/CD Pipeline
------------------------

* Developer completes Code and pushes to git
           or 
   * When ever Developer commits the code to git
      * build the code
      * run unit tests
      * Perform Static Code Analysis 
      * Perform Scans
        * SAST (Static Application Security Test)
           * SonarQube
           * Checkmarx
           * Jfrog
           * Veracode(here we will use)
           * Fortify
        * SCA (Software Composition Analysis) 
           * Black Duck
           * Jfrog
           * checkmarx
           * SonarQube(here we will use)
        * Then push the artifact to 
           * Jfrog
        * Incase container based then
           * docker image push to (jfrog)(ACR)(ECR)
              * scan the image for vulnerability
                * Deploy to k8s cluster
-------------------------------------------------------                    


     
    


