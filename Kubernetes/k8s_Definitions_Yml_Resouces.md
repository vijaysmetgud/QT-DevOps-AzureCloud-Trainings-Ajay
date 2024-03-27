# Kubernetes Kind/yaml files definitions:


### Pod:

* Pod is ephemeral and light wait or smallest unit of k8s
* Pod is atomic unit of creation in k8s and it contains containers
* Pod is collection of Containers
* Each Pod has unique ip address
* Pod should have one container inside since pod uses ip address to communicate, since it advised to have one container inside the pod, otherwise it will be messed
* Pod means there wont be any replicas or cluster environment, also not required any one to access the pod outside the world or users from internet

![Preview](./Images/k8s6.png)

---

### Replication Controller:
* It maintain a state of number of replicas of pods
* ReplicationController only allows equality based selectors
* RC means instead of creating pod we will use RC so that it will give us extra features called `replicas` like replicas means it will create pods as many as we mention `replicas=3`
* In pod we cannot do any cluster environment so instead of pod we are creating another yaml file called `replication controller` in that we mention  `replicas=3`, `selector label` so it will create 3 pods with mentioned `label` then we can use in cluster environment
* this selector label called equality base only one label not more that that

```
    Example:- 
        Selector :
          labels:
            app: nginx 
```

* `Label:` This is name/value pair used to query resources/object in k8s. used in `services`, `replicasets`, `replicas controller` `stateful set` `daemon set` and `deployments` etc.
* means using this `label` only all other resources mentioned will be identify the pod which is belongs to which group.
![Preview](./Images/k8s7.png)

* **RC-Disadvantages**
   *  we cannot enhance or upgrade the application version and also we can mention only one `label` not more that.
   * that to only equality label means `app=nginx`
---

###  ReplicaSet:

* It maintain a state of number of replicas of pods
* ReplicaSet supports set based selectors and equality based selectors
* Replica set means will have extra features like below, we can have multiple labels for one RS shown below.
* RS has two types of labels 
    * Equality base labels example below
```
  Example:- 
      Selector:
        Matchlables:
          app: jenkins
          release: v1.1
```        
* set base labels example below shown 
   ```
    selector:
    matchExpressions:
    - key: app
      operator: In
      values:
      - jenkins
      - docker 
    - key: release
      operator: Exists
   ```

We can use multiple `app-name means` multiple labels we can use like `app-nginx`, `app-jenkins` so on 

* `MatchLabel:` This is name/value pair used to query resources in k8s. used in `services`, `replicasets`, `replicas controller` and `deployments` etc.
* means using this `Match label` only all other resources mentioned will be identify the pod which is belongs to which group, like above example.
* Even in RS we can use for cluster environment 

*  **RC-Disadvantages**
   *  is that we cannot enhance or upgrade the application version.

![Preview](./Images/k8s39.png)

---

### Service:

* Every Pod when created gives a unique ip address and Name and also when pods are scaled again it will give new unique ip address and name.
* service is responsible to expose our application to outside the world means it will allow our pods to access from internet or out side of our cluster environment.
* service ip address which will never change and also it is stored in etcd, still control plane is up service will not go down
* service is layer 4 load balancer it knows only about ip address or node ports
*  When pod dead and recreated another pod then that ip address will be changed so for that reason we will create one service to use with in the cluster to communicate each other.
* A Service that identifies a set of Pods by using label selectors. 
* to over come Node port and load balancer issue in the service yml file we can use something called ingress without charging for Load balancer or without any issue of ip address and node port

* **endpoints:**

    * endpoints is collection of pods ip address

* **service:**

    * service is collection of endpoints
* when pods get update the endpoints are reflected. Service will forward the requests to endpoints    

#### Types of service in k8s:

* **Cluster IP:** 
  * ClusterIP Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default ServiceType. 
  * This gives an ipaddress or name which can be accessed with in cluster
  * It is very important since if pod want to communicate each other then will use this service cluster ip address it is only for internal communication purpose.
  * cluster ip is accessible only withing in the cluster.

  ![Preview](./Images/k8s76.png)


