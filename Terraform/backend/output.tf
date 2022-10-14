output "resource_group_name" {
  value = azurerm_resource_group.resource_group.name
  description = "Name of the resource group"
}

output "cosmosdb_acc_name" {
  value = azurerm_cosmosdb_account.cosmosdb_acc_name.name
  description = "The name of the account cosmos db"
}

output "cosmosdb_name" {
  value = azurerm_cosmosdb_sql_container.cosmosdb_container.name
  description = "The name of the cosmos db"
}

output "function_app_name" {
  value = azurerm_function_app.fn_app.name
  description = "Name of the resource group"
}

output "function_app_id" {
  value = azurerm_function_app.fn_app.id
  description = "Id of the function app"
}