resource "azurerm_mssql_server"  "formula-one" {
  location                      = azurerm_resource_group.formula-one.location
  name                          = "f1sql${var.env_id}"
  resource_group_name           = azurerm_resource_group.formula-one.name
  version                       = "12.0"
  administrator_login           = var.sql_username
  administrator_login_password  = var.sql_password

  tags = {
    environment = var.env_id,
    src         = var.infra_src
  }
}

resource "azurerm_mssql_database" "formula-one" {
  name                    = "formulaone-db"
  server_id               = azurerm_mssql_server.formula-one.id
  collation               = "SQL_Latin1_General_CP1_CI_AS"
  license_type            = "LicenseIncluded"
  max_size_gb             = 1
  sku_name                = "S0"
  zone_redundant          = false

  lifecycle {
    prevent_destroy = false
  }

  tags = {
    environment = var.env_id,
    src         = var.infra_src
  }
}

resource "azurerm_mssql_firewall_rule" "formula-one" {
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
  name             = "all_azure"
  server_id        = azurerm_mssql_server.formula-one.id
}