resource "azurerm_resource_group" "rg2" {
  name     = "vinod-rg-test2"
  location = "central india"
  tags = {
      Environment = "dev"
      Owner       = "vinod"
    }
}
