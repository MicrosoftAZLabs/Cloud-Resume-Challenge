resource "azurerm_resource_group" "rg" {
  name  = var.rg-name
  location = var.location
  tags = {
    Purpose = "Personal Cloud Space"
  }
}

resource "azurerm_storage_account" "blog_storage" {
  name                = var.storage-account-name
  resource_group_name = azurerm_resource_group.rg.name
 
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind

  static_website {
    index_document     = var.index_document
    error_404_document = var.error_document
  }

  tags = {
    environment = "production"
    purpose     = "blog"
  }
}