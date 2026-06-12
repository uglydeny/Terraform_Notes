# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "centralindia"
}
# azurerm_resource_group.example  -----> state file 

# Create  a storage account 
resource "azurerm_storage_account" "example" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name     #implicit dependecy
  location                 = azurerm_resource_group.example.location #implicit dependeny
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  depends_on          = [azurerm_resource_group.example] #Explicit Dependency
  name                = "example-network"
  resource_group_name = "example-resources"
  location            = "centralindia"
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name  = azurerm_resource_group.example.name  #Implicit Dependency
  virtual_network_name = azurerm_virtual_network.example.name  #Implicit Dependency
  address_prefixes     = ["10.0.1.0/24"]
}