* **Node Port:**
  * `Node port` => for external communication 
  * `Node port` is to expose our application from  internet, outside communication
  * Here problem is we needs to remember or give our end users `http://<NodeIP>:<NodePort>` which is not good idea or concept.
  * NodePort Exposes the Service on each Node's IP at a static port. 
  * Node Port type of service, to exposes the kubernetes services over Port as shown below:

![Preview](./Images/k8s75.png)

* **Example:**

   ``` 
   So I have mentioned in the service yml file type as node port so when ever I want to access the pod which is running in my worker node or cluster  I need to hit that public ip address with node port number, but this is disadvantage since I cannot issue different public ip address to users to access the pod always since public ip address 
	will be changing it frequently.
   ```

* **LoadBalancer:** 

* LoadBalancer Exposes the Service through external IP using a cloud provider's load balancer. and also its too costly. 
* Here the problem is if we have one service then we can give our load balancer or dns name created with route 53
* but if we 10 service then we needs to create 10 load balancer and 10 route 53 dns and then we needs to give to our end users which is not possible and also it not good idea/concept. 

* any cloud providers internally takes request from cloud controller manager and creates a Load Balancer and all the necessary rules to expose the service on any cloud providers Load Balancer
* after creating service using type as loadbalancer then We get the external ip which represents the ip address of the loadbalancer. 
* Now access by using:


`http://<lb-ip>:<svc-port>`

`http://20.246.194.82:32000` 

* **External Name:** 

* The ExternalName service type is a special kind of service that doesn’t have selectors and doesn’t define any endpoints, and doesn't have ip address Instead, it serves as an alias for an external service. 
* An ExternalName Service in Kubernetes is useful when you have a service that is running outside your Kubernetes cluster, such as a database, and you want to access it from within your cluster.
* Type external name creates a CNAME DNS entry to point to an external DNS service
* A record: means a record will create to connect a external service name to ip addres
* CName record: means it will create alias to connect external service eg:- nginx-example.com  
* when ever we use service type is external name means a cname record will create and that request  will forward to service and if we want such kind of service then needs to add our alias in the dns server. 

* **This serves two purposes:**
  * It creates a single endpoint for all communications to that element/external service.
  * In case that element/external service needs to be replaced, it’s easier to switch by just modifying the ExternalName, in service manifest instead of changing all connections.


* **None/HeadLess Service:** 
* What is service type none, means it is nothing
* Headless service is know as service type none, means in service meanifest file we will mention service type is cluster ip and cluster ip is none that means for this service there is no cluster ip address, this is know as headless service. 
* headless service or service type none is useful in stateful set application to access by its naming.
* * what is headless service.? 
  * headless service means in  k8s service which does not have cluster ip address means none is known as headless service
* what is the advantage of headless service or service type is none.?
  *  using headless service i can access the particular/individual  pods by its naming `<pod_name.<svc_name>`  
---

### Deployment:
* This enables performing zero downtime deployments with features to rollout a new version and undo rollout old version.
* A Deployment provides declarative updates for Pods and ReplicaSets
* It allows users to declare the desired state and the controller will change the desired state to the actual state.
* it gives options to rollout to new version of applications and undo rollout to previous versions of applications with zero downtime
* it gives options to scale up or scale down the replicas of pod
* In deployment default strategy is Rolling Update
* [Refer Here](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) for official documents

#### Overview  
![Preview](./Images/k8s8.png)
![Preview](./Images/k8s97.png)
* Deployment is a workload which creates
  * Replica Sets: These create
     * Pods: Which inturn creates
        * Containers: This is where the application runs
        ![Preview](./Images/k8s98.png)

### Types Of Deployment Strategy:
* **Rolling Update:**
  * rolling deployment means replaces pods running the old version of the application with the new version of the applications one by one without downtime.
  * it will destroy our pods simultaneously one by one 
  * Rolling deployments are the default strategy in K8S
  * there is no down time for our applications

