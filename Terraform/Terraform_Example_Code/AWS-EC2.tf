// Example of below is for EC2 creation in AWS and Azure:-

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.9.0"
    }
  }
}

provider "aws" {
   region = "us-west-2"

 // passing access_key and secret_key directly in the code example below:
 /*
  access_key = "AKIA5VIYY73GM2GDQHEX"
  secret_key = "34LcG72KNm32hE7v3EZM05BLrZcawcWkSGPzrmsE"
 */ 
} 


resource "aws_instance" "fromtf" {
    ami = "ami-03f65b8614a860c29"
    instance_type = "t2.micro"
    tags = {
        Name = "from terraform"

    } 

    key_name = "Devops.rsa" 
    vpc_security_group_ids = ["sg-0f980acf2bab4bb5b"]
} 



