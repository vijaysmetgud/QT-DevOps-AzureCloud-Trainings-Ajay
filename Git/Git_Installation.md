Git Installation:
-----------------

### CentOS:
```bash
yum update -y 
yum groupinstall "Development Tools" -y
yum install git-all
sudo yum install dh-autoreconf gettext-devel openssl-devel perl-CPAN curl-devel perl-devel zlib-devel expat-devel openssl-devel -y
git --version
```

### Ubuntu:

```bash
apt-get update
apt-get install dh-autoreconf libcurl4-gnutls-dev libexpat1-dev \ gettext libz-dev libssl-dev
apt install make
apt install git
```

### Latest Version Git:
* incase for Centos or Ubuntu, if we needs to install latest version as per our choosing decision then follow below steps

#### Steps:
* [Click Here To Download git](https://mirrors.edge.kernel.org/pub/software/scm/git/) for latest version

```bash
wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.27.0.tar.gz
tar -zxvf git-2.27.0.tar.gz 
cd /git-2.27.0
make configure
./configure --prefix=/usr
make install
git --version
```

### Windows:
* [Click Here](https://gitforwindows.org/)
* follow exe next option after clicking on above link
* Click  the check box for adding git bash for windows terminal

---

### To generate SSH Key-Gen:

```bash
# Generate ssh-keygen
ssh-keygen -t rsa -b 4096/2048 -C "your_email@example.com"
# Enable SSH Agent
eval "$(ssh-agent -s)"
# add SSH key to the SSH agent
ssh-add ~/.ssh/id_rsa
# To test ssh connection
ssh -T git@github.com
```



