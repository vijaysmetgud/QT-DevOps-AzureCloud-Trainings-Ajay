Storage Needs
-------------

### Storage Types By Hardware or Topology:
   * Disk Storage
      * to store data
   * Shared Disk Storage:
      * Network Attached storage
      * Storage Area Networks
          * to use by multiple people common storage
   * Blob Storage (Cloud Storage)

### Storage Types By Usecases
  * Disk
  * Network File Shares/(Shared Disk Storage)
  * Database
  * Data Lakes
  * Backup   

Some important storage concepts
--------------------------------
* **Unit of Storage:**
    * kilobyte vs kibi byte (kb vs kib)
       * 1 kilobytes = 1000 MB
       * 1 kibibytes = 1024 MB

* **Speed of Disk is Measured in two ways:**
   * IOPS (IO per second) 
      * means in per second our hard disk how much data it can read or write
   * Throughput

* **Disk Types:**
   * Magnetic
   * HDD
   * SSD

* **Durability:**
   * what ever you store data or anything what is the lasting capacity/time
* **High Availability:**
   * means data should be accessible all time or not or there is any down time
* **Scalable:**
   * data should be accessible all the time
   * storing the data for storage should always increasing or decrease should be easy and scalable, should say that cannot increase the storage , it is only limited

### Basic Datacenter
![Preview](./Images/azstorage.png)

### Azure Global infra
* Region has two types
   * Regions
   * Regions with zones
