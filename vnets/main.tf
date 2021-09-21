From kushi to Everyone:  07:39 AM
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "472dd253-c14b-4a47-91af-37fa2a1e5d9f"
  client_id       = "83cd6202-2f47-45a8-b09d-3af9f5372fa7"
  client_secret   = "3OE7Q~gm8l1h~Ni2GNqbJP45m37Q2EzQ935Up"
  tenant_id       = "daa6723d-aafb-4d5d-8f4e-80245fcbddcc"
}

resource "azurerm_resource_group" "training" {
  name     = "trainingdev"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "trainingvnet" {
  name                = "trainingdevvnet"
  resource_group_name = azurerm_resource_group.training.name
  location            = azurerm_resource_group.training.location
  address_space       = ["10.0.0.0/16"]
}
