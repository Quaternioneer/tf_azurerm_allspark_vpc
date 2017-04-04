
resource "azurerm_storage_account" "storage" {
  name                = "${var.name}storage"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  location            = "${var.location}"
  account_type        = "Standard_LRS"

  tags {
  }
}

resource "azurerm_storage_container" "storage" {
  count                 = "${length(var.subnets)}"
  name                  = "${var.name}-${element(var.subnet_names,count.index)}"
  resource_group_name   = "${azurerm_resource_group.resource_group.name}"
  storage_account_name  = "${azurerm_storage_account.storage.name}"
  container_access_type = "private"
}

resource "azurerm_storage_container" "bastion" {
  name                  = "bastion"
  resource_group_name   = "${azurerm_resource_group.resource_group.name}"
  storage_account_name  = "${azurerm_storage_account.storage.name}"
  container_access_type = "private"
}