* **Recreate:**
  * Recreate means for an example we have 4 apps running in our environment.it will destroy at a time all 4 apps and it will recreate new apps with new version at a time so here we will have some down time for our application.
  * this strategy is useful when we have business hours like 24/5 so since weekends users doesn't 
use the application and also some applications required to restart while getting update with new version of applications, so in this case this recreate strategy is useful.
  * You have the ability to schedule planned maintenance during off times (for example, during the weekend for an application only accessed during business hours). 
  * A recreate deployment lets you shut down all the pods has  previous version of applications and only then start the new pods with new version of applications.
  * in the recreate strategy we down time for our applications 

* **Blue/Green:**

  * Blue/Green means consider Blue as a old version of an applications and Green is a new version of applications
  * Initially, a service routes all traffic to the ‘Blue’ version of an application
  * Once the ‘Green’ version of an applications is ready and tested, update the service to route traffic to the ‘Green’ version of an application 
  * If any issues arise, while deploying new version of an applications 'green' we can switch/rollback the service back to point to the ‘Blue’ version of an applications.
  * since the old blue version of an applications will be alive until we decommission
  * Then, we can keep the blue deployment for a future rollback or decommission it. 
  * By using labels and selectors in Kubernetes easily we can switch the service traffic between two deployments
  * here we will have some down time for an applications while switching the the service traffic between two deployments

* **Canary Deployment:**
  * Canary Deployment means testing some new features or releasing new version of an applications for the users
  * Two or more services or versions of an application are deployed in parallel
  *  one running an existing version of an applications , and another one with adding new features version of an applications
  * now enabling the new version of an applications for testing with small subset of users, If no errors are reported, then new versions of an applications can be gradually deployed to all users or roll out to the rest of the infrastructure. 
  * here there is no downtime but not sure we have not done it. 

* **These Below not so important:**
    * **A/B Testing/Dark deployments:**  
    * **Shadow Deployment:** 
    * **Ramped slow rollout:**
    * **Best-effort controlled rollout:**
* So i have not done the experiment to it. 
---

### NameSpaces:

* we create namespace in our environment to identify the types of resources is belongs to which environment.
* Namespace in k8s is a logical space or logical cluster in which resources will be created
* once we create our all resources we can catogories or divide into three different `environment` called `dev` `test` and `prod` while fetching/modifying/moving the resources it will be easy to identify with the namespaces like said above.

---

### ConfigMap:

* A ConfigMap is an API object used to store non-confidential or non sensitive data in key-value pairs.
* A ConfigMap stores data in a plain text formate 
* A ConfigMap stores configuration settings for your code. Store connection strings, public credentials, hostnames, and URLs in your ConfigMap.
* Why we are using ConfigMap because while configuration settings may change. but application code doesn't change. This is where ConfigMaps come in.  to keep your application code separate from your configuration for the specific environment.
* ConfigMaps allow you to decouple environment-specific configurations from containers to make applications portable
* ConfigMaps are not encrypted in any way, and all data they contain is visible to anyone who can access the file.
* ConfigMap are not suitable for confidential data storage.

* For Example:
   * we have some java applications so for that we have app.properties file so for this app.properties files we will keep configmaps
so each time we add some new configuration to our java application or for each new build for our java applications , our configuration 
files will have some changes that changes will take place by default through configmaps to our applications

* we can store our applications config files in docker image in the docker file but when we want to change some config files then we have to rebuild the image every time this is not good concept. 

*  we can even store our application config files  in the pod by giving environment variables but when ever we have to change our application configuration files then we need to delete old pod and re-create new pod so this is not possible or good concept

* **Pods can consume ConfigMaps in Four Ways or usage of ConfigMap to configure a container inside a Pod:**
* **EX: 1**
  * Inside a container command and args
  * Environment variables for a container
  * Add a file in read-only volume, for the application to read
  * Write code to run inside the Pod that uses the Kubernetes API to read a ConfigMap

