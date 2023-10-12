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
  * [Refer Here](https://github.com/k8sWorkShop/spring-petclinic-/tree/develop/k8s)

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

