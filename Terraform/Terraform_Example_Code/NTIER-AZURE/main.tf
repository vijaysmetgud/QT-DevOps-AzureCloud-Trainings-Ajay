/*
resource "azurerm_resource_group" "ntier" {
  name     = "ntier-vnet"
  location = "eastus"

}
*/

# this below code is calling the values from variable.tf file
resource "azurerm_resource_group" "ntier" {
  name     = var.resource_group_name
  location = var.location

}


/* added new file called variable so assigned the values in the variable please look the file called variable.tf
for reaource group name and location it is calling from varibale that is means below code
below this example for calling the variable
only 2 example of variable calling is shown since we have 3 variable
name and loaction, 
address_space - not called or not shown here  */


/*
resource "azurerm_resource_group" "ntier" {
   name = var.resource_group_name
  location = var.location
  
}
*/



