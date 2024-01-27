Infrastructure as Code
----------------------

* This is an approach of managing infrastructure where infrastructure is described in configuration files and then used to create the infra automatically.

* Tools:
   * Azure:
     * ARM Templates
     * Bicep
   * AWS:
     * Cloud formation     
  * Generic:
     * Terraform
* Advantages:
   * Reusability
     * managing multiple environments
   * Every change in infra is version controlled

Azure Resource Manager (ARM)
----------------------------
* This is the basis for Azure IaC Capabilities via ARM templates.
* Azure provides capabilities by Resource Providers which are registered to subscription.
* Resource Providers provide services and operations
* refer the below image
![Preview](./Images/arm.png)
* When we are using Azure either from portal/CLI/Powershell/SDK we interact with Resource providers
* **Experiment:** Create a vm in Azure Portal.
  * After successful creation
    * Navigate to Resource Group => deployments
    ![Preview](./Images/arm1.png)
    * Select deployments and view template
    ![Preview](./Images/arm2.png)
    ![Preview](./Images/arm3.png)
* So when we create something from azure portal it is creating template.
* Azure CLI/Powershell and SDK directly interact with Management API of Azure cloud to create resources where as portal tries to create a template. 
* **Experiment:** Create a storageaccount in Azure ClI.  
```
az storage account create \
  --name experiemtntesting \
  --resource-group armdemo \
  --location eastus \
  --sku Standard_RAGRS \
  --kind StorageV2 \
  --allow-blob-public-access false
```
* Check this below screen shot storage account is created through azure cli
![Preview](./Images/arm4.png)
* Check this below screen shot of azure portal storage account has created in the same resources group where vm is created
![Preview](./Images/arm5.png)
![Preview](./Images/arm6.png)
* Observe this below screen shot, when we created storage account using azure cli, it has not created any template.
![Preview](./Images/arm7.png)

#### To create custom templates for our infrastructure we need to express infrastructure as a code using ARM/Bicep:
* ARM uses json
* ARM templates of syntax [Refer Here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/syntax)

* Workflow for creating infra as code:
![Preview](./Images/arm8.png)
* We use IaC Whenever we need to work with creating/modifying infrastructure on various environments 

ARM Templates
--------------
* Template is used to Create infrastructure. This template can be applied at multiple levels
   * Resource Group Deployment
   * Subscription Deployment
   * Management Group Deployment
   * Tenant Deployment

* ARM Template is a json file [Refer Here](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/syntax#template-format) for the basic structure of Json file

```Json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "languageVersion": "",
  "contentVersion": "",
  "apiProfile": "",
  "definitions": { },
  "parameters": { },
  "variables": { },
  "functions": [ ],
  "resources": [ ], /* or "resources": { } with languageVersion 2.0 */
  "outputs": { }
}
```
* In the above Json file basic structure not every field is required.
* At a Bare minimum template filed is required is below:
```Json
{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "",
    "resources": [  ]
}
```

ARM Template – Ways of Working
------------------------------

* Make a list of manual steps required to create infrastructure
* For each step try to figure out what are the inputs

### Demonstration – Ways Of Working
#### Manual Steps:
  * Create a virtual network
     * inputs:
        * resource group
        * virtual network name
        * address space

### ARM Template
 * For writing the template lets use visual studio code and ensure
    * Azure CLI is installed on local terminal
    * Azure resource Manager Extension is installed in visual studio code
    ![Preview](./Images/arm9.png)
* for arm templates reference [Refer Here](https://learn.microsoft.com/en-us/azure/templates/) and for virtual network in arm template [Refer Here](https://learn.microsoft.com/en-us/azure/templates/microsoft.network/virtualnetworks?pivots=deployment-language-arm-template)
  * scroll to resources you want to create 
    * click on service you want to create
    ![Preview](./Images/arm10.png)
    * under service click on resources you want to create
    ![Preview](./Images/arm11.png)
* [Refer Here](https://github.com/codesquareZone/ARMZone/commit/55d26e06901d40b66cb6a9dfc67cf2d07ef1d68e) for virtual network arm template json file

#### Deploy arm template which written above
* Create a resource group
![Preview](./Images/arm12.png)
* Now create template to deploy virtual network
![Preview](./Images/arm13.png)
![Preview](./Images/arm14.png)
![Preview](./Images/arm15.png)
* Now copy and paste ur template to create
![Preview](./Images/arm16.png)
* Review and create
![Preview](./Images/arm17.png)
* virtual network resource has created successfully
![Preview](./Images/arm18.png)
![Preview](./Images/arm19.png)


### Architecture of the application
* which will be creating through arm template
* overview
![Preview](./Images/arm20.png)

* Manual Steps:
  * Create a network and 3 subnets
  ![Preview](./Images/arm21.png)
  ![Preview](./Images/arm22.png)
  ![Preview](./Images/arm23.png)
  ![Preview](./Images/arm24.png)

#### Using ARM Templates to create the virtual network with 3 subnets
  * Resources to be created are: 
    * virtual network
    * 3 subnets
* [Refer Here](https://github.com/codesquareZone/ARMZone/commit/1f4fdd4cf92eef84f48d3a32d8b4ab1b32345504) for ntier template for virtual network with 3 subnetes json file
##### Deploy the arm template for virutal network with 3 subnetes
![Preview](./Images/arm25.png)
![Preview](./Images/arm26.png)
![Preview](./Images/arm27.png)
![Preview](./Images/arm28.png)
![Preview](./Images/arm29.png)
* Successfully created virtual network and 3 subnets
![Preview](./Images/arm30.png)