* Edge or Point of Presence location
![Preview](./Images/azstorage1.png)
* Explore Azure infra[Refer Here](https://datacenters.microsoft.com/globe/explore)
   * sky blue points are Regions
   * small full blue are edge or point location
* **Azure Cloud Core Storage Services:**
   * Azure Storage Account
      * Containers:
        * Block Blob (Any file)
        * Page Blob (Virtual disk)
        * Append Blob (Log files)
      * Azure File shares (shared network drives)
      * Azure Table Storage (NoSQL Data)
      * Azure Queue Storage (Message Queue)
   * Azure Managed disk
   * Azure Backup & Azure Site Recovery

### Cloud Terms:
* Service: Whatever azure is offering
* Resource: What we create


Azure Storage Services
------------------------
* [Refer Here](https://learn.microsoft.com/en-us/azure/storage/common/storage-introduction?toc=%2Fazure%2Fstorage%2Fblobs%2Ftoc.json#azure-storage-data-services) official docs
* Azure Provides storage services out of which to deal with the below we need storage account
* what above line means by four below service can be created by using one service in azure called storage account
   * blob storage
   * file share
   * Table storage
   * Queue Storage

Azure Storage Account
----------------------
* Azure Storage account is a service for offering storage services around
  * blobs
  * file shares
  * table storage
  * Queue Storage

* To Store Blobs, We need to create containers. In Each container we can unlimited number of files.
* Each file in Azure Storage account cannot be greater than 4.7 TiB
* Creating a Storage Account:[Refer Here](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-create?tabs=azure-portal) for the docs
![Preview](./Images/azstorage2.png)
![Preview](./Images/azstorage3.png)
![Preview](./Images/azstorage4.png)
* Lets create container to add some data to storage account
![Preview](./Images/azstorage5.png)
![Preview](./Images/azstorage6.png)
![Preview](./Images/azstorage7.png)
![Preview](./Images/azstorage8.png)
![Preview](./Images/azstorage9.png)
![Preview](./Images/azstorage10.png)
* Storage Account name has to be unique across Azure
* url of the storage account/object will be in the following pattern:

`https://qtstoragefortesting.blob.core.windows.net/data/SampleVideo_1280x720_1mb.mp4`

`https://<storageaccountname>.blob.core.windows.net/<container-name>/<filepath>`
* since the storage account and container names are part of urls they need to follow the naming constraints of urls
* Now Lets access the storage account stored object by below url

`https://qtstoragefortesting.blob.core.windows.net/data/SampleVideo_1280x720_1mb.mp4`
![Preview](./Images/azstorage11.png)

SLA’s (Service Level Agreements)
---------------------------------
* Microsoft Azure Gives gurantees to all services in terms of availability
* In Case of storage we have SLA’s around durability as well.

Redundancy in Azure Storage Account
-----------------------------------
* [Refer Here](https://learn.microsoft.com/en-us/azure/storage/common/storage-redundancy) for official docs

* LRS ( Locally Redundant Storage)
   * Any data uploaded will make three synchronous copies in 3 different physical servers
   ![Preview](./Images/azstorage12.png)

* ZRS (Zone Redundant storage)
  * Any data uploded will make three syncronous copies into 3 different zones
  ![Preview](./Images/azstorage13.png)

* RA-GRS (Read only – Geo-Redundant Storage)
   * Create 3 synchoronous in same region as LRS and 3 asynchronous copies in secondary region
   ![Preview](./Images/azstorage14.png)

* Durability and Availability options
    * [Refer Here](https://learn.microsoft.com/en-us/azure/storage/common/storage-redundancy#durability-and-availability-parameters) for official docs 

* RA – GZRS
![Preview](./Images/azstorage15.png)

### Storage Account Creation Options w.r.t Redundancy
* Region with Zones

![Preview](./Images/azstorage16.png)
* Regions without Zones

![Preview](./Images/azstorage17.png)

Access Tier in Storage Account
-------------------------------
* [Refer Here](https://learn.microsoft.com/en-us/azure/storage/blobs/access-tiers-overview) for official docs
* **Hot:** This is default access tier and is used for frequently accessed data.
     * Storage cost is highest
     * Access Cost is cheapest
* **Cool:** This is access tier which is used for infrequently accessed data.
    * Storage cost is moderate
    * Access cost is more
* **Cold Tier:** This is access tier which is used for infrequently accessed data. This data has to be at least 90 days old
   * Storage cost is less than cool
   * Access cost is more
* **Archive Tier:**
   * Storage cost is cheapest
   * No access.
   * If you want to access convert the access tier of the file to hot or cool.
   * Rehydrating the Access tier [Refer Here](https://learn.microsoft.com/en-us/azure/storage/blobs/archive-rehydrate-to-online-tier?tabs=azure-portal)
     * By changing its tier from archive to hot or cool with the Set Blob Tier operation. 
     * By copying it to a new blob in the hot or cool tier with the Copy Blob operation.
* [Refer Here](https://azure.microsoft.com/en-us/pricing/calculator/) for pricing calculator


Reservations in Azure
----------------------
* [Refer Here](https://azure.microsoft.com/en-in/pricing/reservations/) for Azure reservations where azure offers more discount if we give a commitment for 1 year or 3 years

Storage Account
----------------
* Different Types of Data that can be stored in Azure Storage account
  * Block Blob => Any file less than 4.7 TiB
  * Page Blob => Virtual Hard disk
  * Append Blob => Log files
  * Table Storage => NoSQL Data
  * File Share => Network Disk
  * Queue Storage => Message Queue

* Types of storage accounts[Refer Here](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-overview#types-of-storage-accounts)
* Premium Blob storage [Refer Here](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-block-blob-premium)
* Azure Storage Account created will not be part of virtual network
* Any data in storage account is accessed over https using internet which can be restricted.


### Activity 1: create a basic storage account
* Create a storage account with standard, any redundancy other than LRS
* Create two **containers:**
   * shared (Anonymous access blob/container)
   * private (private access)
* Upload any files into above created container preferably `(.txt,.pdf,.mp3,.png,.mp4)`

#### Solution:
* Created a resource group in east us
![Preview](./Images/azstorage18.png)
* Create a storage account
![Preview](./Images/azstorage19.png)
![Preview](./Images/azstorage20.png)
![Preview](./Images/azstorage21.png)
* create public container called `shared`
![Preview](./Images/azstorage22.png)
![Preview](./Images/azstorage23.png)
* created private container called `private`
![Preview](./Images/azstorage24.png)
![Preview](./Images/azstorage25.png)
* upload files to public container
![Preview](./Images/azstorage26.png)
![Preview](./Images/azstorage27.png)
* Now access the object/content of public container
![Preview](./Images/azstorage28.png)
`https://storageaccountativiy.blob.core.windows.net/shared/SampleVideo_1280x720_2mb.mp4`
* it public container able to access
![Preview](./Images/azstorage29.png)
* Upload files to private container
![Preview](./Images/azstorage30.png)
![Preview](./Images/azstorage31.png)
* Now access the object/content of private container
![Preview](./Images/azstorage32.png)

`https://storageaccountativiy.blob.core.windows.net/private/file_example_MP4_1920_18MG.mp4`
* Error message when trying to access private container blob
![Preview](./Images/azstorage33.png)

### Activity 2: Create other storage types

* **File Shares:**
![Preview](./Images/azstorage34.png)
![Preview](./Images/azstorage35.png)
![Preview](./Images/azstorage37.png)

* **Queue Storage:**
![Preview](./Images/azstorage38.png)
![Preview](./Images/azstorage39.png)
![Preview](./Images/azstorage40.png)

* **Table Storage:**
![Preview](./Images/azstorage41.png)
![Preview](./Images/azstorage42.png)
![Preview](./Images/azstorage43.png)

Azure BackBone/Global Network
------------------------------
* [Refer Here](https://azure.microsoft.com/en-in/explore/global-infrastructure/global-network) 
* Microsoft has a backbone network which connects every region, edge location with a network cable carrying only azure related data.

Connecting to Azure Storage Account privately
---------------------------------------------
* Azure storage account will not be part of virtual networks, to access data in the storage account the basic option is internet. If the vm in azure wants to access data in storage account, we can take the help of global network via private endpoints and private links
* **Global network:** means a network cable which connects betweens regions of edge points 
* Overview: 
![Preview](./Images/azstorage44.png)

#### Lets establish private connectivity between virtual machine and storage account
* **Steps:**
* Create a virtual machine
![Preview](./Images/azstorage45.png)
* Now create a storage account with the following selections in network tab
![Preview](./Images/azstorage46.png)
![Preview](./Images/azstorage47.png)
* Create private endpoint
![Preview](./Images/azstorage48.png)
![Preview](./Images/azstorage49.png)
* Now change the settings in Firewalls and virtual networks, to allow access to upload the files in container
![Preview](./Images/azstorage50.png)
![Preview](./Images/azstorage51.png)
* Now in this storage account create a public container and upload some data
![Preview](./Images/azstorage52.png)
![Preview](./Images/azstorage53.png)
* Now below url to access the container object so when other user access from internet they are unable to access, because it is private endpoint
`https://sttestingpurposes.blob.core.windows.net/publiccontainer/one.txt.txt`
* So even we can access the public container object by using curl from vm login into it, because we have added the v-net for vm and storage account same with establishing private endpoints 
![Preview](./Images/azstorage54.png)
* Now in this storage account create a private container and upload some data
![Preview](./Images/azstorage55.png)
![Preview](./Images/azstorage56.png)
* In Networking settings=> Firewalls and virtual networks
  * if i delete the ips ranges access from internet, then even from my laptop or my network from internet i am unable to access
  ![Preview](./Images/azstorage59.png)
  * Now delete the above said ips ranges access from internet, now try to access the object url from laptop or my own internet
  ![Preview](./Images/azstorage60.png)
  ![Preview](./Images/azstorage61.png)
  * i got AuthorizationFailure when i access the public container object with below url
  `https://sttestingpurposes.blob.core.windows.net/publiccontainer/one.txt.txt`
  * but i am able to access from vm since both are are in the same network and that is how we have created private endpoint connection
  ![Preview](./Images/azstorage62.png)
  * that is how we secure the storage account of container object. 
* If i access the private container with url or logging into vm i will get error message, it will not allow 
`https://sttestingpurposes.blob.core.windows.net/private/one.txt.txt`
![Preview](./Images/azstorage57.png)
![Preview](./Images/azstorage58.png)
* **To Accessing Private Data:**
  * We can generate shared access signatures(SAS)
  ![Preview](./Images/azstorage63.png)
  ![Preview](./Images/azstorage64.png)
  * After clicking generate SAS token we will get below url, observe screen shot
  ![Preview](./Images/azstorage65.png)
  * [Refer Here](https://sttestingpurposes.blob.core.windows.net/private/one.txt.txt?sp=r&st=2024-02-03T12:38:28Z&se=2024-02-04T13:30:00Z&sip=0.0.0.0-255.255.255.255&spr=https&sv=2022-11-02&sr=b&sig=FhMEKRx9k1SkUVi%2BUPaAIb31TpYRPfQ%2BGA7g00VTvR8%3D) for the SAS token url
  * Access the url from browser, we can able to access private container 
  ![Preview](./Images/azstorage66.png)
* SAS Tokens provide temporary access to blobs and to generate sas tokens we need access keys
![Preview](./Images/azstorage67.png)
   * in case if Rotate the access key then, the old token is gone, means no longer will work we have to use new one which is generated after rotation
   ![Preview](./Images/azstorage68.png)
   * Now we are unable to access the private container url since access key rotation has done 
   ![Preview](./Images/azstorage69.png)
* **connection strings:**
   * We can access storage accounts from code to perform operations using connection strings
   * [Refer Here](https://learn.microsoft.com/en-us/azure/data-explorer/kusto/api/connection-strings/storage-connection-strings)
   * The connection string defines the resource to access and its authentication information. Azure Data Explorer supports the following authentication methods: Impersonation. Managed identity. Shared Access (SAS) key.
   * [Refer Here](https://github.com/Azure/azure-sdk-for-python/blob/main/sdk/storage/azure-storage-blob/samples/blob_samples_authentication.py)
   

Versioning in Azure Storage Account Blob Storage
------------------------------------------------
* Enabling versioning can be done in two options:
  * one is while creating storage account from Data Protection tab
  ![Preview](./Images/azstorage70.png)
  * another one is Data Protection tab post creation of storage account
  ![Preview](./Images/azstorage71.png)
  * Create a public container with blob anonymous access and upload a text file
  ![Preview](./Images/azstorage72.png)
  ![Preview](./Images/azstorage73.png)
  * now access the container of file
  ![Preview](./Images/azstorage74.png)
  * there is no versions in the file
  ![Preview](./Images/azstorage75.png)
  * Now upload the file again after making some changes and you should see a new version added in the versions tab, when uploading check the box for overwrite
  ![Preview](./Images/azstorage76.png)
  * Now when we access again file we can see new version for the same file 
  ![Preview](./Images/azstorage77.png)
  ![Preview](./Images/azstorage78.png)
  * even we can make current default version when we access the file
  ![PReview](./Images/azstorage79.png)

Soft Delete of Containers and Blobs
----------------------------------
* Soft delete of blobs and container means, when we delete it, it can be recover with in the days mentioned in the data protection, observe below screen shot
* Azure storage account offers soft delete for blobs and containers
* A blob/container deleted can be restored in 7 days by default but the value can be set anywhere between 1 and 365
![Preview](./Images/azstorage80.png)

### Activity – Soft delete blob:
* Create a storage account and ensure a container called as `docs` is created.
![Preview](./Images/azstorage80.png)
* upload 2 files into `docs` container.



