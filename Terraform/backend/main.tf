resource "azurerm_resource_group" "resource_group" {
  name  = var.rg-name
  location = var.location
}

resource "azurerm_cosmosdb_account" "cosmosdb_acc_name" {
  name                = var.cosmosdb_acc_name
  resource_group_name = var.rg-name
  location = var.location
  offer_type          = "Standard"
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
  geo_location {
    location          = "eastus"
    failover_priority = 1
  }

  geo_location {
    location          = "westus"
    failover_priority = 0
  }
}

resource "azurerm_cosmosdb_sql_database" "cosmosdb_name" {
  name                = var.cosmosdb_name
  resource_group_name = var.rg-name
  account_name        = azurerm_cosmosdb_account.cosmosdb_acc_name.name
}

resource "azurerm_cosmosdb_sql_container" "cosmosdb_container" {
  name                  = var.cosmosdb_container
  resource_group_name   = var.rg-name
  account_name          = azurerm_cosmosdb_account.cosmosdb_acc_name.name
  database_name         = azurerm_cosmosdb_sql_database.cosmosdb_name.name
  partition_key_path    = "/id"
  partition_key_version = 1


  indexing_policy {
    indexing_mode = "consistent"

    included_path {
      path = "/*"
    }

    included_path {
      path = "/included/?"
    }

    excluded_path {
      path = "/excluded/?"
    }
  }

  unique_key {
    paths = ["/definition/idlong", "/definition/idshort"]
  }
}

resource "azurerm_storage_account" "fn_storage_account" {
  name                     = var.fn_storage_account_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "fn_app_service_plan" {
  name                = var.fn_app_service_plan_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "fn_app" {
  name                       = var.function_app_name
  location                   = azurerm_resource_group.resource_group.location
  resource_group_name        = azurerm_resource_group.resource_group.name
  app_service_plan_id        = azurerm_app_service_plan.fn_app_service_plan.id
  storage_account_name       = azurerm_storage_account.fn_storage_account.name
  storage_account_access_key = azurerm_storage_account.fn_storage_account.primary_access_key

  app_settings = {
    FUNCTIONS_EXTENSION_VERSION = "~3"
    FUNCTIONS_WORKER_RUNTIME = "node"
    WEBSITE_CONTENTAZUREFILECONNECTIONSTRING    = "${azurerm_storage_account.fn_storage_account.primary_connection_string}"
    WEBSITE_CONTENTSHARE                        = "${azurerm_storage_account.fn_storage_account.name}"
    COSMOSDB_CONNECTION_STR = "${azurerm_cosmosdb_account.cosmosdb_acc_name.connection_strings[0]}"
  }

  depends_on = [azurerm_cosmosdb_sql_database.cosmosdb_name]
}