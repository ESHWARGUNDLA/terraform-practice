# Create Resource Group

resource "azurerm_resource_group" "main" {
  name     = "example-resources-tf"
  location = "East US"
}


# Create Virtual Network
resource "azurerm_virtual_network" "rg" {
  name                = "vnet-terraform-vm"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

}

# Create Subnet
resource "azurerm_subnet" "internal" {
  name                 = "subnet-internal"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.rg.name
  address_prefixes     = ["10.0.2.0/24"]
}


