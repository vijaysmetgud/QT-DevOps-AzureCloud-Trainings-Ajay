

# Example of below is for resource group and resource called storage account creation in Azure

provider "azurerm" {
  features { 
  }

}

resource "azurerm_resource_group" "myresg"{
  name     = "fromtf"
  location = "eastus"
}

resource "azurerm_storage_account" "first" {
  name                     = "fromtffortf"
  resource_group_name      = "fromtf"
  location                 = "eastus"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  //explicity dependencies example 
  depends_on = [ azurerm_resource_group.myresg ] 
}

// implicity denpencies examples: 
/* 
resource "azurerm_storage_account" "first" {
  name                     = "fromtffortf"
  resource_group_name  = azurerm_resource_group.myresg.name 
  location = azurerm_resource_group.myresg.location"
  account_tier             = "Standard"
  account_replication_type = "GRS"
} 
*/





