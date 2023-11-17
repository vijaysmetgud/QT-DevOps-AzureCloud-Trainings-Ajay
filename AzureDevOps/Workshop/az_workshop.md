### What types of options we can implement for workshop
#### Infrastructure Wise:
* Static Infrastructure
* Dynamic Infrastructure

#### Technology Wise:
* Virtual Machine
* Cloud Platforms
* Containers
* App/Play Stores => frontend app and push to for customer to download => like swiggy and zomato

### what we are trying to do is Combinations of both:
* Virtual Machine Static Infrastructure
![Preview](./Images/azdevops.png)

* Virtual Machine Dynamic Infrastructure
![Preview](./Images/azdevops1.png)


### Containerized Application Deployment:
* which we will be doing it.
![Preview](./Images/azdevops2.png)

### In Workshop:
* We will be deploying a containerized microservices into k8s cluster
* Options:
  * Kubernetes Cluster
    * AKS
    * EKS

* Container Registry
   * Docker Hub

* Security (ignored)
* unit testing (ignored)

### Setups
* git
* docker

```bash
cd /tmp
curl -fsSL https://get.docker.com -o install-docker.sh
sh install-docker.sh
sudo usermod -aG docker <username>
# exit and relogin
docker info
```

* terraform [Refer Here](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

```bash
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install terraform -y
```

* Ensure you have docker hub account
* Ensure cloud cli is installed
  * Install Azure CLI and configure azure cli [Refer Here](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

  ```bash
  curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
  az login
  ```

* Install AWS CLI and configure [Refer Here](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) 

```bash
sudo apt update && sudo apt install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```
---

### The Pipelines Which will working for Workshop:
![Preview](./Images/azdevops3.png)


### For Repository:
* refer this repository for `k8s yaml`,`docker file`,`terraform code` and `azure-pipelines.yaml`
   * [Refer Here](https://github.com/AjayWorkShop/AzureDevops_workshop_Nov23/tree/dev)

#### Pipelines:
* **Stage:1**
    * Building, Packaging and publishing the docker image
    * Docker container registry: yet to create after seeing the image         
* Structure:
![Preview](./Images/azdevops4.png)
* Commands to build docker image:

```bash
cd src
docker image build -t yet to create .
docker image push yet to create
```
* Note: every build should have a different tag value. we can use Build Id for this

* **Stage:2**
    *  Creating infrastructure using terraform

* ensure in the node kubectl is installed `az aks install-cli` or [Refer Here](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)

#### AWS:
* Ensure AWS CLI is configured
* commands to execute terraform

```bash
terraform init
terraform apply -auto-approve
```

#### Azure
* Ensure Azure CLI is configured
* commands to execute terraform
```bash
cd deploy/tf_azure
terraform init
terraform apply -auto-approve
```

* **Stage:3**
    * Deploy the application into kubernetes cluster

* commands to execute kubernetes

`kubectl apply -f deploy/k8s`

* Note: during manual execution this command will fail

### Hints:
* Ensure your work done in this pipeline is reusable i.e. ideally you should be creating templates for every stage with parameters
---


