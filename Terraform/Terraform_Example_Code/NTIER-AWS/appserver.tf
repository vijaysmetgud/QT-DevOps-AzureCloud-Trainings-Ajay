
/* # this below code is for import the public key raw no variable
resource "aws_key_pair" "my_key" {
  key_name   = "id-rsa"
  public_key = file("~/.ssh/id_rsa.pub")

}
 */


# this below code is for import the public key with variable public_key_path
resource "aws_key_pair" "my_key" {
  key_name   = "id-rsa"
  public_key = file(var.public_key_path)

  tags = {
    owner = "terraform created"
  }
}


# this below code is to fetch the details of subnets id to create appserver ec2 into that particular subnets
data "aws_subnet" "app" {
  filter {
    name   = "tag:Name"
    values = [var.app_subnet_name]
  }

  depends_on = [
    aws_subnet.subnets
  ]

}
#  this below code is to create ec2 instance for appserver with little variable in inputs.tf 
resource "aws_instance" "appserver" {
  ami                         = var.ubuntu_ami_id
  instance_type               = var.app_ec2_size
  key_name                    = aws_key_pair.my_key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.appsg.id]
  subnet_id                   = data.aws_subnet.app.id

  # this below code is for remote-exec to connect above ec2 machine install or do anything in that server
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    # this below code is to know the public ip address of this above ec2 machine 
    # host = aws_instance.appserver.public_ip

    # this below we used since we are writing our connection in the same block of ec2 machine if different then above code is recommended
    host = self.public_ip
  }

  # this below code to cpy the installjenkins.sh scrript from current directory to remote machine
  provisioner "file" {
    source      = "./installjenkins.sh"
    destination = "/tmp/installjenkins.sh"
  }

  # this below command is to execute the script into the remote machine which is created above 
  provisioner "remote-exec" {
    script = "/tmp/installjenkins.sh"
  }

  /* # this below command is to execute the commands direclty into the remote machine by writing code in remote-exec block which is created above 
  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update",
      "sudo apt install openjdk-11-jdk -y",
      "cd /tmp && wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar
java -jar /tmp/spring-petclinic-2.4.2.jar &"
     ]
  } */

  depends_on = [aws_subnet.subnets]
}

# this below code is for null resource means it will not create any resource just it will use only for execute provisioner
/* resource "null_resource" "script_executor" {
  provisioner "remote-exec" {
    inline = [ 
      "sudo apt update",
      "sudo apt install openjdk-11-jdk -y",
      "cd /tmp && wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar
        java -jar /tmp/spring-petclinic-2.4.2.jar &"
    ]
  }
  
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file(var.private_key_path)
    host = aws_instance.appserver.public_ip
  }

triggers = {
  app_script_version = var.app_script_version
}
  depends_on = [ aws_instance.appserver ]
}

 */