* **Commandline to create ConfigMaps from directories, files, or literal values:**
* **EX: 2**
  * Set the contents of an entire directory with:

   `kubectl create configmap my-config --from-file=./my/dir/path/`

  * Use the contents of a file or specific set of files with:
  
   `kubectl create configmap my-config --from-file=./my/file.txt`

  * Use literal key-value pairs defined on the command line with:

   `kubectl create configmap my-config --from-literal=key1=value1 --from-literal=key2=value2`

 ---

 ### Secrets:

 * Secrets is to store sensitive data like `passwords`, `certificates`, `tokens` `ssh keys` and  `API keys`
* `Opaque` is the default Secret type
* The values for all keys in the data field have to be base64-encoded strings.

* Secrets can specify the data and/or the stringData field. reason is:
   * in the secret `Data` specifying should be encoded before specifying it.
   * in the `stingdData` not required to encode since by default it will encode for us, but problem is we have to specify the data as it is, even all the credentials so if someone looks our yml file they will come to know all credentials.

### External Secrets in Kubernetes:
* Kubernetes External Secrets store information outside the Kubernetes cluster while still allowing Kubernetes resources to use them.
* They are stored in an external service that Kubernetes interacts with to read and write secrets.
* Kubernetes External Secrets allow you to use different storage backends for your secrets.
  * HashiCorp Vault
  * AWS Secrets Manager 
  * Google Secrets Manager 
  * Azure Key Vault 
  * IBM Cloud Secrets Manager 
  * Akeyless
  * CyberArk Conjur and many more etc:

* To use Kubernetes External Secrets, you must configure an external secrets backend and create a Kubernetes Secret object that points to the external backend. Kubernetes will then interact with the secret backend to read and write the secrets.

---

### Kubernetes Volumes:

* **Types of volumes in kubernetes:**
   * **Volumes:**
      * volumes are ephemeral like on-disk files in a container when container crashes data is lost
      * volumes is a lifetime of a pod 
      * this is for temporary purpose only for some time this will create volume  in each pod level and when pod dies we will lose this volume too. 
      * Volumes can be mounted to containers and they have lifetime equivalent to Pods. means when pods dies even volume will also die/loose
      * its like vm machine once machine delete volumes will be deleted
  * **Example:**
    * we create hostpath/nodepath as volume and mount that volume to container so once pod is deleted then again pod will recreate in the different node then hostpath will change and also data will be lost.
    * below is example of manifest/yml file:    
```
apiVersion: v1
kind: Pod
metadata:
  name: test-webserver
spec:
  containers:
  - name: webserver
    image: nginx:latest
    volumeMounts:
    - mountPath: /var/local/data
      name: mydir
  volumes:
  - name: mydir
    hostPath:
      path: /var/data
      type: directory
``` 
* **PersistentVolumes:**
  * very popular in k8s and all cloud environment is providing this option and using it
   * A PersistentVolume (PV) is a piece of storage in the cluster
   *  persistent volumes exist beyond the lifetime of a pod.
   * These volumes will have a lifetime different than Pod i.e. they exist even after pod is dead
   * PersistentVolume It is a resource in the cluster. just like a node is a cluster resource.
   * A PersistentVolumeClaim (PVC) is a request for storage by a user.
   * It is similar to a Pod. 
       * Pods consume node resources like below:
           * Pods can request specific levels of resources (CPU and Memory). and 
       * PVCs consume PV resources like below:
           * Claims can request specific size and access modes (e.g., they can be mounted ReadWriteOnce, ReadOnlyMany or ReadWriteMany)
   * PersistentVolume API object captures the details of the implementation of the storage, can be that NFS, iSCSI, or a cloud-provider-specific storage system.
   * pv is belongs to claim 
* **Kubernetes supports two volumeModes of PersistentVolumes:**
  * `Filesystem` and `Block`.
  * `Filesystem` is the default mode

