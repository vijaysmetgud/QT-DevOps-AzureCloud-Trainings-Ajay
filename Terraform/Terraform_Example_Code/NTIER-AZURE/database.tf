/* # this below code is to created sql server with raw hardcoded
resource "azurerm_mssql_server" "dbserver" {
  name                          = "mssql-server"
  location                      = azurerm_resource_group.ntier.location
  resource_group_name           = azurerm_resource_group.ntier.name
  version                       = "12.0"
  administrator_login           = "dell"
  administrator_login_password  = "dell@123"
  public_network_access_enabled = true
}


# this below code is to create for sql database with raw harcoded
resource "azurerm_mssql_database" "sqldb" {
  name        = "mssql-db"
  server_id   = azurerm_mssql_server.dbserver.id
  max_size_gb = 2
  sku_name    = "Basic"

}*/


/* # this below code is to created sql server with variable calling db_info
resource "azurerm_mssql_server" "dbserver" {
  name                          = var.db_info.server_name
  location                      = azurerm_resource_group.ntier.location
  resource_group_name           = azurerm_resource_group.ntier.name
  version                       = var.db_info.server_version
  administrator_login           = var.db_info.user_login
  administrator_login_password  = var.db_info.user_password
  public_network_access_enabled = var.db_info.public_network_access_enabled

  depends_on = [azurerm_resource_group.ntier]
}


# this below code is to create for sql database with variable calling db_info 
resource "azurerm_mssql_database" "sqldb" {
  name        = var.db_info.db_name
  server_id   = azurerm_mssql_server.dbserver.id
  max_size_gb = var.db_info.max_size_gb
  sku_name    = var.db_info.sku_name

  depends_on = [azurerm_mssql_server.dbserver]

} */