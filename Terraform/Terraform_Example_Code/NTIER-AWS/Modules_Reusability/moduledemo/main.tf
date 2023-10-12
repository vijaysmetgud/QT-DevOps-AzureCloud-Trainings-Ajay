


/* # this below module code executed in the local path
module "securitygroup" {
  source = "./modules/securitygroup"
  securitygroup_config = {
    name        = "websg"
    description = "this is websecurity group"
    vpc_id      = "vpc-0cc32a531d007df52"

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
  }

}  */



# this below module code executed in the github repo path means remote
module "securitygroup" {
  source = "github.com/AjayKumarRamesh/QT-DevOps-AzureCloud-Trainings-Ajay/QT_Module_Practice/securitygroup"
  securitygroup_config = {
    name        = "websg"
    description = "this is websecurity group"
    vpc_id      = "vpc-0e4032d8d628c8dc6"

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
  }

} 