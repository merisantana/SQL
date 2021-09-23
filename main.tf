data "azurerm_resource_group" "RG" {
  name = var.resurce_group_name
}

resource "azurerm_sql_server" "sqlserver" {
  name                         = var.namesqlserver
  resource_group_name          = data.azurerm_resource_group.RG.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "usuario"
  administrator_login_password = "P4$$w0rdP4$$W0rd"

  tags = {
    environment = "production"
  }
}

resource "azurerm_sql_database" "sqldb" {
  name                = var.namesqldb
  resource_group_name = data.azurerm_resource_group.RG.name
  location            = var.location
  server_name         = azurerm_sql_server.sqlserver.name

}

