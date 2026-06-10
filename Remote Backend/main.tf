resource "azurerm_resource_group" "example-rg"{
    name = "example-rg"
    location= "centralindia"
}
resource "azurerm_storage_account" "example-account"{
    name ="mystoragelink012345"
    resource_group_name = "example-rg"
    location = "centralindia"
    account_tier = "Standard"
    account_replication_type = "GRS"
}
resource "azurerm_storage_container" "statefile"{
    name ="statefile"
    storage_account_id = "/subscriptions/4b90405d-d1a2-4204-9f53-3ecf881a4785/resourceGroups/example-rg/providers/Microsoft.Storage/storageAccounts/mystoragelink012345"
    container_access_type ="private"
}