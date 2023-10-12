variable "resource_group_name" {
  type        = string
  default     = "ntier-vnet"
  description = "this is reource group name"
}

variable "location" {
  type        = string
  default     = "eastus"
  description = "this is location name"
}

variable "address_space" {
  type        = string
  default     = "10.10.0.0/16"
  description = "this for networ range"
}


variable "subnet_names" {
  type        = list(string)
  default     = ["web", "app", "db"]
  description = "this is subnet names"

}

/* variable "subnet_address_prefixes" {
  type        = list(string)
  default     = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24", ]
  description = "these are subnet address prefixes"
}
 */


# this below code is web security rule
variable "web_nsg_name" {
  type = object({
    name = string

    rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }) // this code is web security rule 

  #  this is deafult value for sample
  default = {
    name = "web"
    rules = [{
      name                       = "openhttp"
      priority                   = 300
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }]
  }
} //this is deafult value for sample

# this below code is app security rule
variable "app_nsg_name" {
  type = object({
    name = string

    rules = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  })
} // this code is app security rule


# this below code is for mssql database and mssql server variable
variable "db_info" {
  type = object({
    db_name                       = string
    server_name                   = string
    server_version                = string
    user_login                    = string
    user_password                 = string
    public_network_access_enabled = bool
    max_size_gb                   = number
    sku_name                      = string

  })

}


# this below code is for subnet 
variable "app_vm_config" {
  type = object({
    subnet_name      = string
    size             = string
    username         = string
    keypath          = string
    private_key_path = string
    publisher        = string
    offer            = string
    sku              = string
    version          = string
  })
  default = {
    subnet_name      = "app"
    size             = "Standard_B1s"
    username         = "Dell"
    keypath          = "~/.ssh/id_rsa.pub"
    private_key_path = "~/.ssh/id_rsa" # this below code is for null resource connection block private key
    publisher        = "Canonical"
    offer            = "0001-com-ubuntu-server-jammy"
    sku              = "22_04-lts-gen2"
    version          = "latest"
  }
}

# this below code is for null resource for triggers block, when ever it requires it will trigger the script
variable "app_script_version" {
  type    = string
  default = "0"
}
