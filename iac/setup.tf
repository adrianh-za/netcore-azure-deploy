terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.7.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "f1-iac-rg"
    storage_account_name = "f1iacfiles"
    container_name       = "terraform"
    key                  = "terraform.state"
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}