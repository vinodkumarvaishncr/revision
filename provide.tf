terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.38.1"
    }
  }
 
 backend "azurerm" {
      resource_group_name  = "vinod-main"
      storage_account_name = "vinodmainstorage"
      container_name       = "vinodconatiner"
      key                  = "vinodkey.tfstate"
  }

}

# Configure the Microsoft Azure Provider444rty322 
provider "azurerm" {
  subscription_id = "96a3eaff-d4cf-4222-9fe7-1622ab46f13e"
  features {}
  
}