Kubernetes Workshop:
--------------------
* Architecture to achieve for Workshop:

![Preview](./Images/k8s1.png)

### Requirements for above architecture workshop:

#### Steps:
* Create organization in your github repository
  * k8sWorkShop
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

### Implementation CI/CD Pipeline:
* This implementation is for above CI/CD Pipeline



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
* SAST scans security test without running the applications or do not reed a running system to perform a scan or in a nonrunning state.
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
---







