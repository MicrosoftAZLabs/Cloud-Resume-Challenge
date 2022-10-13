provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "CloudResumeChallenge1234"
  location = "eastus"
  tags = {
    Purpose = "Personal Cloud Space"
  }
}

resource "azurerm_storage_account" "blog_storage" {
  name                     = "resumechallengeaz1234"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  static_website {
    index_document     = "index.html"
    error_404_document = "404.html"
  }

  tags = {
    environment = "production"
    purpose     = "blog"
  }
}