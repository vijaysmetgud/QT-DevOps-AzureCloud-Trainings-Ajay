# Jenkins and Java Installation On Centos,Ubuntu and Linux 

### Install Jenkins On Centos

* **Intall Java On Centos:**

```bash
yum update
yum list java*
yum install java-11-openjdk.x86_64 
java --version
# To check java version and change it
sudo alternatives --config java
```
* **Install Jenkins On Centos:**
   * [Refer Here](https://www.jenkins.io/download/)
---

### Install Jenkins On Linux

* [Refer Here](https://www.jenkins.io/doc/book/installing/linux/)

---

### Install Jenkins On Ubuntu 

**Install Java On Ubuntu:**

```bash
sudo apt-cache search openjdk
# Select openjdk-17-jdk
sudo apt install openjdk-17-jdk
# To check specific version installation below command
sudo apt-cache madison openjdk-17-jdk
sudo apt install openjdk-17-jdk -y 
```

* **Ubuntu Steps :** [Refer Here](https://www.jenkins.io/doc/book/installing/linux/#debianubuntu)

```bash
sudo apt update 
sudo apt install openjdk-17-jdk -y
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt update
sudo apt install jenkins -y
```
---

### Commands To Check Jenkins Status

```bash
service jenkins status
service jenkins start
service jenkins stop
```
        Or 
```bash
systemctl status jenkins
systemctl start jenkins
systemctl stop jenkins
```
---

### Final Task After Installation Is Successful

* Navigate to `http://<public-ip>:8080`

  ![Preview](./Images/jenkins.png)

* find out the initial Admin password
``` 
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
![Preview](./Images/jenkins1.png.jpg)

* Now Select install suggested plugins
![Preview](./Images/jenkins2.png.jpg)

* Create a new admin user
![Preview](./Images/jenkins3.png.jpg)
![Preview](./Images/jenkins4.png.jpg)
![Preview](./Images/jenkins5.png)
![Preview](./Images/jenkins6.png)

---

