# this we copied from dev.tfvars because we needs to apply and work with workspace so for demo did this 
resource_group_name = "hi-test"
location            = "eastus"
address_space       = "10.11.0.0/16"
# here below subnet/ipaddress i have added one extra to pass the dev.tfvars file for expirement to show
# no need below code since we are using cidr subnet function to call variable address_sapce to create mutiple subnets
# subnet_address_prefixes = ["10.10.0.0/24", "10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
subnet_names = ["web", "app", "db", "mgmt"]


# this below code for web security rule
web_nsg_name = {
  name = "webnsg"
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
    },

    {
      name                       = "openssh"
      priority                   = 310
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
  }]
} // web security rule


# this below code is app security rule
app_nsg_name = {
  name = "appnsg"
  rules = [{
    name                       = "open8080"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    },

    {
      name                       = "open5000"
      priority                   = 340
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "5000"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },

    {
      name                       = "open22"
      priority                   = 310
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
  }]
} //app security rule code 


# this below code is for mssql database and mssql server variable
db_info = {
  db_name                       = "ssql-server"
  server_name                   = "ntier-db"
  server_version                = "12.0"
  user_login                    = "dell"
  user_password                 = "Shadybruce@27"
  public_network_access_enabled = true
  max_size_gb                   = 2
  sku_name                      = "basic"

}


# this below code variable is for vm creation 
app_vm_config = {
  subnet_name = "app"
  size        = "Standard_B1s"
  username    = "Dell"
  keypath     = "~/.ssh/id_rsa.pub"
  private_key_path = "~/.ssh/id_rsa"
  publisher   = "Canonical"
  offer       = "0001-com-ubuntu-server-jammy"
  sku         = "22_04-lts-gen2"
  version     = "latest"
}
