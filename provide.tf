terraform {
 required_version = ">= 1.3.0" # or whatever version you're using
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
