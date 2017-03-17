
resource "azurerm_storage_account" "allspark" {
  name                = "${var.allspark_name}sa"
  resource_group_name = "${azurerm_resource_group.allspark.name}"
  location            = "${var.azurerm_location}"
  account_type        = "Standard_LRS"

  tags {
  }
}

resource "azurerm_storage_container" "admin" {
  name                  = "admin_vhds"
  resource_group_name   = "${azurerm_resource_group.allspark.name}"
  storage_account_name  = "${azurerm_storage_account.allspark.name}"
  container_access_type = "private"
}

resource "azurerm_storage_container" "dev" {
  name                  = "dev_vhds"
  resource_group_name   = "${azurerm_resource_group.allspark.name}"
  storage_account_name  = "${azurerm_storage_account.allspark.name}"
  container_access_type = "private"
}

resource "azurerm_storage_container" "prod" {
  name                  = "prod_vhds"
  resource_group_name   = "${azurerm_resource_group.allspark.name}"
  storage_account_name  = "${azurerm_storage_account.allspark.name}"
  container_access_type = "private"
}
