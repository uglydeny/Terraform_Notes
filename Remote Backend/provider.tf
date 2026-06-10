terraform {
  required_providers {
    azurerm ={
        source ="hashicorp/azurerm"
    }
  }
  # backend "azurerm" {
  #   resource_group_name = "example-rg"
  #   storage_account_name = "mystoragelink012345"
  #   container_name = "statefile"
  #   key = "terraform.tfsate"  
  # }
}
provider "azurerm" {
    features {}
    subscription_id = "4b90405d-d1a2-4204-9f53-3ecf881a4785"
}