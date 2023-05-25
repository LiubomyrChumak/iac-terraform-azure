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

resource "azurerm_storage_container" "example_storage_container" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.example_storage_account.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "example_storage_blob" {
  name                   = var.blob_name
  storage_account_name   = azurerm_storage_account.example_storage_account.name
  storage_container_name = azurerm_storage_container.example_storage_container.name
  type                   = "Block"
  source_content         = "example-blob-content"
}