* **There are Two Types Of PersistentVolumes:**
  * **Static Volumes/Provisioning:**
    * static volumes means we have to create everything like in aws `efs` in azure `azurefile` for storing the data as volume.
    * then we needs to create `PV` with `StorageClass`
    * then we needs to create `PCV` to claim that volume, with `pod spec`
    * so once that claim is done then we cannot create another `pvc` and `pod` to claim again since it is static what ever the volume amount has been used by other pod. or refer below
    * Now if we tried to create another `PVC`, it would fail because we don’t have any more `PVs` left (a PV can be bound to a single PVC) that is where dynamic provisioning would come in handy.

  * **Dynamic Volumes/Provisioning:**   
    * in this example we will create storageclass and pvc and mount the volume for pod can consume it.. 
    * dynamic volumes means we will create only storageclass and pvc and pod can  claim  that storage

* **Storage Classes:**
  * storageclass is to store persistentvolume with capacity amount of gb to use by pod.
  * storageclass is created as external storage like aws-efs, azure-azure-file or azure-disk so that storage of volume will be in common location as external so that any pod can access it and use it data will be safe.
  * storage is not belongs to namespace, its belong to entire cluster    

* **Persistent Volume Claims:**
     * A PersistentVolumeClaim (PVC) is a request for storage by a user.
     * PVC will request to PV with particular storage class for required amount of volume to use by pod mentioning the access mode, readwriteonce, readwritemany, and readonlymany
     * pvc is belongs to namespace

