
/*
resource "azurerm_virtual_network" "ntier-vnet" {
  name                = "ntier-vnet"
  location            = "eastus"
  resource_group_name = "ntier-vnet"
  address_space       = ["10.10.0.0/16"]
  # explicityly denpendency
  # this below dependencies code is to create resource_group before creating virtual network
  depends_on = [azurerm_resource_group.ntier]

}
*/

# implicity denpendency 
# this below dependency code is instead of providing the 
# name,location and resource_group_name in resource_virtual_network block we are calling the details of mentioned from early created resource group from main.tf file. 

/*
resource azurerm_virtual_network "ntier-vnet" {
    name = azurerm_resource_group.ntier.name
    location = azurerm_resource_group.ntier.location
    resource_group_name = azurerm_resource_group.ntier.name
    address_space       = ["10.10.0.0/16"]
}
*/

# this below code is calling the values from input.tf file
resource "azurerm_virtual_network" "ntier-vnet" {
  name                = "ntier-vnet"
  location            = azurerm_resource_group.ntier.location
  resource_group_name = azurerm_resource_group.ntier.name
  address_space       = [var.address_space]
}


/* # this below code is for individual subnets creation with calling input.tf file
resource "azurerm_subnet" "subnets" {
    name = ""
    resource_group_name = azurerm_resource_group.ntier
    virtual_network_name = azurerm_virtual_network.ntier-vnet
    address_prefixes = var.subnet_address_prefixes
  
} */

# this below code is to create 3 subnets at a time using count and length
resource "azurerm_subnet" "subnets" {
  # to create multiple subnet at a time using length fucntion
  count                = length(var.subnet_names)
  resource_group_name  = azurerm_resource_group.ntier.name
  virtual_network_name = azurerm_virtual_network.ntier-vnet.name
  # to get the address prefix based on count from variable subnet_address_prefixes
  # address_prefixes = [var.subnet_address_prefixes[count.index]]
  # here below code we are using cidrsubnet function to call variable address_space to create multiple subnets 
  address_prefixes = [cidrsubnet(var.address_space, 8, count.index)]
  # to get the subnet names based on count from variable subnet_names
  name = var.subnet_names[count.index]

  depends_on = [azurerm_resource_group.ntier, azurerm_virtual_network.ntier-vnet]

}


#  here below code is to create network security group without any variable calling or dependency
/* resource "azurerm_network_security_group" "webnsg" {
  name                = "web"
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location

  depends_on = [azurerm_resource_group.ntier]
} */

# here this below is for web security group creaton and also it will call the dev.tfvars as dependency 
resource "azurerm_network_security_group" "webnsg" {
  name                = var.web_nsg_name.name
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location

  depends_on = [azurerm_resource_group.ntier]

}

# this below code is using all variables and dependencies for web
resource "azurerm_network_security_rule" "rules" {
  count                       = length(var.web_nsg_name.rules)
  resource_group_name         = azurerm_resource_group.ntier.name
  network_security_group_name = azurerm_network_security_group.webnsg.name
  name                        = var.web_nsg_name.rules[count.index].name
  protocol                    = var.web_nsg_name.rules[count.index].protocol
  source_address_prefix       = var.web_nsg_name.rules[count.index].source_address_prefix
  source_port_range           = var.web_nsg_name.rules[count.index].source_port_range
  destination_port_range      = var.web_nsg_name.rules[count.index].destination_port_range
  direction                   = var.web_nsg_name.rules[count.index].direction
  priority                    = var.web_nsg_name.rules[count.index].priority
  access                      = var.web_nsg_name.rules[count.index].access
  destination_address_prefix  = var.web_nsg_name.rules[count.index].destination_address_prefix

  depends_on = [azurerm_network_security_group.webnsg]
}





/* # network security group inbound rules for http indidual
resource "azurerm_network_security_rule" "webnsgrules_http" {
  name                        = "openhttpd"
  resource_group_name         = azurerm_resource_group.ntier.name
  web_nsg_name = azurerm_network_security_group.webnsg.name
  protocol                    = "Tcp"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_port_range      = "80"
  direction                   = "Inbound"
  priority                    = 300
  access                      = "Allow"
}
 */
/* # network security group inbound rules for ssh indidual 
resource "azurerm_network_security_rule" "webnsgrules_ssh" {
  name                        = "openssh"
  resource_group_name         = azurerm_resource_group.ntier.name
  network_security_group_name = azurerm_network_security_group.webnsg.name
  protocol                    = "Tcp"
  source_address_prefix       = "*"
  source_port_range           = "*"
  destination_port_range      = "22"
  direction                   = "Inbound"
  priority                    = 310
  access                      = "Allow"
} */


# here this below is for app security group creaton and also it will call the dev.tfvars as dependency 
resource "azurerm_network_security_group" "appnsg" {
  name                = var.app_nsg_name.name
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location

  depends_on = [azurerm_resource_group.ntier]

}

# this below code is using all variables and dependencies for app security rules
resource "azurerm_network_security_rule" "appnsgrules" {
  count                       = length(var.app_nsg_name.rules)
  resource_group_name         = azurerm_resource_group.ntier.name
  network_security_group_name = azurerm_network_security_group.appnsg.name
  name                        = var.app_nsg_name.rules[count.index].name
  protocol                    = var.app_nsg_name.rules[count.index].protocol
  source_address_prefix       = var.app_nsg_name.rules[count.index].source_address_prefix
  source_port_range           = var.app_nsg_name.rules[count.index].source_port_range
  destination_port_range      = var.app_nsg_name.rules[count.index].destination_port_range
  direction                   = var.app_nsg_name.rules[count.index].direction
  priority                    = var.app_nsg_name.rules[count.index].priority
  access                      = var.app_nsg_name.rules[count.index].access
  destination_address_prefix  = var.app_nsg_name.rules[count.index].destination_address_prefix

  depends_on = [azurerm_network_security_group.appnsg]
}