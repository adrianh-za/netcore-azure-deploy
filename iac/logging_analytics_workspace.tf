resource "azurerm_log_analytics_workspace" "formula-one" {
  location            = azurerm_resource_group.formula-one.location
  name                = "f1law${var.env_id}"
  resource_group_name = azurerm_resource_group.formula-one.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}