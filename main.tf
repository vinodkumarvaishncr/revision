#resource "azurerm_resource_group" "rg" {
#count = length(var.resource_group_names)
#for_each = toset(var.rg_names)
#    for_each =  var.rg_names 
#  name     =  each.key
#  location =  each.value
#}
/*
resource "azurerm_resource_group" "rg" {
   for_each =  var.rg_names 
  name     =  "rg_${each.key}"
  location =  each.value
}


resource "azurerm_storage_account" "sc" {
  
  name                     = "storage2vinod2"
  resource_group_name      = "vinod2_rg"
   
  location                 = "east us"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

*/

/*
# 🏗️ Create Resource Groups
resource "azurerm_resource_group" "rg" {
  for_each = var.resources_sc

  name     = each.key
  location = each.value.location
}

# 📦 Create Storage Accounts
resource "azurerm_storage_account" "storage" {
  for_each = var.resources_sc

  name                     = each.value.storage_name
  resource_group_name      = azurerm_resource_group.rg[each.key].name
  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
*/

# 🏗️ Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_map_one["rg_name"]
  location = var.resource_map_one["rg_location"]
}

# 📦 Create Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = var.resource_map_one["storage_name"]
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.resource_map_one["storage_loc"]
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "test"
  }
}