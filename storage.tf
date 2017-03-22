
resource "azurerm_storage_account" "storage" {
  name                = "${var.name}storage"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  location            = "${var.location}"
  account_type        = "Standard_LRS"

  tags {
  }
}

resource "azurerm_storage_container" "admin" {
  name                  = "admin"
  resource_group_name   = "${azurerm_resource_group.resource_group.name}"
  storage_account_name  = "${azurerm_storage_account.storage.name}"
  container_access_type = "private"
}

resource "azurerm_storage_container" "dev" {
  name                  = "dev"
  resource_group_name   = "${azurerm_resource_group.resource_group.name}"
  storage_account_name  = "${azurerm_storage_account.storage.name}"
  container_access_type = "private"
}

resource "azurerm_storage_container" "prod" {
  name                  = "prod"
  resource_group_name   = "${azurerm_resource_group.resource_group.name}"
  storage_account_name  = "${azurerm_storage_account.storage.name}"
  container_access_type = "private"
}