* **The access modes are:**
  * ReadWriteOnce
  * ReadOnlyMany
  * ReadWriteMany 
  * ReadWriteOncePod
    * Only a single pod can gain access to the volume  
  * [Refer Here](https://kubernetes.io/docs/concepts/storage/persistent-volumes/#access-modes) for official docs        


* **All three items simple explaination like below:**
  * persistent volume means the disk or filesystem given to us 
  * storageclass is how to create storage and assign the name of that storage 
  * PVC means the sending a request to PV on particular storageclass for resource to use by pod

* **CSI Drivers:**
     * this is for extra set of features for an example to take snapshot or etc:
     * CSI is the second version storage of k8s 
     * CSI is an advanced implementation of storage 

---

### Daemonset:
* Daemonset is used to run same copy/kind of pod on every node 
* Daemonset ensures that copy of a specific pod runs on each or selected nodes with in cluster

#### Uses of a DaemonSet are:
* logs collectors:
  * run the daemon on every node to collect the logs
* monitoring:   
  * run the daemon on every node to monitor the nodes status.
* Deploying agents:  
  * run the daemon on every node to deploy agents 
* etc:
---

### Stateful Set:
* Stateful Set is designed for stateful applications
* When we create replicas in Stateful Set we get predictable/particular names for pods
* We can access individual pod, by creating headless service and by using `<pod_name.<svc_name>` if we namespaces then  `<pod_name.<svc_name><namespaces_name.svc.cluster.local>`
* in stateful set each pods will get its own persistent volume(pv)
* The stateful set is designed to manage deployment and scaling of stateful applications such as databases,
* Unlike deployment which is designed for stateless applications,
* To work with stateful set application we need headless service, means service type is none.
* Stateful set is useful for database where we are running one or more database, if we have only one database is running then we dont need this kind of circus to do it. 
* we will use volumeClaimTemplates in stateful set not for pod level, it is for statful set level so that each and every pods will have its own volume(pv)
* When we create replicas in Stateful Set we get predictable names

#### Example Scenario why we need Stateful set:
* To run database we will use stateful set, why,
* Why because assume that we have two database pods like database-0  another pod is database-1, so we have two application is running one like app-1, another is app-2, so now app-1 should read a database-0 and another app-2 should write the database-1 so now in this case how we will redirect our service request to a particular database like database-0 or database-1.? 
* Here is the solution:
  * in this case/scenario we will create service called headless service means service type none, through which we can  our database-0 or database-1 pods with our app-1 or app-2 pods like `<pod_name.<svc_name>`, means we can access by individual pod name
* Same scenario we cannot do with deployment with service, even if we give service type is none or creating headless service, why because deployments will create random name for pods like strange name not in order like stateful set, and also we access the service then it will forward the request to our pods with randomly not to particular pods.
* can we do this things in deployment.? means accessing with particular podname.? 
  * yes we can do it in deployment. But in deployment we will not get predictable/particular name for pods. we will get random name for pods so it is difficult to identify or to access the pod. 
  so in stateful set we will get predictable/particular name for pods so it is easy to access the pods.

#### Deployment VS Stateful Set:
* **Deployment:**
   * deployment means all pods will combine one state
   * in deployment if we create volumeClaimTemplates we will get only one common pv for all the pods to share
   * where as in deployment not possible, if we scale replicas only pods will increase not the pv 
* **Stateful Set:**
   * stateful set means each and every pods will have one state
   * where as in stateful set if we create volumeClaimTemplates we will get every pods with own pv.
   * in stateful set if one database pod is full with load of volumes then we scale the replicas then new database pod with pv will be creating it

#### Stateful Set has following features:
* Stable Network Identity
   * [Refer Here](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#stable-network-id)
* Ordered Deployment and Scaling
   * [Refer Here](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#deployment-and-scaling-guarantees)
* Persistent Storage
   * each pod will create its own pv/volume
   * [REfer Here](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#stable-storage)
* Ordered, automated rolling updates.
   * [Refer Here](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#rolling-updates)
---
   
### Ingress:
* ingress is layer 7 (applications) load-balancer so that we can write rules on ingress resource
* We use ingress to overcome service to expose our pods to outside the cluster, like service type `loadbalancer` or `node-port`
* Ingress exposes `HTTP` and `HTTPS` routes from outside the cluster to services within the cluster. Traffic routing is controlled by rules defined on the Ingress resource.
* An ingresss is an API object that manages external access to the services in a cluster, typically `HTTP/HTTPS`.
* If no host is specified in the ingress rule, so the rule applies to all inbound HTTP traffic through the IP address specified.
* If a host is provided (for example, foo.bar.com), the rules apply to that host
* An Ingress with no rules/service defined sends all traffic to a single default backend
* If none of the hosts or paths match the HTTP request in the Ingress objects, the traffic is routed to your default backend


#### Ingress controller:
* An Ingress controller fulfills the rules set in the Ingress.
* In order for the Ingress resource to work, the cluster must have an ingress controller running.
* we must have an Ingress controller to satisfy an Ingress. Only creating an Ingress resource has no effect.
* we will need to make sure your Ingress targets exactly one Ingress controller by specifying the ingress.class annotation,and that you have an ingress controller running in your cluster.
* K8s does not have ingress controller for ingress. is designed, So This is where we can use external ingress controller implementations.
* Examples:
   * nginx
   * haproxy
   * traefik
      * these above three works anywhere external loadbalancer
      * For these external loadbalancer means there will be some re-write will happen and also k8s resource created like service,pods and deployments running 
   * azure application gateway(works only in aks soft loadbalancer)
     * internally what happens is, there will be k8s resource created like service,pods and deployments running as actual loadbalancer, if it soft 
   * elastic application load balancer(works only in eks soft loadbalancer)
       * internally what happens is, there will be k8s resource created like service,pods and deployments running as actual loadbalancer, if it soft
* The above examples of ingress controller mentioned is few there is lot more, to know that refer below official docs for ingress controller  


#### Request Flow Of Ingress:
```
users or clients hit DNS/(Route 53) it will direct to load balancer/ingress controller 
then here Ingress Controller will handle request and route to Ingress.
and here ingress will act like load balancer all the request will route to service and traffic is controlled by mentioning the rules in the ingress file then from service request will forward to particular pod to access our applications by using certain urls or path  
```
![Preview](./Images/k8s210.png)
---




