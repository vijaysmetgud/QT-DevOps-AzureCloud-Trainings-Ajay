variable "vpc_cidr" {
  type = string
  #  default     = "10.10.0.0/16"
  description = "this is cidr network range"
}

/* # here we are adding 6 subnets to create using count argument
variable "subnet_cidr_ranges" {
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24", "10.10.4.0/24", "10.10.5.0/24"]
  description = "this sunets cidr ranges"

}
 */
# here we are adding 6 subnets name to create using count argument 
# here db subnets added
variable "subnet_names" {
  type = list(string)
  # default             = ["web1", "web2", "app1", "app2", "db1", "db2"]
  # db_subnet_names =     ["db1", "db2"]
  default     = ["web1", "web2", "app1", "app2", "db1", "db2"]
  description = "these are subnet names"
}

/* 
# here below code using format function to call the vaules in the variable
variable "subnet_cider_format" {
  type    = string
  default = "10.10.%g.0/24"

} */


# here we are added 6 subnets count to call in the main.tf file to create 6 subnets
# incase if we dint use concept of length function means then this below variable code is required
# so now ill remove or comment this since i will use length function in the main.tf file
/* variable "subnet_count" {
  type    = number
  default = 6
}
 */

/* variable "web1_subnet_cidr" {
  type        = string
  default     = "10.10.0.0/24"
  description = "this web1 subnet "

} */


# db subnets names variable
variable "aws_db_subnet_names" {
  type        = list(string)
  description = "these are database subnet names"
  default     = ["db1", "db2"]

}

variable "subnet_azs" {
  type        = list(string)
  description = "these are azs"

}


# this below code is for security group and security rule variables
variable "web_sg_config" {
  type = object({
    name        = string
    description = string

    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string

    }))
  })
  description = "this is web security group and security rules"
}

variable "app_sg_config" {
  type = object({
    name        = string
    description = string

    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string

    }))
  })
  description = "this is app security group and security rules"
}


variable "db_sg_config" {
  type = object({
    name        = string
    description = string

    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string

    }))
  })
  description = "this is db security group and security rules"
}




# this below code is for default values 
/* default = ({
    name        = "websg"
    description = "this is security group"

    rules = [{
      type       = "ingress"
      from_port  = 80
      to_port    = 80
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
      },

      {


        type       = "ingress"
        from_port  = 22
        to_port    = 22
        protocol   = "tcp"
        cidr_block = "0.0.0.0/0"
      },

      {
        type       = "egress"
        from_port  = 0
        to_port    = 65535
        protocol   = "-1"
        cidr_block = "0.0.0.0/0"
      }
      ]
  })

 */

# this below code for import public key variable 
variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

# this below code for import private key variable 
variable "private_key_path" {
  type    = string
  default = "~/.ssh/id_rsa"

}

# this below code is for null resource for triggers block, when ever it requires it will trigger the script
variable "app_script_version" {
  type    = string
  default = "0"

}
# ec2 machine variable input
variable "ubuntu_ami_id" {
  type    = string
  default = "ami-04e35eeae7a7c5883"

}

# ec2 machine variable input
variable "app_ec2_size" {
  type    = string
  default = "t2.micro"

}

# this below code is to get the subnet id to fetch using datasource
variable "app_subnet_name" {
  type    = string
  default = "app1"

}

