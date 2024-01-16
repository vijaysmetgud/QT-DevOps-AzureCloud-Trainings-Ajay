# Identity Use Cases of Azure cloud

## Authentication & Authorization:

* **Authentication:**
  
   * is basic identity information to enter into some system/account 
   * Authentication is a where we can access someone resource or service in the system or their account


* **Authorization:**

  * is about the specifics of what is allowed and what is not.
  * after accessing someone's system or account what resource or service we can access is known as Authorization
  
### Azure cloud provides Identity as a service and user categories

* Direct Azure cloud users:
  * Means (Employees) of the company who can login into azure cloud
* B2C Customers (Swiggy users):
  * Means azure cloud maintenance the users of swiggy app who logins into swiggy app for ordering 
* B2B Customer (Access to external account):
  * Means allowing the companies like deloite/kpmg to do some kind of auditing for swiggy applications 

### Azure cloud Users like (Admins/architect/developer) working for organization to use Azure cloud
* Portal Users:
   * Means login into directley azure cloud portal and use it any resources
* CLI/SDK Users:
   * Means we can access/create any resources through commandline 
* Infra Provision:
   * Means we can create any resource or application and deploy and maintain in azure cloud 

### Azure cloud offers RBAC (Role Based Access Control)    
   * to provide granular access over necessary resources and services.

