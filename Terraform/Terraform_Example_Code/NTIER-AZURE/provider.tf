terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.67.0"
    }
  }
  # this is terraform version     
  required_version = ">=1.5.3"

/*  # this below code is for store the state file into s3 bucket
  backend "azurerm" {
    resource_group_name = "DefaultResourceGroup-EUS"
    storage_account_name = "lockingtesting"
    container_name = "lock"
    key = "ntier-azure/terraform"
    
  } */

}

provider "azurerm" {
  features {
  }
}
