
# this below code is for public ip 
resource "azurerm_public_ip" "app" {
  name                = "appipp"
  resource_group_name = azurerm_resource_group.ntier.name
  location            = azurerm_resource_group.ntier.location
  allocation_method   = "Static"

}

# this below code to get subnet id 
data "azurerm_subnet" "app" {
  name                 = var.app_vm_config.subnet_name
  virtual_network_name = azurerm_virtual_network.ntier-vnet.name
  resource_group_name  = azurerm_resource_group.ntier.name
  depends_on           = [azurerm_subnet.subnets]

}

# this below code is for network interface to connect request to public ip and route request to private ip
resource "azurerm_network_interface" "app" {
  name                = "appnic"
  location            = azurerm_resource_group.ntier.location
  resource_group_name = azurerm_resource_group.ntier.name
  ip_configuration {
    name                          = "appipconfig"
    subnet_id                     = data.azurerm_subnet.app.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.app.id
  }

  depends_on = [azurerm_subnet.subnets, azurerm_network_security_group.appnsg, azurerm_public_ip.app, data.azurerm_subnet.app]

}


resource "azurerm_network_interface_security_group_association" "appnsg" {
  network_interface_id      = azurerm_network_interface.app.id
  network_security_group_id = azurerm_network_security_group.appnsg.id

  depends_on = [azurerm_network_interface.app, azurerm_network_security_group.appnsg]
}



# this below code is for linux virtual machine with calling the variable app_vm_config 
resource "azurerm_linux_virtual_machine" "app" {

  name                = "app"
  location            = azurerm_resource_group.ntier.location
  resource_group_name = azurerm_resource_group.ntier.name
  size                = var.app_vm_config.size
  admin_username      = var.app_vm_config.username

  admin_ssh_key {
    username   = var.app_vm_config.username
    public_key = file(var.app_vm_config.keypath)
  }
  network_interface_ids = [azurerm_network_interface.app.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  # this below is for source image reference calling variable app_vm_config 
  source_image_reference {
    publisher = var.app_vm_config.publisher
    offer     = var.app_vm_config.offer
    sku       = var.app_vm_config.sku
    version   = var.app_vm_config.version
  }
}

# this below code is for null resource means it will not create any resource just it will use only for execute provisioner
  resource "null_resource" "script_executor" {
    provisioner "remote-exec" {
      inline = [
        "sudo apt update",
        "sudo apt install openjdk-11-jdk -y",
        "cd /tmp && wget https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/spring-petclinic-2.4.2.jar",
        "java -jar /tmp/spring-petclinic-2.4.2.jar &",
        "sleep 30s"
      ]
    }

    connection {
      type        = "ssh"
      user        = var.app_vm_config.username
      private_key = file(var.app_vm_config.private_key_path)
      host        = azurerm_linux_virtual_machine.app.public_ip_address
    }

    triggers = {
      app_script_version = var.app_script_version
    }
    depends_on = [azurerm_linux_virtual_machine.app]
  }



/* # this below code is for source image reference raw not calling any variable 
  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
 */


