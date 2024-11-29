
resource "azurerm_container_app_environment" "formula-one" {
  location                    = azurerm_resource_group.formula-one.location
  name                        = "f1env${var.env_id}"
  resource_group_name         = azurerm_resource_group.formula-one.name
  log_analytics_workspace_id  = azurerm_log_analytics_workspace.formula-one.id

  tags = {
    environment = var.env_id,
    src         = var.infra_src
  }
}

resource "azurerm_container_registry" "formula-one" {
  location                      = azurerm_resource_group.formula-one.location
  name                          = "f1reg${var.env_id}"
  resource_group_name           = azurerm_resource_group.formula-one.name
  sku                           = "Basic"
  admin_enabled                 = true
  public_network_access_enabled = true

  tags = {
    environment = var.env_id,
    src         = var.infra_src
  }
}
resource "azurerm_container_app" "formula-one" {
  container_app_environment_id  = azurerm_container_app_environment.formula-one.id
  name                          = "f1app${var.env_id}"
  resource_group_name           = azurerm_resource_group.formula-one.name
  revision_mode                 = "Multiple"

  template {
    min_replicas = 1
    max_replicas = 3

    container {
      cpu    = 0.25
      memory = "0.5Gi"
      name   = "f1api${var.env_id}"
      image  = "mcr.microsoft.com/k8se/quickstart:latest"
    }
  }

  ingress {
    allow_insecure_connections = false
    external_enabled = true
    target_port = 8080

    traffic_weight {
      percentage = 100
      label = "primary"
      latest_revision = true
    }
  }

  tags = {
    environment = var.env_id
    src         = var.infra_src
  }
}