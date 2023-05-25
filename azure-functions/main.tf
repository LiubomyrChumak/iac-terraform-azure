resource "azurerm_resource_group" "example_resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example_resource_group.name
  location                 = azurerm_resource_group.example_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_app_service_plan" "example_app_service_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.example_resource_group.location
  resource_group_name = azurerm_resource_group.example_resource_group.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_linux_function_app" "example_function_app" {
  name                      = var.function_app_name
  location                  = azurerm_resource_group.example_resource_group.location
  resource_group_name       = azurerm_resource_group.example_resource_group.name
  app_service_plan_id       = azurerm_app_service_plan.example_app_service_plan.id
  storage_account_name      = azurerm_storage_account.example_storage_account.name
  storage_account_access_key = azurerm_storage_account.example_storage_account.primary_access_key
}

resource "azurerm_function_app_function" "example_function" {
  name                       = var.function_name
  resource_group_name        = azurerm_resource_group.example_resource_group.name
  function_app_name          = azurerm_linux_function_app.example_function_app.name
  storage_connection_string = azurerm_storage_account.example_storage_account.primary_connection_string
  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME" = "python"
  }
}
