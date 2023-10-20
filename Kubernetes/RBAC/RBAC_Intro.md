# RBAC In Kubernetes:

### Authorization in K8s:

![Preview](./Images/rbac.png)
* [Refer Here](https://kubernetes.io/docs/reference/access-authn-authz/rbac/)


### Authentication in k8s:

![PReview](./Images/rbac1.png)
* [Refer](https://kubernetes.io/docs/reference/access-authn-authz/authentication/)

* [Refer Here](https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/#normal-user) to create csr,ca.crt 

* Attaching Authorization to identity using Bindings
  * RoleBinding
  * ClusterRoleBinding

### For RBAC we need to understand Role and RoleBindings:
![Preview](./Images/rbac3.png)
* Rules in ClusterRole or Role are inclusive i.e. they support only allow rules(there is are no "deny" rules).
* Role and RoleBindings apply to a particular namespace
* For a cluster wide definition, k8s offers
   * ClusterRole
   * ClusterRoleBinding

### Definitions:

* **Role:**
   * A Role contains rules that represent a set of permissions
   * A Role always sets permissions within a particular namespace
   * a role cannot access resources from other namespaces
   * a role cannot access cluster scoped resources
   * in case if we use role then each and every time in every namespace we needs to create role and bond with rolebinding so alternate to this is `clusterrole`

* **RoleBinding:**
  * A role binding grants the permissions defined in a role to a user or set of users.
  * It holds a list of subjects (users, groups, or service accounts) and a reference to the role being granted. 
  * A RoleBinding grants permissions within a specific namespace
  * A RoleBinding may reference any Role in the same namespace.
  * a RoleBinding can reference a ClusterRole and it can bind that clusterRole to the namespace of the RoleBinding. 
  * A RoleBinding can also reference a ClusterRole to grant the permissions defined in that ClusterRole to resources inside the RoleBinding's namespace.
  *  If you want to bind a ClusterRole to all the namespaces in your cluster, you use a ClusterRoleBinding.

* **ClusterRole:**
   * A ClusterRoles contains rules that represent a set of permissions
   * A ClusterRoles always sets permissions to entire cluster
   * so for above role definition, instead of creating each role for every namespace level every time its not good idea so for that we are or we can use clusterrole at cluster level, only one cluster role we can create with common permissions for all the users and we can bond with rolebinding so that only one cluster role will work for all the namespaces.
   * but since we are bonding with rolebinding so that rolebinding works only at namespace level so we can access rosources form that rolebinding namespaces. not other namespaces. 
   * in case if we want to access other namespaces with one cluster role and also access cluster resources then cluster role needs bond with clusterrolebinding. 
* **ClusterRoles have several use case. You can use a ClusterRole to:**
   * define permissions on namespaced resources and be granted access within individual namespace(s)
   * define permissions on namespaced resources and be granted access across all namespaces
   * define permissions on cluster-scoped resources      
* If you want to define a role within a namespace, use a Role; if you want to define a role cluster-wide, use a ClusterRole.
* A ClusterRole can be used to grant the same permissions as a Role. Because ClusterRoles are cluster-scoped, you can also use them to grant access to:
  * cluster-scoped resources (like nodes)
  * all types of cluster resources like.
  * non-resource endpoints `(like /healthz)`
  * namespaced resources (like Pods), across all namespaces
  * For example: you can use a ClusterRole to allow a particular user to run `kubectl get pods --all-namespaces` but this happens only when we bond with clusterrolebinding, not with rolebinding
  * ClusterRole that can be used to grant read access to secrets in any particular namespace, or across all namespaces
  * these all depending on how it is bound.
  * cluster role if bonds with clusterrolebinding then what ever above said is possible
  * if cluster role is bond with rolebinding then only limited above said is possible, we will see this difference in experiment.

* **ClusterRoleBinding:**
   * ClusterRoleBinding grants that access cluster-wide/entire cluster
   * If you want to bind a ClusterRole to all the namespaces in your cluster, you can use a ClusterRoleBinding.
   * To grant permissions across a whole cluster, including cluster resources also. you can use a ClusterRoleBinding.

## Role Based Access control (RBAC):
* In k8s you need to be authenticated before you are allowed to make a request to an API Resource.
* A cluster administrator has access to all resources and operations and is easiest way to operate with admin account, but sharing it with everyone poses/getting security risk `admin access for everyone`
* RBAC defines policies for users, groups and processes by allowing and disallowing access to manage API resources, like pods,deployment,secrets. etc.
* **RBAC helps in implementing use-cases such as:**
  * Establishing a system for users with different roles to access set of k8s resources/objects
  * Controlling process running in a Pod and Operations they can perform via k8s api
  * Limiting visibility of certain resources in namespaces

### Building Blocks:
* Three building blocks of k8s RBAC:
![Preview](./Images/rbac2.png)

* **Subject:** 
   * The user or process that wants to access a API
* **Resource/Objects:**
   * API Resource/Objects: The k8s API Resource (eg Pod, Deployment, StatefulSet, etc..)
* **Verb/Operation:** 
    * The Operation that can be performed on a resource like eg (get,view,delete and create)

### Please Note: 
* [Refer Here](https://kubernetes.io/docs/reference/access-authn-authz/authorization/) for kubectl auth can -i 
* `kubectl auth can-i` helps in finding whether you have access on resource to perform some operation or not like below eg:-

    `kubectl auth can-i create deployments --namespace dev`

* The output is similar to this:

    `yes`

`kubectl auth can-i create deployments --namespace prod`

* The output is similar to this:

    `no`


### Authentication strategies:
* X.509 client certificate (openssl certificates)
* Basic authentication (username and password)
* Bearer tokens (OpenId)

#### For Activity refer this below link for guide on RBAC:
  * [Refer Here](https://www.adaltas.com/en/2019/08/07/users-rbac-kubernetes/)


## Activity:

* Login into k8s control plane node and create a temporary directory to store keys
```
mkdir cert 
cd cert
```
* Now create a private key for user muthu

`openssl genrsa -out muthu.key 2048`
![Preview](./Images/rbac4.png)

* Create a CSR

`openssl req -new -key muthu.key -out muthu.csr -subj "/CN=muthu/O=learning"`
![Preview](./Images/rbac5.png)

* Sign the CSR with k8s cluster certificate authortity which is usually found in directory /etc/kubernetes/pki and we need two files ca.crt & ca.key

`openssl x509 -req -in muthu.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial -out muthu.crt -days 180`
![Preview](./Images/rbac6.png)

* As a cluster admin, create a user in k8s by setting user entry kubeconfig for muthu and point to the cr and key file.

`kubectl config set-credentials muthu --client-certificate=muthu.crt --client-key=muthu.key`
![Preview](./Images/rbac7.png)

* Create a context for the user

`kubectl config set-context muthu-context --cluster=kubernetes --user=muthu`

![Preview](./Images/rbac8.png)

* to get show the context

`kubectl config get-contexts`
![PReview](./Images/rbac9.png)

* We can switch context

`kubectl config use-context muthu-context`
![Preview](./Images/rbac10.png)

* So here user muthu has given authentication so we can login or switch muthu user but still muthu unable to access any api resource because we have not given still authorization to muthu

#### Lets create two namespace:
 * develop
 * prod
 ```
 # prod
 ---
apiVersion: v1
kind: Namespace
metadata:
  name: prod
# develop
---
apiVersion: v1
kind: Namespace
metadata:
  name: develop  
```
![PReview](./Images/rbac12.png)

### Lets create Role for user muthu

```
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: muthu-role
  labels:
    namespace: develop
rules:
- apiGroups: ["*"]
  resources: ["deployments","service","pods","configmap"]
  verbs: ["get","list","delete","update"]
```
* apply muthu role
```
kubectl apply -f muthu-role.yaml
kubectl get role
kubectl get role.rbac.authorization.k8s.io
```
![Preview](./Images/rbac13.png)

### Lets create RoleBinding for user muthu

```
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: muthu-rolebinding
  labels:
    namespace: develop
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: User
  name: muthu 
  namespace: develop
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: Role  
  name: muthu-role
```
* Apply muthu rolebinding

```
kubectl apply -f muthu-rolebinding.yaml
kubectl get rolebinding
```
![Preview](./Images/rbac14.png)

### Now Lets bond the user muthu role with rolebinding:
### Now Lets do the experiment on above user muthu:
* we have created role and RoleBinding for user muthu
* so from our admin context needs to switch which ever namespace we want to do experiment then should create the role and RoleBinding
* in this experiment i set context as kubernetes-admin@kubernetes to develop namespace then i created role and RoleBinding for muthu
* after creation i have switch context to user muthu and switch to namespace also develop then now ill start my experiment
* observe below screen shots as i describe i can get all resource
![Preview](./Images/rbac15.png)

* user muthu cant get resources from prod namespace observe output because role and RoleBinding is set permission only for particular namespace that is develop
![Preview](./Images/rbac16.png)

* user muthu can delete the resources since got access for deleting to in verb
![Preview](./Images/rbac17.png)
* user muthu can create the resource since have permission in verb to create.

   ` kubectl run nginx --image=nginx`
![Preview](./Images/rbac18.png)
* user muthu cannot get/access cluster resources because user muthu defined only role with rolebinding so that is for only particular namespace for only api resources not cluster resources
![Preview](./Images/rbac19.png)


### Now Lets do the experiment on above user muthu with cluster role and bond with rolebinding:
* we can use clusterrole with rolebinding bond because instead of created reach role for different user, in this experiement we are going to create only one cluster role for two users that is muthu and bala.
* with these two users we adopt the clusterrole bond with rolebinding
* we have created tow users.
  * muthu
  * bala
  * to create users steps are same as shown in the above while creating role with rolebinding.

```
openssl genrsa -out bala.key 2048
openssl req -new -key bala.key -out bala.csr -subj "/CN=bala/O=practice"
sudo openssl x509 -req -in bala.csr -CA /etc/kubernetes/pki/ca.crt -CAkey /etc/kubernetes/pki/ca.key -CAcreateserial
 -out bala.crt -days 180
 kubectl config set-credentials bala --client-certificate=bala.crt --client-key=bala.key
 kubectl config set-context bala-context --cluster=kubernetes --user=bala  
 kubectl config use-context bala-context
```
* Creating two namespaces

```
kubectl create namespace develop
kubectl create namespace prod
kubectl get ns
```
![Preview](./Images/rbac22.png)

* **Lets create a common clusterrole for users muthu:**

```
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: users-namespaces-level
rules:
- apiGroups: ["*"]
  resources: ["deployments","services","pods","configmaps","replicaset"]
  verbs: ["get","list","delete","update","create", "watch"]
```

```
# i am applying all the roles from my admin kubernetes
# while applying clusterrole we can default admin namespace because its cluster scope no issues
vi clusterrole-users.yaml
kubectl apply -f clusterrole-users.yaml
kubectl get clusterrole
```
![Preview](./Images/rbac23.png)
![Preview](./Images/rbac24.png)

* **Lets create rolebinding for user muthu and bond with clusterrole:**

```
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata: 
  name: ClusterRole-rolebinding
  labels:
    namespace: develop
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: User
  name: muthu
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: users-namespaces-level 
```

```
# i am applying all the roles from my admin kubernetes
# while applying the rolebinding needs to apply from admin but needs apply in particular namespace because 
# rolebinding works only on namespaces, if not we unable to access the api resources
vi clusterrole-rolebinding.yaml
kubectl apply -f clusterrole-rolebinding.yaml -n develop
kubectl get rolebinding
```
![Preview](./Images/rbac25.png)

* Resources created in develop namespaces
![Preview](./Images/rbac26.png)
![Preview](./Images/rbac27.png)

* observe below screenshots user muthu can access all the resources in the develop namespace even though we have used clusterrole.
![Preview](./Images/rbac28.png)

* user muthu unable to get resources from other namespaces, why because rolebinding works only with in the rolebinding namespace so. if we want access other namespaces resources then needs to bond clusterrole with clusterrolebinding
![Preview](./Images/rbac29.png)
* user muthu unable to get cluster resources, why because clusterrole bond with rolebinding means rolebinding have limit up to particular namespace only 
if we want access other cluster scope resources then needs to bond clusterrole  with clusterrolebinding
![Preview](./Images/rbac30.png)

* **Lets create rolebinding for user bala and bond with same clusterrole we used for muthu:**

```
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata: 
  name: ClusterRole-rolebinding
  labels:
    namespace: develop
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: bala
  name: muthu
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: users-namespaces-level 
```
```
# i am applying all the roles from my admin kubernetes
# while applying the rolebinding needs to apply from admin but needs apply in particular namespace because 
# rolebinding works only on namespaces, if not we are to access the api resources
vi clusterrole-rolebinding.yaml
kubectl apply -f clusterrole-rolebinding-bala.yaml -n prod
kubectl get rolebinding -n prod
```
* observe here we have used same clusterrole for even bala.
![Preview](./Images/rbac31.png)

* user bala able to access all the api resources in the prod namespace
![PReview](./Images/rbac32.png)
* user bala unable to access api resources from other namespace and also cluster scope resources, why because rolebinding is namespaced level/limit, if we needs to access other namespace resources and cluster scoped resources then bind clusterrole with clusterrolebinding
![Preview](./Images/rbac33.png)

### Now Lets do the experiment on above user muthu and bala with cluster role and bond with clusterrolebinding:

* **Lets create clusterrole both same for user muthu and bala:**

```
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: users-namespaces-level
rules:
- apiGroups: ["*"] 
  resources: ["deployments","services","pods","configmaps","replicationcontrollers","namespaces","nodes","persistentvolumes","storageclasses"]
  verbs: ["get","list","delete","update","create", "watch"]
```

           or 

```
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: users-namespaces-level
rules:
- apiGroups: ["*"]
  resources: ["*"]
  verbs: ["*"]
```
```
# we can apply from admin kubernetes to even default namesapce since clusterrole works on cluster scope 
vi clusterrole-users.yaml
kubectl apply -f clusterrole-users.yaml
kubectl get clusterrole
or
kubectl get clusterrole users-namespaces-level
```
* **Lets create clusterrolebinding for user muthu:**

```
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: muthu-ClusterRoleBinding
subjects:
- apiGroup: rbac.authorization.k8s.io
  kind: User
  name: muthu
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: users-namespaces-level
```
```
# clusterrolebinding can applyng from admin kuberbetes default namespace also because it is cluster scoped
kubectl apply -f clusterrolebinding-muthu.yaml
kubectl get clusterrolebinding
or
kubectl get clusterrolebinding muthu-ClusterRoleBinding
```
![PReview](./Images/rbac34.png)

* check this below screen shots we can able to access resources in all the namespaces and also we can access cluster resources like nodes,namespaces,pv,sc
![Preview](./Images/rbac35.png)
![Preview](./Images/rbac36.png)
![Preview](./Images/rbac37.png)

* **Explaination Even bala user also same as above we seen examples for muthu so i am not doing demonstration for bala user.**

### About permissions symbols:

* **apiGroups:** 
   * [""] => this means indicates the core API group
   * ["*"] => this means indicates all API Group
* **resources:**
   *  ["*"] => indicates all the Api Resources
      or
   *  ['\*'] => represents all resources.   
* **verbs:**
  *  ["*"] => all permissions on API Resources
  * ['\*'] represents all verbs operations


## Service Accounts:
* Service Account is an user account for non human (like AWS roles,kubernetes dashboard and monitoring etc:)
* 






## Aggregating RBAC Rules:



## Experiment:
* create a kubeadm cluster single-master
* create a user muthu with clusterlevel permissions
* create a kubeconfig for this user
* create a new linux machine and install kubectl and use the above generated kubeconfig and check if you can interact with k8s cluster using kubeconfig of muthu

#### This above experiment has been done:
![Preview](./Images/rbac38.png)
* let me explain in short about it.
* i have copied .kube/config file to newly created linux machine and done few changes to .kube/config 
* changes like i have copied ca.crt and ca.key file to new linux machine and point the new location in the .kube/config file this was worked good
* same like above another option is instead of copying ca.crt and ca.key file we can convert that into base64 encode and directly we put encoded base64 details in the .kube/config file this will also work.
---

#### Another experiment:
* Trying from from external network like my laptop:
![Preview](./Images/rbac39.png)

* this also same like above 
* just copy .kube/config file to your laptop and for changes to be done follow above steps.

---






