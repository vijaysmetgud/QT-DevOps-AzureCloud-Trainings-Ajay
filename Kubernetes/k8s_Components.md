# Components of Kubernetes:

## Control Plane/ Master Node Components Are:

### ApiServer:

* apiserver is responsible for initial talk when we want to do it
* it is responsible for our request
* we will communicate with apiserver through kubectl 
* apiserver will talk to all the components in the master nodes like- scheduler, etcd, controller manager.
* all yaml files will connect to apiserver and apiserver will read all the yaml files and store it in the etcd and tells etcd  to prepare the configuration
* only apiserver will talk to etcd no else components will talk
* also apiserver will validate our request or yaml files which we created 
* in one word if we say the apiserver is a gateway for our starting point of request
* Handles all the communication of k8s cluster
* kube-api server exposes functionality over HTTP(s) protocol and provides REST API



### Scheduler:

* scheduler is responsible for creation pod
* Scheduler is responsible for creating k8s objects and scheduling them on right node
* scheduler see something new in etcd then it is responsibility to do that activity means create new two pods, scheduler will that job 
* scheduler work is to check always with apiserver any pod request we got or any pod i need to schedule it, it will be keep checking it with apiserver
* scheduler will decide based on the configuration which pod should create on which node
* scheduler will checks nodes availability and loads of nodes and then it will decide that how many pods to need create on this so on so nodes and then pass the information to apiserver


### Controller-manager:

* controller is responsible for maintaining  state what we asked for the count like 3 nginx or pod  or killing also
* Controller manager Responsible for noticing and responding when nodes go down
* it will take the responsibility of checking the nodes incase if nodes goes down and if pod dies inside the node then it will inform to apiserver 
* Controller Manger is responsible for maintaining desired state
* This reconciliation loop that checks for desired state and if it mis matches doing the necessary steps is done by controller


### etcd:

* This is memory of k8s cluster
* etcd everything in master it stores it.
* it has all the master configurations information 
* etcd is memory of k8s, if we delete the etcd, then k8s forgets everything
* if we want to take back up of k8s then take etcd
* etcd is not developed by k8s, it is third party tool
* it is a kind of database for all master node components 
* it will store all our yaml files or our commands which we send to master kubernetes


### Cloud Controller Manager:

*  which is well known for cloud concept like `EKS` `AKS` `GKS` so when we want to work with cloud of our k8s cluster then we should know about this component called `cloud controller manager` 
* it has intelligence of cloud 
* it is implemented by microsoft

---

## Worker Node Components are:

### Kubelet:

* kubelet is agent for control plane 
* An agent that runs on each node in the cluster. It makes sure that containers are running in a Pod
* which runs on every nodes, reads the container manifests, and ensures the defined containers are started and running
* when ever scheduler wants something it will speak to kubelet
* if kubelet is down then master will think that node is down
* if control plane want to communicate with nodes means kubelet should be there if not. it is not possible to communicate 
* kubelet will update the master saying the status pods is so on so


### Kube-Proxy:

* kubeproxy all about networks  responsible for networking of pod 
* it is responsibility to speak each other pods inside the container and to access our container inside pod it something called as networking 
* Manages the network and assign the ip address to the pod to communicate each other
* it will forward the requests from service to pods to communicate
* it will take the responsibility of opening the port  between service and containers to talk to our application with users
* This component is responsible for networking for containers on the node



### Container Runtime:

* Docker
* container runtime needs to have or implement CRI to communicate
* Container technology to be used in k8s cluster
* in our case it is docker.


### kubectl:

* is command line tool for kubernetes cluster to communicate with apiserver
* kubectl is a way to communicate with k8s 
* there are two ways to communicate with k8s
     * kubectl communicating with k8s api server best way is yaml 
     * Rest Api , means we create Rest APi through commandline or using python languages or some code 
     * Rest Api communicating best way is json 
* Kubectl has a config file (KUBECONFIG) which contains
   * api-server information
   * keys to communicate with api server     
* Kubectl allows to communication with cluster to create resources
   * imperatively: Type commands
   * declartively: Write manifests (YAML files)

* Reads manifests and connects to api server. Converts the manifest into REST API calls over JSON     