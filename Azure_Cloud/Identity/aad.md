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


Azure custom roles(RBAC) using the Azure portal
-------------------------------------------------

### Scenario:
* I have to create 3 types of users
   * Developers
   * QA
   * admin 
* The permission is scoped at subscription level for these above users
* **Developers:** 
    * should be able to create, modify but not delete of below resources
      * network
      * storage
      * virtual machines
* **QA:** 
   * should be able to view all, but not update of below resources
      * network
      * storage
      * virtual machine
* **Admin:** 
    * should be able to do any thing, means all the permissions 

### Solution:
* Lets Create 3 groups
   * Developer
   * Admin
   * QA    
* Steps:
![Preview](./Images/Azure54.png)
![Preview](./Images/Azure55.png)
![Preview](./Images/Azure56.png)
![Preview](./Images/Azure57.png)

* Lets Create a user called `test` to check the access for Developer
![Preview](./Images/Azure58.png)

* **Lets create a custom RBAC (Role Based Access Control) from azure portal:**
* There are three ways that you can start to create a custom role (RBAC) from azure portal
  * clone an existing role
  * start from scratch
  * start with a JSON file
* [Refer Here](https://learn.microsoft.com/en-us/azure/role-based-access-control/custom-roles#custom-role-example) for Azure custom roles Examples
* [Refer Here](https://learn.microsoft.com/en-us/azure/role-based-access-control/built-in-roles?source=recommendations) for Azure built-in roles
* [Refer Here](https://learn.microsoft.com/en-us/azure/role-based-access-control/custom-roles-portal?source=recommendations) for Create or update Azure custom roles using the Azure portal
### Steps: `start from scratch` Way/Option: 
* to create custom role for  `developer` and to access `test` user for testing the access
![Preview](./Images/Azure59.png)
![Preview](./Images/Azure60.png)
![Preview](./Images/Azure61.png)
![Preview](./Images/Azure62.png)
* Now add permission to `virtual machines`
![Preview](./Images/Azure63.png)
![Preview](./Images/Azure64.png)
* Now exclude permission to `virtual machines`
![Preview](./Images/Azure65.png)
* Now add permission is known as `Action` and exclude permission is known as `NotAction` both looks like this below screen shot
![Preview](./Images/Azure66.png)
* Now adding permission and exclude permission done via portal selected option `start from scratch`,,,, `Json file looks like this` below screen shot.
![Preview](./Images/Azure67.png)
* by adding permission and excluding permission choosing the `start from scratch` way/option is little bit painful because we needs to add/exlcude via azure portal.
* So ill be using another way/option called `start with Json file` which is little easy method.

### Steps: `start with a JSON file` Way/Option: 
* add permission and exclude permission on 
   * virtual machine
   * network
   * resource group
   * storage
* How it looks Json file with permissions
![Preview](./Images/Azure68.png)
![Preview](./Images/Azure69.png)
* How it looks permissions on azure portal UI
![Preview](./Images/Azure70.png)
* Now review and Create a custom role
![Preview](./Images/Azure71.png)
![Preview](./Images/Azure72.png)
![Preview](./Images/Azure73.png)
* Now search custom role which is created
![Preview](./Images/Azure74.png)
![Preview](./Images/Azure75.png)
![Preview](./Images/Azure76.png)
* Now add custom role `dev` to user `test`
![Preview](./Images/Azure77.png)
![Preview](./Images/Azure78.png)
![Preview](./Images/Azure79.png)
![Preview](./Images/Azure80.png)
![Preview](./Images/Azure81.png)
* Now check the access for user `test` and group `Developer`
  * Open new private windows and login with `test` user credentials
  ![Preview](./Images/Azure82.png)
  * Now check resources access for user test
    * Storage
    * Virtual machine
    * Network
  ![Preview](./Images/Azure83.png)  
  ![Preview](./Images/Azure84.png) 
  ![Preview](./Images/Azure85.png)
  * So Now we have given user `test` all the access except deletion permission, now we will try to delete and check 
  ![Preview](./Images/Azure87.png)
  * it unable to delete the resources so as we expect custom role is working 

### Lets create custom role(RBAC) for admin group
* Admin can do anything, means create, view, update and delete
* so `NotAction` should not write anything.
* user is already there `test` user so for this same user we will add the role assignments of admin and will check the access for `test` user for `admin` role.  
#### Steps:
* clone an existing role from azure portal way/option
* we will use clone an existing role because, role for admin is same as developer which we wrote above, only thing needs to remove `NotAction` from the Json file, since admin can do anything. 
* Lets create the custom role for admin with option of clone an existing role of `dev`
![Preview](./Images/Azure88.png)
![Preview](./Images/Azure89.png)
* Should remove `NotAction`
![Preview](./Images/Azure90.png)
![Preview](./Images/Azure91.png)
* After remove the `NotActions` that becomes admin role and looks like this below
![Preview](./Images/Azure92.png)
![Preview](./Images/Azure93.png)
* Now review and create custom role for admin
![Preview](./Images/Azure94.png)
* Remove the role assignments for user `test` with `developer`
![Preview](./Images/Azure95.png)
![Preview](./Images/Azure96.png)
* Now Add role assignments for user `test` with `admin`
![Preview](./Images/Azure97.png)
![Preview](./Images/Azure98.png)
![Preview](./Images/Azure99.png)
![Preview](./Images/Azure100.png)
* Open new private windows and login with `test` user credentials
* check the access for user `test` and group `admin` role
* now user `test` able to delete the resource so as we expected `admin` role is working
![Preview](./Images/Azure101.png)

### Lets create custom role(RBAC) for QA group
* QA should have only read permission 
* user is already there `test` user so for this same user we will add the role assignments of QA and will check the access for `test` user for `QA` role.
#### Steps:
* clone an existing role from azure portal way/option
* we will use clone an existing role because, role for admin is little bit same as QA and also we will modify once clone is done
* Lets create the custom role for QA with option of clone an existing role of `admin`
* here i am not providing any screen shots becuase already i have given screen shots for dev and admin so only ill add the steps what should be done
* clone the admin role in azure portal
* modify the QA role which is cloned from admin role as per QA permissions
![Preview](./Images/Azure102.png)
![Preview](./Images/Azure103.png)
![Preview](./Images/Azure104.png)
* Now remove the role assignments for test user with admin
* Now add the role assignments for test user with QA
![Preview](./Images/Azure105.png)
* Open new private windows and login with `test` user credentials
* check the access for user `test` and group `QA` role
* now user `test` is unable to delete the any  resource because has only read permission so as we expected `QA` role is working
![Preview](./Images/Azure106.png)

### Activity:1
* Create a custom role called as `storageadmin` who can
  * read anything (compute, network and storage)
  * on storage write,update,delete permissions

**Steps:**
* Lets create custom role called  `storageadmin` with start with Json file way/option
![Preview](./Images/Azure107.png)
![Preview](./Images/Azure108.png)   
![Preview](./Images/Azure109.png)
* Now add role assignments for user `test` with `storageadmin` role
![Preview](./Images/Azure110.png)
![Preview](./Images/Azure111.png)
* Login in private window for user `test` crendentials and check the access
* user `test` able to view or read on `compute` and `network` but not delete
![Preview](./Images/Azure112.png)
![Preview](./Images/Azure113.png)
* user `test` able create and read on `storage`
![Preview](./Images/Azure114.png)
![Preview](./Images/Azure115.png)
* user `test` able delete the  `storage`
![Preview](./Images/Azure116.png)

### Activity:2
* Lets create custom role for kubernetes cluster
* terms and conditions on custom role for azure kubernetes cluster
  * user can do anything on Azure Kubernetes Service but not delete cluster 
  * user can have read permission of everything else, means on all other services in azure user can have read permissions.
* **Steps:**
![Preview](./Images/Azure117.png)
![Preview](./Images/Azure118.png)
![Preview](./Images/Azure119.png)
```Json
{
    "properties": {
        "roleName": "experiment on k8s",
        "description": "this role is for experimenting on kubernetes services",
        "assignableScopes": [
            "/subscriptions/5e29be3b-772d-4a03-9b7a-9990573f645e"
        ],
        "permissions": [
            {
                "actions": [
                    "Microsoft.ContainerService/*",
                    "*/read",
                    "Microsoft.Resources/*"
                ],
                "notActions": [
                    "Microsoft.ContainerService/managedClusters/delete"
                ],
                "dataActions": [],
                "notDataActions": []
            }
        ]
    }
}
```

Azure Management Groups/Azure Policy
------------------------------------
![Preview](./Images/Azure120.png)
* This helps in setting organizational standards and to access compliance at scale/resources
* It is largely used for resource consistency
* Azure policy is something which apply on all resources to maintain the azure policy compliance to all the resources
* Azure policy means to ensure all resources meet as per azure policy compliance
* [Refer Here](https://learn.microsoft.com/en-us/azure/governance/policy/overview) for official docs on Azure Policy
* Lets Create a Azure policy
![Preview](./Images/Azure121.png)
![Preview](./Images/Azure123.png)
![Preview](./Images/Azure122.png)
![Preview](./Images/Azure124.png)
![Preview](./Images/Azure125.png)
![Preview](./Images/Azure126.png)
![Preview](./Images/Azure127.png)
![Preview](./Images/Azure128.png)
![Preview](./Images/Azure129.png)
![Preview](./Images/Azure130.png)
![Preview](./Images/Azure131.png)
* After Creating the policy we can view the what policy we have assigned
![Preview](./Images/Azure132.png)
* Now if i want to create any resources, as per policy assigned is `Require a tag and its value on resources` i should give tags value/details if not i cannot create any resource.
* Example below screen shot, i am trying to create storage account with out giving tag details so it is not allowing me to create, observe below screenshot for error.
![Preview](./Images/Azure133.png)
* So basically azure policy means what ever the terms/conditions apply on in built azure policy we have to meet that policy condition, then only we can create any resources or activities if not not allowed. 
* incase we dont want to restrict means we delete the assignment policy then we can create any resources without any condition or restrict 
* To remove the assigned policy
  * Navigate to Policy => Assignments
  * Select the policy
  ![Preview](./Images/Azure134.png)
  * click on Delete Assignment
  ![Preview](./Images/Azure135.png)
  ![Preview](./Images/Azure136.png)
* Even we can create our own custom policy also but generally it is not required since azure as lots of builtin policy which we can utilize it.

####  Apply policy of the initiative of Microsoft Cloud Security Benchmark
![Preview](./Images/Azure136.png)
* There are lots of policy under `Microsoft Cloud Security Benchmark`
![Preview](./Images/Azure137.png)
![Preview](./Images/Azure138.png)
![Preview](./Images/Azure139.png)
![Preview](./Images/Azure140.png)
![Preview](./Images/Azure141.png)
* To remove the policy 
![Preview](./Images/Azure142.png)

Azure Active Directory -  B2B (Business to Business)
-----------------------------------------------------
* Azure AD B2B (Business to Business)[Refer Here](https://learn.microsoft.com/en-us/entra/external-id/what-is-b2b) 
* B2B collaboration represents providing access to external identity user for using your subscription/management group, or your company's applications and services and resources of azure cloud 
* A simple invitation and redemption process lets partners use their own credentials to access your company's resources.
* This is used for consulting and auditing scenarios most of the time
* **Invite External User to Access Your companies resources:**
* **Steps:**
![Preview](./Images/Azure143.png)
![Preview](./Images/Azure144.png)
![Preview](./Images/Azure145.png)
![Preview](./Images/Azure146.png)
* After creating external user invite will send to his/her mail id 
![Preview](./Images/Azure147.png)
* Add the role assignements for external user to access the resources of your company's 
![Preview](./Images/Azure148.png)
* Now External user can login with their crendentails and access the resources for audit purpose 
![Preview](./Images/Azure149.png)
* External user successfully able to access resources our companies 
![Preview](./Images/Azure150.png)

Azure AD B2C (Business to customer)
------------------------------------

* Azure Active Directory B2C provides business-to-customer identity as a service. 
* Azure Active Directory B2C means in simple word we can say any customer can login into our apps or API resources with their authentication method and it is authorization process for our customer to use our apps which is running in the azure cloud 
* [Refer Here](https://learn.microsoft.com/en-us/azure/active-directory-b2c/overview) for Azure Active Directory B2C?
* [Refer Here](https://learn.microsoft.com/en-us/azure/active-directory-b2c/quickstart-web-app-dotnet) for the Azure ad B2c implementation in asp.net


Azure Active Directory and Microsoft Active Directory Sync/Federation
---------------------------------------------------------------------
* Azure AD uses following authentications
  * **Cloud Authentication:** Azure AD handles the authentication process for user signin. We have two options
     * **Password Hash syncronization:**
       * means our on premise AD will be synchronized with Azure AD through user and password hashes sync
       * when ever users login to azure AD in any way it will authenticate with user password hashes sync by installation Azure AD Connect 
       ![Preview](./Images/Azure151.png)
    * **Pass through authentication:**
       * means our on premise AD will be synchronized with Azure AD, so when users login to azure AD in any way, then our on premise AD will authenticate the users
       ![Preview](./Images/Azure152.png)
    * **Federated Authentication:**
       * means there will windows AD which will act as azure AD federations means by using web application proxy through windows AD, when ever users login into azure AD it will connect to windows AD and authenticate to our on premise AD for users. 
       ![Preview](./Images/Azure153)
* **Lab Setup:** 
   * I will be creating Active directory domain controller: means it will store all user information like user name and password hashes
     * A Windows Server with AD Domain Services enabled
     * Install Azure AD Connect to sync users with Azure AD
     * Login Windows Server user into Azure Portal
* This experiment for **Password Hash synchronization**     
* **Steps:**
  * create windows server 2019
  * Login into windows server
  * by default server manager will launch
  * Navigate to local server and turn off IE enhanced security configuration
  ![Preview](./Images/Azure153.png)
  * Go to => Dashboard => click on Add roles and features
  ![Preview](./Images/Azure154.png)     
  * Go to server roles => click on Active directory domain services
  ![Preview](./Images/Azure155.png)
  ![Preview](./Images/Azure156.png)
  * Click on next until you see install button
  ![Preview](./Images/Azure157.png)
  * Click on promote this server to a domain controller
  ![Preview](./Images/Azure158.png)
  * Click on add a new forest => specify root domain name, in my case `qtlt.com`
  ![Preview](./Images/Azure159.png)
  * Enter recovery password
  ![Preview](./Images/Azure160.png)
  * click next
  * under additional options enter the NetBIOS domain name `QTLT`
  ![Preview](./Images/Azure161.png)
  * Click next until you reaches to install button
  * Click on install
  ![Preview](./Images/Azure162.png)
  * after installation is completed it will retart by default the login again
  * Now workgroup or domain is created
  ![Preview](./Images/Azure163.png)
  * Navigate tools=> active directory users and computers
  ![Preview](./Images/Azure164.png)
  ![Preview](./Images/Azure165.png)
  ![Preview](./Images/Azure166.png)
  ![Preview](./Images/Azure167.png)
* Lets create two groups
  * Go to tools click ad users and computers
  ![Preview](./Images/Azure168.png)
  * create group Avengers
  ![Preview](./Images/Azure169.png)
    * create user called ironman and thor 
    ![Preview](./Images/Azure170.png)
    ![Preview](./Images/Azure171.png)
    ![Preview](./Images/Azure172.png)
    ![Preview](./Images/Azure173.png)
    ![Preview](./Images/Azure174.png)
    ![Preview](./Images/Azure175.png)
  * add the following users ironman and thor to group Avengers and give some permission as per screen shot
    * ironman:
      * we created domain name
         * AD: ironman@qtlt.com
      * azure active directory will get   
         * AAD: ironman@<primarydomainname>

    * thor
      * we created domain name
         * AD: thor@qtlt.com
      * azure active directory will get    
         * AAD: thor@<primarydomainname>
    * click on group
    ![Preview](./Images/Azure176.png)
    ![Preview](./Images/Azure177.png)
    ![Preview](./Images/Azure178.png)
    ![Preview](./Images/Azure179.png)
    ![Preview](./Images/Azure180.png)
    ![Preview](./Images/Azure181.png)
    ![Preview](./Images/Azure182.png)
  
  * create group JusticeLeague
  ![Preview](./Images/Azure182.png) 
    * create user called batman and wonderwomen
    ![Preview](./Images/Azure182.png)
    ![Preview](./Images/Azure183.png)
    ![Preview](./Images/Azure184.png)
    ![Preview](./Images/Azure185.png) 
    ![Preview](./Images/Azure186.png)
    ![Preview](./Images/Azure187.png)
    ![Preview](./Images/Azure188.png)
  * add the following users batman and wonderwomen to group Avengers and give some permission as per screen shot
    * batman
      * we created domain name
         * AD: batman@qtlt.com
      * azure active directory will get    
         * AAD: batman@<primarydomainname>
    * wonderwomen
      * we created domain name
         * AD: wonderwomen@qtlt.com
      * azure active directory will get     
         * AAD: wonderwomen@<primarydomainname>        
    * click on group
    ![Preview](./Images/Azure189.png)
    ![Preview](./Images/Azure190.png)
    ![Preview](./Images/Azure191.png)
    ![Preview](./Images/Azure192.png)
    ![Preview](./Images/Azure193.png)
* Now finally we can login as created users
  * For example:
  * username `QTLT\ironman` and password `*****`
  ![Preview](./Images/Azure194.png)
  * we can see the different user login to windows server

* **Note:** Adding custom domain name to AAD [Refer Here](https://learn.microsoft.com/en-us/entra/identity/users/domains-manage)
* Now lets install Azure AD Connect [Refer Here](https://learn.microsoft.com/en-us/entra/identity/hybrid/connect/whatis-azure-ad-connect)
![Preview](./Images/Azure199.png)
* provide the user created in azure cloud portal credentials
![Preview](./Images/Azure200.png)
* provide the on premise server created credentials, means windows server credentials
![Preview](./Images/Azure202.png) 
![Preview](./Images/Azure203.png)
![Preview](./Images/Azure204.png)
![Preview](./Images/Azure205.png)
* Now successfully azure ad connect installation configuration and sync has done 
* Lets create a user who has global administrator permission on Azure cloud AD
![Preview](./Images/Azure195.png)
![Preview](./Images/Azure196.png)
![Preview](./Images/Azure197.png)
![Preview](./Images/Azure198.png)
* Now login into private windows with user credentials which is created above, if we dint login means then unable to connect to azure ad while doing the azure ad connect installation, it will show error message 
![Preview](./Images/Azure201.png) 
* incase we need to change any configuration in synchronization, we can do it 
![Preview](./Images/Azure206.png)
* Now login into company azure cloud account
   * check on premise active directory is synchronized with azure cloud active directory 
   * so successfully we have brought on premise active directory into azure cloud active directory 
   * we can able to user all the users and groups
   ![Preview](./Images/Azure207.png)
   ![Preview](./Images/Azure208.png)
   * once after getting on prem ad into azure cloud ad, now we can give permission to them on subscription level, resources group level or resources level as per our requirements
   * Now we can login into azure cloud by using the same on premise ad account credentials 
   ![Preview](./Images/Azure209.png)

* [Refer Here](https://www.microsoft.com/en-us/security/business/microsoft-entra-pricing) for Microsoft Entra ID/azure AD   