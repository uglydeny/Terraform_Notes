terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}
resource "azurerm_resource_group" "example1" {
  name     = "example-resources1"
  location = "West Europe"
}
resource "azurerm_resource_group" "example2" {
  name     = "example-resources2"
  location = "West Europe"
}
resource "azurerm_resource_group" "example3" {
  name     = "example-resources3"
  location = "West Europe"
}
resource "azurerm_resource_group" "example4" {
  name     = "example-resources4"
  location = "West Europe"
}