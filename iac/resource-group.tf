resource "azurerm_resource_group" "formula-one" {
  location = "UK South"
  name     = "f1-rg"

  tags = {
    environment = var.env_id,
    src         = var.infra_src
  }
}