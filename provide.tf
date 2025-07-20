terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.25.0"
    }
  }
}

provider "azurerm" {
  features {}
 
  subscription_id = "4666927b-089e-4cfc-8592-146c2e04657e"
 
}
