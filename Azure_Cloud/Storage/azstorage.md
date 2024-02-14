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
![Preview](./Images/azstorage81.png)
* upload 2 files into `docs` container.
![Preview](./Images/azstorage82.png)
* Now delete any one object (blob)
![Preview](./Images/azstorage83.png)
![Preview](./Images/azstorage84.png)
* click on show Show deleted blobs, to see which file is deleted
![Preview](./Images/azstorage85.png)
* Recover the blob in next 7 days, since there is default option to recover in 7days is enabled
![Preview](./Images/azstorage86.png)
* Now refresh and check after clicked undeleted option file has again occurred 
![Preview](./Images/azstorage87.png)
* click on Show deleted blobs, it will not show any file has deleted
![Preview](./Images/azstorage88.png)
* **Note:** if the versioning is enabled post undelete make the undelete object as current version in versions tab. if not it will not show the file is occurred back. 
* Delete the `docs` container
![Preview](./Images/azstorage89.png)
![Preview](./Images/azstorage90.png)
* click on Show deleted containers, to see what all containers are deleted
![Preview](./Images/azstorage91.png)
* Recover the container
![Preview](./Images/azstorage92.png)
![Preview](./Images/azstorage93.png)
* Now refresh and check container is back
![Preview](./Images/azstorage94.png)
* if we click on Show deleted containers, it not showing any container is deleted
![Preview](./Images/azstorage95.png)

### Recover a Deleted storage account
* Once the storage is deleted, it can be recovered in 14 days in the following cases:
  * The resource group in which storage account was created still exists or in the case if we deleted the resource group
  * if we dint create a another resource group with same name 
* Delete the storage account & wait for the operation to be complete
![Preview](./Images/azstorage96.png)
* Click on restore option to recover storage account which is deleted
![Preview](./Images/azstorage97.png)
![Preview](./Images/azstorage98.png)
* observe it is recovered storage account back
![Preview](./Images/azstorage99.png)

### Snapshots and Point in time restore
* A snapshot is a read-only version of blob that’s taken at a point of time
* Point in time restore provides protection against accidental deletion or corruption by enabling you to restore block blob to its earlier
* To enable point in time restore
   * soft delete
   * Change feed
   * Blob versioning
