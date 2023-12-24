Kubernetes Workshop:
--------------------
* Architecture to achieve for Workshop:

![Preview](./Images/k8s1.png)

### Requirements for above architecture workshop:

#### Steps:
* Create organization in your github repository
  * k8sWorkShop [Refer Here](https://github.com/orgs/k8sWorkShop/repositories) 
  * fork spring-petclinic and nonCommerce into ur organization that is k8sWorkShop

#### Create a Docker image for petclinic
* In this docker image we have two important things:
  * we have used distroless images for java as base image because it is more secure no one can login into our container and also less attack to our applications
  * Another thing is we have used .dockerignore file because unesscessary copying all the files from repo to docker image will be avoided 

```
git clone https://github.com/k8sWorkShop/spring-petclinic-.git
cd spring-petclinic
docker image build -t petclinic:v1.0 .
docker image ls
docker container run -d --name test-petclinic -p 8080:8080 petclinic:v1.0
docker container ls
# Now Access the application
htp://<ip-address:port>
docker tag petclinic:v1.0 ajaykumarramesh/spring-petclinic:v1.0
docker push ajaykumarramesh/spring-petclinic:v1.0
```
#### Write k8s manifests for spring-petclinic

[Refer Here](https://github.com/k8sWorkShop/spring-petclinic-/tree/develop/k8s)

#### Create a Docker image for nopcommerce:

```
git clone https://github.com/k8sWorkShop/nopCommerce.git
cd nopCommerce
docker image build -t nopcommerce:v1.0 .
docker images ls
docker container run -d --name test-nopcommerce -p 80:80 nopcommerce:v1.0
docker container ls
docker tag nopcommerce:v1.0 ajaykumarramesh/nocommerce:v1.0
docker push ajaykumarramesh/nocommerce:v1.0
```
#### Write k8s manifests for nopcommerce
  * [Refer Here](https://github.com/k8sWorkShop/nopCommerce/tree/develop/k8s)



CI/CD Pipeline:
--------------
* Architecture CI/CD Pipeline Work Flow:

![Preview](./Images/k8s2.png)
* We will have 3 different environments
* These 3 environments for us are three namespaces in the same k8s cluster
* this just flow written but not implemented for three environment, just implemented for one environment

### Implementation CI/CD Pipeline:
* This implementation is for above CI/CD Pipeline
  * Tools: used to in this implementation
     * jfrog artifactory:
       * Docker registry: in jrog artifact we will have
       * X-ray: Scanning docker images
     * Jenkins:
       * one master Node
       * one as Node
       * node installation software:
         * docker
         * kubectl
         * terraform
         * aws cli since we are using `EKS`
* Jenkins Implementation Steps:
 * create two ec2 machine
  * name one as master and another as worker node (in my case its ubuntu)
 * Master Node installation:
   * install jenkins
   * install openjdk-17
   * login into jenkins ui with password
   * install suggested plugins
   * create user details
 * Node installation:
   * install openjdk-17
   * install terraform
   * Install docker
   * install kubectl 
   * install aws cli
   * create IAM in aws and configure
   * install eksctl 
   * install k8s cluster using eksctl 
      * aws configure(provide all the details)
 * Now Configure Node in the jenkins master:
  * click manage node => Nodes
  ![PReview](./Images/k8s3.png)
  * click new node
  ![Preview](./Images/k8s4.png)
  * enter node name and create
  ![Preview](./Images/k8s5.png)
  * see the screen shot fill below:
  ![Preview](./Images/k8s6.png)
  ![Preview](./Images/k8s7.png)
  ![Preview](./Images/k8s8.png)
  * Jenkins Credentials Provider: fille seeing screen shots
  ![Preview](./Images/k8s9.png)
  ![PReview](./Images/k8s10.png)
  ![Preview](./Images/k8s11.png)
  ![PReview](./Images/k8s12.png)
  * While providing private key options below:
    * here if we using machine from `aws` means then we needs to give `.pem` file which aws created and stored in our local that is known as private key if `azure` means same as above.
    * for an example if we dint create any .pem file while creating ec2/vm in `aws` or `azure` then needs give in our local terminal private key
  * Now Agent is lunched and Agent successfully connected and online
  ![Preview](./Images/k8s13.png)

### Jfrog Artifact Trial account creation:
* follow docker documents since i have already made the steps there [Refer Here](https://github.com/AjayKumarRamesh/QT-DevOps-AzureCloud-Trainings-Ajay/blob/master/Docker/Docker_Intro.md#jfrog)

* click below url start free trial
  * [Refer Here](https://jfrog.com/start-free/)
* click on continue with google(gmail account)
![Preview](./Images/k8s14.png)
* Fill below details looking at the screen shots
![Preview](./Images/k8s15.png)
![Preview](./Images/k8s16.png)
![PReview](./Images/k8s17.png)
* Account setting is getting ready wait for sometime
![PReview](./Images/k8s18.png)
* Account is ready now login with google(gmail)
![PReview](./Images/k8s19.png)
* Select the account to sign in with google 
![PReview](./Images/k8s20.png)
* Now create project in our case `docker` incase if we required but in my case not required it. 
![Preview](./Images/k8s21.png)
* create repository
  * select prebuilt repository
![Preview](./Images/k8s22.png)
* select docker (in our case) and create repository
![Preview](./Images/k8s23.png)
* now respository is created and click on continue
![Preview](./Images/k8s24.png)
![Preview](./Images/k8s32.png) 
* click on docker client connect 
![PReview](./Images/k8s25.png)
* Set Up Your Docker Client 
  * follow below screen shots methods
  * for password click on identity token then paste in the notepad.  
![PReview](./Images/k8s26.png)
* this above screen shot contain username for jfrog account like below
`docker login -uajay.billafz16@gmail.com practices.jfrog.io`
* after click on identity token password will be copied in notepad like belo
`cmVmdGtuOjAxOjE3Mjg5MTMzMTE6YjcxQ1VnQUZLcDZRc0lKV2VmdHNDd2VSTjNW`
* after followed above screen shot and above login we will get success sign like below
* also we have to do this in the jenkins node server since jenkins node server will communicate with  jfrog and push the docker image into jfrog rite.
```
ubuntu@ip-172-31-22-196:~$ docker login -uajay.billafz16@gmail.com practices.jfrog.io
Password:
WARNING! Your password will be stored unencrypted in /home/ubuntu/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

#### Steps:
* in this below repo we have all the content like and also required packages to build docker image:
  * Dockerfile
  * k8s manifest file
  * jenkinsfile
![PReview](./Images/k8s27.png)  

* to build docker image 
* to deploy k8 resources
* everything should write in jenkinsfile so look at that file for steps

#### should install ingress controller:
* Please Note should install nginx-ingress controller on jenkins node server we have created k8s cluster
```
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
helm upgrade --install ingress-nginx ingress-nginx \
             --repo https://kubernetes.github.io/ingress-nginx \
             --namespace ingress-nginx --create-namespace
```  
* refer below for ingress controller details:
![Preview](./Images/k8s28.png)

* To delete hel items execute below commands

```
kubectl delete namespace ingress-nginx
helm repo list
helm repo remove nginx-stable
```

#### Creating secret 
* we needs to create in jenkins node server or where jenkins is running our builds
* why we are creating this secret is to authenticate jfrog artifact because it is private repository so we needs to authenticate and pull the docker image while deploying the k8s resources.

`kubectl create secret docker-registry regcred --docker-server=practices.jfrog.io --docker-username=ajay.billafz16@gmail.com --docker-password=AKCp8pRQbknisSZ9qkhSb9tLeydwG8vmDiq9SvNsPAYxP6WW4fpFe8jgivRoj8b9E6bjdynMM --docker-email=ajay.billafz16@gmail.com`
* after creating secrets execute below command to check

  `kubectl get secrets`

* To delete secrets execute below command

`kubectl delete secrets regcred`

![Preview](./Images/k8s45.png)


* above secrets abbreviation is:

-docker-server=`jfrog-url`,, -docker-username=`jfrog-username`,,-docker-password=`jfrog-password`,, -docker-email=jfrog-email-id
![Preview](./Images/k8s29.png)

#### Now create pipeline project in jenkins and build the job:

* jenkins pipeline configuration:
* click new item, and enter name of project
![Preview](./Images/k8s30.png)
![Preview](./Images/k8s31.png)
* click on pipeline script select
  * `pipeline script scm`
![Preview](./Images/k8s33.png)
![Preview](./Images/k8s34.png)
![Preview](./Images/k8s35.png)
* click on build now
![Preview](./Images/k8s36.png)
* build job is success
![Preview](./Images/k8s41.png)
![PReview](./Images/k8s42.png)

#### Resources deployed in k8 cluster using jenkins is success
![Preview](./Images/k8s43.png)
* build success in deletion also
![PReview](./Images/k8s44.png)

### Jfrog Image Vulnerability:
* we can observe the docker image vulnerability which we pushed in the jfrog repository 
![Preview](./Images/k8s37.png)
![Preview](./Images/k8s38.png)
![Preview](./Images/k8s39.png)
![Preview](./Images/k8s40.png)


---
### Flow of CI/CD Pipeline:
#### Adding security:
* First thing we will do is:
  * Get the Code + Scan the code for security vulnerabilities (Veracode) or (Black Duck) tools
* Second thing we will do is:
  * Build the docker image + Scan the docker image, tools are (jfrog-XRAY)(ACR)(ECR)(docker registory)
* Third thing we will do is:
  * Executing the Penetration tests
* Fourth thing we will do is:
  * Software composition analysis(SCA) tools are (sonar qube)
    * means scanning our dependencies is known as SCA
    * by the way this is done by our sonar qube
    * Examples we will run docker image, so we will use `From image` rite if that image has any vulnerability then our applications also will get rite, this is known as software composition analysis
    * For SCA refer [Refer Here](https://www.synopsys.com/glossary/what-is-software-composition-analysis.html#:~:text=Definition,source%20license%20limitations%20and%20obligations.) and [Refer Here](https://snyk.io/series/open-source-security/software-composition-analysis-sca/)
      
#### This is not part of CI/CD pipeline, it is out of that: 
* Fifth thing we will do is:
  * scan the kubernetes cluster tools are (kube bench) 
  * So Please Note: kube bench mark will not be doing in the as part of pipeline that should be done out side the pipeline as part of k8s scan.

### Flow of Security or DevSecOps:
#### What is DevSecOps.? or They Do.?
  * DevSecOps teams will scan everything for security issues, that is what DevSecOps team cam into picture
  and also known.

#### SAST:
* SAST is stands for Static application security testing, 
* SAST scans security test without running the applications or do not read a running system to perform a scan or in a nonrunning state.
* That means for an example: 
  * code scans and container scan is known as SAST testing because without running the code we are scanning.
* SAST [Refer Here](https://www.microfocus.com/en-us/what-is/sast)

#### DAST: 
* DAST is stands for Dynamic application security testing
* will perform testing while application is running 
* That means for an example:
  * penetration testing and k8s cluster for vulnerability (kube/kubernetes bench mark) 
* DAST [Refer Here](https://www.microfocus.com/en-us/what-is/dast)


### Penetrate Testing:
* automate the testing is called as penetrate testing
* If security test is automated that is called penetrate testing. 
* our job do penetration testing and share the test result thats it. 
* So what is that test result, it will show some CVE numbers.


### Security Drives two types:
#### Attack Surface:
* Attack Surface means where our system got attack, in my case my system was attack because my application is running in k8s as a root user so that is the attack surface. 

#### Attack Vector:
* Attack Vector means how did they reached there/attack done.? scenario assume that we have created public endpoint in `AKS` `EKS` or `on premises`, then that is not good idea, so attackers will hack our k8s cluster and enter inside. and k8s api server got attack.

### Two types of Security Teams:
* Red security team for attack
* Blue security team for defend

### Vulnerability:
* Vulnerability means there is a chance of your system getting attack due to this vulnerability.
* [Refer Here](https://cve.mitre.org/cve/search_cve_list.html) To check CVE
* `CVE` abbreviation is `Common Vulnerability and Exposure` 

### OWASP:
* OWASP is a community which speaks top 10 risk in applications
* For example in 2023 these are the top risk in applications [Refer Here](https://owasp.org/www-project-api-security/) For OWASP
* So ensure that your applications doesn't have these risks.

### Veracode Scan Procedure:
* [Refer Here](https://kavindra-lunuwilage.medium.com/integrating-veracode-for-static-security-scanning-with-jenkins-e9a2958c9abe) integrate with jenkins pipeline
* [Refer Here](https://docs.veracode.com/r/request_main) official docs
* veracode will scan the code when ever developer writes the code and push to git hub, jenkins trigger will start and work on it. 

### Black Duck scan image and procedure:
* [Refer](https://colab.research.google.com/drive/1ZngGaKRHPD_D6x1NzSxX_E1qgUJzn96N) for scan report images
* black duck will scan the code when ever developer writes the code and push to git hub, jenkins trigger will start and work on it. 


### Kube Bench Scanning k8s cluster:
* This is to scan the k8s cluster, kubeadm,AKS and EKS
* **Please note:** It is impossible to inspect the master nodes of managed clusters, e.g. EKS, and AKS 
because kube bench doesent have access to master node/control plane, but it can still work on worker nodes configurations.
#### we can run kube-bench checks against a cluster in two ways.
  * From the command line using kube-bench CLI:
    * kube-bench cli will not work on EKS and AKS because it will not have access to control plane
  * Run inside a pod:
    * if we are using managed Kubernetes service like AKS and EKS then we can run kube-bench as a pod.
* Refer Below Official docs for installing kube-bench on kubeadm, AKS and EKS
  * [Refer Here](https://github.com/aquasecurity/kube-bench) official docs [Refer Here](https://aquasecurity.github.io/kube-bench/dev/running/)
  * [Refer Here](https://devopscube.com/kube-bench-guide/) third party docs 
* All steps to perform k8 cluster scan is on above link so follow the steps to do the scan the k8s cluster.



### kubesploit another tool scan k8s cluster and docker container:

* [Refer](https://github.com/cyberark/kubesploit) official docs

---