Azure Free Account Opening Link:
---------------------------------
* [Refer Here](https://azure.microsoft.com/en-us/free/)
* how to check which all services free for 12months and which all services are paid, just click above link and view this page below we will come to know.
![Preview](./Images/Azure20.png)


Azure cloud Authentication and Authorization Process
------------------------------------------------------
* When we create azure account, the tenant will create and subscription will create 
* so tenant will contain all the users management 
* subscription will have multiple resources groups 
* one subscription will linked to only one tenant cannot be two subscriptions linked to one tenant
* multiple tenant can have two/multiple different subscriptions 

Tenant:
-------

* when we create account tenant will create and tenant will manage the users device and groups 
* Tenant will have all the user information
* Tenant i.e. Azure Active Directory (AAD) manages users, devices and Groups

* Azure Account will have subscriptions. A subscription will be linked to a tenant during azure account creation
* Since Tenant manages user information, if we need users from different domains/company to be logged into azure cloud, then we will sync/federate Tenant to other identity system means that company active directory. The most popular system for managing users in on-premises is microsoft active directory.
* every tenant has tenant id then only azure will know which tenant will you speak about 
* every tenant id will have primary domain 

* when we create azure account default active directory/tenant will be created
* each tenant will have unique tenant id and primary domain `<name>..onmicrosoft.com`  
* every user created will have one id called `<username>@<primarydomain>` 
  * in my case below:
  ```
  admin@ajaybillafz16gmail.onmicrosoft.com
  ```
* We can map our organization domain name by doing some extra steps (will bw discussed later) like below
```
Change from => admin@ajaybillafz16gmail.onmicrosoft.com
To => admin@force1alliedservices.com
```

Subscriptions:
-------------

* Azure Account will have subscriptions and subscriptions will have resource groups and any resource which we created has to be part of some resource group
* subscriptions will have resource group
* subscriptions will be linked to tenant
* subscriptions will have only one tenant not more then that 
* different subscriptions have same tenant. but same subscriptions will not have more then one tenant it is not valid.
* one azure account can have multiple subscriptions 
* account should be fully operate means person should have tenant as well as subscriptions other unable to see resources or service to work with it or create anything 

Active Directory:
------------------

* microsoft has active directory which stores all the information about users, devices ect:-

* for an examples if i want to give access to infosys 50k employees connection to my azure account then i can have connection between azure active directory i.e(tenant) and infosys active directory so that they can login into my azure account.they can login with their user id and password.it will synchronization/federated.

![Preview](./Images/Azure.png)


Azure AD Use cases:
--------------------

* User, Group management
* Importing users from existing identities
    * Azure AD Sync/Federation
* **Managing RBAC(Roll Back Access Control) means giving what ever access to the particular groups or individual:**
  * Management Group
  * subscription
  * resource group level
  * resource level
* Other
    * pricing models of azure ad

### To check how tenants my account has
* Follow below screen shots
![Preview](./Images/Azure21.png)
![Preview](./Images/Azure22.png)

# Lets Create User in Azure:

* Navigate to azure active directory 
* Lets create user called as `windows`

![Preview](./Images/Azure1.png)

* Select user and click on new user and create user
![Preview](./Images/Azure2.png)

* Fill the details below and click on next:properties
![Preview](./Images/Azure3.png)

* Not required to fill anything since it is just trial in our organization we have to fill all the details
click on next:assignment

![Preview](./Images/Azure4.png)

* Not required to fill click on Review:create
![Preview](./Images/Azure5.png)

* Click on create
![Preview](./Images/Azure6.png)

### After created azure account above screen shots:

* The user principle name is `windows@ajaybillafz16gmail.onmicrosoft.com`
* Now open a different browser of launch inprivate/incognito and navigate to portal.azure.com
* login and check to understand better

![Preview](./Images/Azure7.png)

* user is created and shaded with yellow pen
* now it is authenticate to azure account but not authorization, and there is no subscriptions it is empty
* ![Preview](./Images/Azure8.png)

* IN Azure the permission given at subscription level drills down to all resource groups and resources and the permissions given to the resource group applies to all resources in resource group

* We can apply permission as of now at
  * subscription level
  * resource group level
  * resource level

* Now lets give authorization permission for `windows` user
   * by giving read permissions at subscription level
* Now go back to `root` user means logging into my owner account 
  * By navigating to `subscription` > `Select my Subscription` `> select Access Control` > `Like below screen shot`
  * ![Preview](./Images/Azure9.png) 

* `Add Role Assignments`
![Preview](./Images/Azure10.png)
![Preview](./Images/Azure11.png)
* `Selected members to give access`
![Preview](./Images/Azure12.png)
![Preview](./Images/Azure13.png)
![Preview](./Images/Azure14.png)
![Preview](./Images/Azure15.png)
* Now login as windows user
* windows user has subscriptions with that he has resource group but only has read/view permission but he is unable to delete anything below screen shot proves it. this is known as authorization
![Preview](./Images/Azure16.png)
* As we have experimented this user has only read permissions above screen shot.
* now lets give permission to this `windows`user on resource group level `sample` 
* Login in as owner account
  * Navigate to resource group
  ![Preview](./Images/Azure23.png)
  ![Preview](./Images/Azure24.png)
  ![Preview](./Images/Azure25.png)
  ![Preview](./Images/Azure26.png)
  ![Preview](./Images/Azure27.png)
  ![Preview](./Images/Azure28.png)
  ![Preview](./Images/Azure17.png)
  ![Preview](./Images/Azure29.png)
* Now Login as windows user in private window and lets check access for windows user
![Preview](./Images/Azure18.png)

* now lets give permission to this `windows` user on resource level `vmtesting`
Login in as owner account
  * Navigate to resource group inside resource `vmtesting`
  ![Preview](./Images/Azure30.png)
  ![Preview](./Images/Azure31.png)
  ![Preview](./Images/Azure32.png)
  ![Preview](./Images/Azure33.png)
  ![Preview](./Images/Azure34.png)
  ![Preview](./Images/Azure35.png)
  ![Preview](./Images/Azure36.png)
  ![Preview](./Images/Azure37.png)
* Now Login as windows user in private window and lets check access for windows user
![Preview](./Images/Azure38.png)  






### Subscription giving permission through `Resource Providers` and `Resource Types`
* [Refer Here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-providers-and-types) for Azure resource providers and types

* Authorization in Azure is achieved by Role assignment to user principal
* Exact Permissions at subscription/resource group/resource level is set by Role and Microsoft has many pre-defined roles in azure cloud 
![Preview](./Images/Azure45.png)
![Preview](./Images/Azure46.png)

* **Azure organizes resources in the following way:**
  * Every subscription will have resource providers which provide resource types and actions.
  * **Azure resource providers and resource types to check in portal refer below link:**
       * [Refer Here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-providers-and-types)
* To check existing resource providers
![Preview](./Images/Azure39.png)
![Preview](./Images/Azure40.png)
![Preview](./Images/Azure41.png)
* types of resources we can create for `microsoft.compute` resource providers
![Preview](./Images/Azure42.png)
![Preview](./Images/Azure43.png)
* API Version of resources providers
  * New updates will lead to new API Versions
  * which means for every resources in azure will get new release, which will add more features
![Preview](./Images/Azure44.png)  

* When we want to give permissions we need to know resource type and actions.
* Match Service to resource provider [Refer Here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-services-resource-providers) 
![Preview](./Images/Azure47.png)  
* Figure out operations by resource provider [Refer Here](https://learn.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations)
![Preview](./Images/Azure47.png) 

Find operations to create, view, delete and update virtual networks:
---------------------------------------------------
* Find the `resource providers` and `Azure services` for `Microsoft.Network`
  * [Refer Here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/azure-services-resource-providers) and search for `resource providers` and `Azure services` for `Microsoft.Network`
![Preview](./Images/Azure49.png)  

* Now Find the resource Type in the azure portal for `Microsoft.Network`
  * Navigate to azure subscriptions
  ![Preview](./Images/Azure50.png)
  * click on Resource providers and search for `Microsoft.Network`
  ![Preview](./Images/Azure51.png)
  * click on `Microsoft.Network`  Resource providers and search for Resource types  `VirtualNetworks`
  ![Preview](./Images/Azure52.png)
  * Now my resource provider and resource type is `Microsoft.Network/virtualNetworks`
* This above search for resource provider and resource type we search in two types
  * Either search in azure portal under subscriptions
  * Nor by below azure operations search link, choice is ours

* Now search for Azure resource provider operations in the following page [Refer Here](https://learn.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations)
 * click on `Microsoft.Network`
 ![Preview](./Images/Azure53.png)
 * Then search like below
 ![Preview](./Images/Azure19.png)