* Enable point int time restore
![Preview](./Images/azstorage100.png)
![Preview](./Images/azstorage101.png)
* [Refer Here](https://learn.microsoft.com/en-us/azure/storage/blobs/point-in-time-restore-overview) for more info on point in time restore

### Replicating Storage Accounts
* Object Replications allows us to sync the blobs accross storage accounts in the same or different accounts
* Lets setup replication
  * create storage account with standard and container
  ![Preview](./Images/azstorage104.png)
  * upload the files/content in the container
  ![Preview](./Images/azstorage105.png)
  * Create storage account with premium and container
  ![Preview](./Images/azstorage106.png)
  ![Preview](./Images/azstorage107.png)
  * Now lets Replicating Storage Accounts from `storageaccountstand` all the files content to storage account `storageaccountpremim`
  ![Preview](./Images/azstorage108.png)
  ![Preview](./Images/azstorage109.png)
  ![Preview](./Images/azstorage110.png)
  ![Preview](./Images/azstorage111.png)
  * Now observe the below screen shot data of the `storageaccountstand` copied to `storageaccountpremim`
  ![Preview](./Images/azstorage112.png)
  * The data will be copied when the objects inside the container matches the rules.
  * When will the execution happen?
     * Execution happens asynchronously, whenever a change happens in storage account, the destination will be updated in few seconds to minutes depending on the sizes of data

### Redundancy Levels
* By default in the case of GRS a region will be chosen by Azure cloud
![Preview](./Images/azstorage113.png)
* Changing the Redundancy of the complete account can be done over here
* Exercise: Is it possible to change the Region shown in Redundancy Levels
![Preview](./Images/azstorage114.png)
  * No not possible to change the secondary region, because it is decided by azure, we can choose the primary region which we creating storage account or we have option called object replication with this we can choose our choose our own region to replicate data.

### Content Delivery Networks and storage account as Website
#### Lab setup for above (CDN) Solution
* Ensure you have 4 videos of size atleast > 30 MB.
* rename the files as one.mp4, two.mp4, three.mp4, four.mp4
* Create a html page index.html with following content

```
<html>

<head>
    <style>
    @import url("https://fonts.googleapis.com/css?family=Raleway:400,400i,700,700i&display=swap");

body {
  padding: 2em;
  font-family: Raleway, sans-serif;
  font-size: 1.2em;
}

h1 {
  font-size: 3.6em;
  margin-bottom: 0.5em;
}
h2 {
  font-size: 2.4em;
  margin-bottom: 0.5em;
}

p {
  margin: 1em 0;
  line-height: 1.25;
}
</style>
</head>

<body>
    <h1>Video Sample Page</h1>

<p>This is the video we will work with. It uses a movie from the Blender Foundation (thanks :)</p>
<div id="container">
  <video id='video' controls="controls" width="600">
    <source id='mp4' src="one.mp4" type='video/mp4' />

  </video>
</div> <!-- End Container -->
<br/>
<div id="container">
  <video id='video' controls="controls" width="600">
    <source id='mp4' src="two.mp4" type='video/mp4' />

  </video>
</div>
<br/>
<div id="container">
  <video id='video' controls="controls" width="600">
    <source id='mp4' src="three.mp4" type='video/mp4' />

  </video>
</div>
<br/>
<div id="container">
  <video id='video' controls="controls" width="600">
    <source id='mp4' src="four.mp4" type='video/mp4' />

  </video>
</div>

</body>
</html>
```

* **Hosting a static website using Azure Storage account:**
   * Static website is website developed in can be hosted in azure storage account, like below developed website with static pages with below languages
      * HTML
      * CSS
      * JAVASCRIPT
* [Refer Here](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website) for Static website hosting in Azure Storage official docs
* [Refer Here](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-blob-static-website-how-to?tabs=azure-portal) For step-by-step guidance to Host a static website in Azure Storage.
* **Steps:**
   * create a storage account
   * Enable static website hosting
      * provide the Index document name
      * Error document path
      * click on save
      ![Preview](./Images/azstorage115.png)
      * copy the primary endpoint url to access your static website
      `https://stwebdemo.z13.web.core.windows.net/`
   * after saving default container will created called `web container`
   * upload index.html,error.html files and also from one.mp4 to four.mp videos files to the $web container 
   * Now access you url static website to
   `https://stwebdemo.z13.web.core.windows.net/`
   ![Preview](./Images/azstorage116.png)
   * if we type wrong url then it redirect to `error.html` page
   ![Preview](./Images/azstorage117.png)

### Content Delivery Networks
* CDN means copying the videos to nearest location so that it will improve the latency speed so that we can watch videos very fast 
  * **Experiment:**
* Steps:
  * create storage account 
  * create container
  * uploaded vidoes one.mp4, two.mp4, three.mp4, four.mp4
  * copy the above each of vidoes urls in the index.html files after upload is finished like below
  ![Preview](./Images/azstorage118.png)
  * [Refer Here](https://github.com/codesquareZone/AzureCloudZone/commit/8ed9ba059a56ea4412a6a824ad069768434ad070) index.html with urls 
* now click on index.html files and check the video playing speed, usually it will be slow because we have choose storage account from east us, so video is coming from that location to india bangalore it is taking time.
* [Refer Here](https://www.azurespeed.com/Azure/Latency) for Azure Latency Test

* **Configuring Azure Content Delivery Networks(CDN):**
  * In Azure We can create Azure CDN or Azure Front door profile to a storage account.
  * Once enabled the blobs can be cached in many regions and POP/Edge locations.
  * This improves your website performance
* **Steps:**
![Preview](./Images/azstorage119.png)
![Preview](./Images/azstorage120.png)
![Preview](./Images/azstorage121.png)
* Now access the videos with Endpoint url
  `https://qtvideos.azureedge.net`
* now we can access the videos very fast
![Preview](./Images/azstorage122.png)
* to check different between normal video uploaded and with cdn, just open two html files and check the videos playing speed
* this below is new html file wit name `optindex.html` add the following content in this file 
```
<html>

<head>
    <style>
    @import url("https://fonts.googleapis.com/css?family=Raleway:400,400i,700,700i&display=swap");

body {
  padding: 2em;
  font-family: Raleway, sans-serif;
  font-size: 1.2em;
}

h1 {
  font-size: 3.6em;
  margin-bottom: 0.5em;
}
h2 {
  font-size: 2.4em;
  margin-bottom: 0.5em;
}
	
p {
  margin: 1em 0;
  line-height: 1.25;
}
</style>
</head>

<body>
    <h1>Video Sample Page</h1>

<p>This is the video we will work with. It uses a movie from the Blender Foundation (thanks :)</p>
<div id="container">
  <video id='video' controls="controls" width="600">
    <source id='mp4' src="https://qtvideos.azureedge.net/vidoes/one.mp4" type='video/mp4' />

  </video>
</div> <!-- End Container -->
<br/>
<div id="container">
  <video id='video' controls="controls" width="600">
    <source id='mp4' src="https://qtvideos.azureedge.net/vidoes/two.mp4" type='video/mp4' />

  </video>
</div>
<br/>
<div id="container">
  <video id='video' controls="controls" width="600">
    <source id='mp4' src="https://qtvideos.azureedge.net/vidoes/three.mp4" type='video/mp4' />

  </video>
</div>
<br/>
<div id="container">
  <video id='video' controls="controls" width="600">
    <source id='mp4' src="https://qtvideos.azureedge.net/vidoes/four.mp4" type='video/mp4' />

  </video>
</div>

</body>
</html>
```

### Azure File Shares
#### Activity:
  * Overview
  ![Preview](./Images/azstorage123.png)
  * Create a Virtual Machine A
  * Create a Virtual Machine B
  ![Preview](./Images/azstorage124.png)
  * create storage account 
    * create a file share
      * Standard Storage account
      * Premium File Share
      ![Preview](./Images/azstorage125.png)
      ![Preview](./Images/azstorage126.png)
  * Mount the Azure file share in both virtual machines
  * look in linux os we have only two disk, osdisk and tempdisk
  for vm1 and vm2
  ![Preview](./Images/azstorage127.png)      
  ![Preview](./Images/azstorage128.png)
  * Now we will link azure file share to our linux vm and create another filesystem
  ![Preview](./Images/azstorage129.png)
  ![Preview](./Images/azstorage130.png)
  * copy above screen sript and paste the script in the linux vm or create shell file and execute the script 
  * execute below command to see filesystem
    
    `df -h`
  * we have new file system is mounted called `//storagedemons.file.core.windows.net/tools` and folder is `tools`
  ![Preview](./Images/azstorage131.png)
  * create a folder called content

    `mkdir /tools/content`
   * when we executed above command in vm folder is created in the azure file share so link has done successfully between our vm and azure file share
   ![Preview](./Images/azstorage132.png)
   ![Preview](./Images/azstorage133.png)
   * create a files inside the content folder

      `touch /tools/content/{1..10}`
   ![Preview](./Images/azstorage134.png)
   ![Preview](./Images/azstorage135.png)

### Disk Storage in Azure
* When we create a virtual machine the disks will be created.
* In Azure we have 2 types of disks based on where they are created
   * Created on the same physical server, where vm is created is called as => Temp Disk
   * Created on the different physical server in Same Region/Zone is called as => Data Disk
* Since Temp Disk is allocated from same server, when vm is stopped/deallocated or removed the Temp Disk also gets deallocated or deleted. (Non Persistent)
* Data Disk where we have two types shown below can exist even after the virtual machine is deleted. (Persistent Disks)
   * OS Disk (This disk has operating system)
   * Data Disk
   ![Preview](./Images/azstorage136)
* Azure allow Disks to be created in two ways
   * Storage Account
     * This is referred as unmanaged disk
     * Page Blobs in Storage accounts means virtual hard disk     

   * Managed Disks:
      * This is service for handling disks
* Temp Disk: Size is decided by the vm type
* Sizes of Data Disk, each data disk can have a maximum size of 32,767 GiB and Ma size of OS disk is 4095 GiB
* Types of Azure Managed Disks:
   * Ultra Disks
   * Premium SSD v2
   * Premium SSD
   * Standard SSD
   * Standard HDD
* [Refer Here](https://learn.microsoft.com/en-us/azure/virtual-machines/disks-types#disk-type-comparison) for disk type comparison and Azure managed disk types
![Preview](./Images/azstorage137.png)

### Create a Azure Virtual Machine with Size B1s
* Figure out the Max IOPS, Number of Data Disks possible and Temp Storage Size from VM Size chart
![Preview](./Images/azstorage138.png)
* Lets look at Disks Tab
![Preview](./Images/azstorage39.png)
* we Resize the possible way of available disk
![Preview](./Images/azstorage140.png)
* we can  Create and attach a new disk or Attach an existing disk 
![Preview](./Images/azstorage141.png)
* Now create the Virtual Machine
![Preview](./Images/azstorage142.png)
![Preview](./Images/azstorage143.png)
* After creating vm lets check os disk by executing  below 
![Preview](./Images/azstorage144.png)

Azure Managed Disk
-------------------
* Azure is responsible for attaching disk to vm’s, Partitioning, formats and customizations post vm creation is user’s responsibility
* Backups of Disks are called as snapshots and can be automated or scheduled.

### Managed Disk on Windows – Activities – 1
* Create a Windows VM with os,data disk and stop the vm, increase the size of data disk.
![Preview](./Images/azstorage145.png)
![Preview](./Images/azstorage146.png)
* create and attach new disk
![Preview](./Images/azstorage147.png)
![Preview](./Images/azstorage148.png)
![Preview](./Images/azstorage149.png)
![Preview](./Images/azstorage150.png)
![Preview](./Images/azstorage151.png)
* windows vm is created
![Preview](./Images/azstorage152.png)
* Login into windows server with username and password
* go to server manager and check the disk details
![Preview](./Images/azstorage153.png)
* there only two disk, os diks and temp disk but we have created 4gb extra disk which is created but not allocated so we needs to allocate it
* follow below screen shots steps 
![Preview](./Images/azstorage154.png)
![Preview](./Images/azstorage155.png)
![Preview](./Images/azstorage156.png)
![Preview](./Images/azstorage157.png)
![Preview](./Images/azstorage158.png)
![Preview](./Images/azstorage159.png)
![Preview](./Images/azstorage160.png)
![Preview](./Images/azstorage161.png)
* Now check new disk has allocated has f drive which we configured above and Created a disk with 4 GB 
![Preview](./Images/azstorage162.png)
* Now resize the data disk to the higher size
![Preview](./Images/azstorage163.png)
![Preview](./Images/azstorage164.png)
![Preview](./Images/azstorage165.png)
* Now we have resized the data disk to 8 gb but when we look under server manager => file and storage => disk=> and also file explorer still it shows 4 gb
![Preview](./Images/azstorage166.png)
![Preview](./Images/azstorage167.png)
* We have to add or formate to extra added disk to drive/volume
![Preview](./Images/azstorage168.png)
![Preview](./Images/azstorage169.png)
* after adding/formate check it showing 8 gb
![Preview](./Images/azstorage170.png)
* Look at the file explorer it is also shows 8gb
![Preview](./Images/azstorage171.png)
* Even in the azure cloud portal also we can see size has been increased
![Preview](./Images/azstorage172.png)
* Now try to resize the data disk to lower size and storage type to different it will not allow.but we increase the size not decrease.
* Once vm is stopped/deallocated then we can change the storage type and increase the size for data disk but even cannot go to lower size 
* Temp disk can be resized only by changing vm size

### Terms
* Backup Options
   * Full Backup
   * Incremental Backup
* Restore Options
   * restore backup
   * point in time restore

### Managed Disk on Linux – Activities – 2
#### Mounting Disks on Linux VM’s:
* [Refer Here](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal?tabs=ubuntu) for the article about attaching disks to linux
* Create an ubuntu vm with additional data disk of size 1GiB
![Preview](./Images/azstorage173.png)
![Preview](./Images/azstorage174.png) 
![Preview](./Images/azstorage175.png)
![Preview](./Images/azstorage176.png)
![Preview](./Images/azstorage177.png)
![Preview](./Images/azstorage178.png)
![Preview](./Images/azstorage179.png)
* Login into linux vm to list block devices
![Preview](./Images/azstorage180.png)
* Create file system (format) with xfs
![Preview](./Images/azstorage181.png)
* Now mount the device onto /tools folder
![Preview](./Images/azstorage182.png)
![Preview](./Images/azstorage183.png)
* Now to make persist mounts means, To ensure that the drive is remounted automatically after a reboot, it must be added to the /etc/fstab file, if not when we reboot the vm mount will be lost [Refer Here](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal?tabs=ubuntu#mount-the-disk)
* Follow the below steps to add mount filesystem to FSTAB
* execute below command to get UUID
![Preview](./Images/azstorage184.png)
* add the below entries in the fstab with above found UUID and folder name
```
# open fstab
sudo vi etc/fstab
# copy below content into fstab
UUID=af5a4a4c-a549-4e9f-bee3-6a93a0b49c29   /tools  xfs   defaults,nofail   1   2`
# now save the file fstab
# enter below command and check block dive
lsblk
df -h
```
![Preview](./Images/azstorage185.png)
![Preview](./Images/azstorage186.png)
* Even we can resize the data disk
![Preview](./Images/azstorage187.png)
![Preview](./Images/azstorage188.png)

### Snapshots of Disk
* Snapshot is backup of the disk
![Preview](./Images/azstorage189.png)
* Lets create a snapshot (Full Backup)
![Preview](./Images/azstorage190.png)
![Preview](./Images/azstorage191.png)
![Preview](./Images/azstorage192.png)
![Preview](./Images/azstorage193.png)
![Preview](./Images/azstorage194.png)
* In Azure, the disk is scoped to a region and snapshot is also scoped to a region. i.e. Snapshot created from one region can be used to create a disk in the same region, not possible in another region.
* example below screen shot, it is not showing any region option to select, apart from zones.
![Preview](./Images/azstorage195.png)
![Preview](./Images/azstorage196.png)
* If you want to create a disk in other region,then first copy snapshot to that region
![Preview](./Images/azstorage197.png)

Azure Backup Center
-------------------
* This is a central service for backup of many Azure Services including virtual machines, Disks. [Refer Here](https://learn.microsoft.com/en-us/azure/backup/backup-center-overview) for Azure Backup and Azure Site Recovery official docs
* Create a vault:
  * Backup Vault
  ![Preview](./Images/azstorage198.png)
  ![Preview](./Images/azstorage199.png)
  ![Preview](./Images/azstorage200.png)
  ![Preview](./Images/azstorage201.png)
  ![Preview](./Images/azstorage203.png)
  ![Preview](./Images/azstorage204.png)
* Now ensure you have a vm with data disks attached. In this demonstration we have a vm with
   * os disk: 30 GB
   * Data disk 0 : 1 GB
   * Data disk 2 : 2 GB
![Preview](./Images/azstorage205.png)
![Preview](./Images/azstorage206.png)
![Preview](./Images/azstorage207.png)
* Ensure the disks are formatted and mounted to vm with some data in it
  * Steps:
     * Login into vm
     ![Preview](./Images/azstorage208.png)
     ![Preview](./Images/azstorage209.png)
     ![Preview](./Images/azstorage210.png)
     ![Preview](./Images/azstorage211.png)
     ![Preview](./Images/azstorage212.png)
     * add the below entries in the fstab with above found UUID and folder name

     ```
     # open fstab
     sudo vi etc/fstab
     # copy below content into fstab
     UUID=af5a4a4c-a549-4e9f-bee3-6a93a0b49c29   /tools  xfs   defaults,nofail   1   2`
     # now save the file fstab
     # enter below command and check block dive
     lsblk
     df -h
     ```
     ![Preview](./Images/azstorage213.png)
     ![Preview](./Images/azstorage214.png)
     * Now adding some to to datadisk1 and datadisk2
     ![Preview](./Images/azstorage215.png)
     ![Preview](./Images/azstorage216.png)
* Lets configure backup for managed disks























