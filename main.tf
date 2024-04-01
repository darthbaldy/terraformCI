terraform {
  required_version = "~>1.7.3"
  required_providers {
    azurerm = {
      "source" = "hashicorp/azurerm"
      version  = ">=3.43.0"
    }
  }

  cloud {
    organization = "james_cloud"

    workspaces {
      name = "TerrafomCL"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true

}

resource "azurerm_resource_group" "rg" {
  name     = "1-d109fc4d-playground-sandbox"
  location = "East US"
}

resource "azurerm_storage_account" "storageaccount" {
  name                     = "5525jamesisalegend"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}
