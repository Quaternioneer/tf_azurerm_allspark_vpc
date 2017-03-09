
resource "azurerm_storage_account" "dev" {
  name                = "${var.allspark_dev_name}sa"
  resource_group_name = "${azurerm_resource_group.dev.name}"
  location            = "${var.azurerm_location}"
  account_type        = "Standard_LRS"

  tags {
    environment = "development"
  }
}

resource "azurerm_storage_container" "dev" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.dev.name}"
  storage_account_name  = "${azurerm_storage_account.dev.name}"
  container_access_type = "private"
}


resource "azurerm_storage_account" "prod" {
  name                = "${var.allspark_prod_name}sa"
  resource_group_name = "${azurerm_resource_group.prod.name}"
  location            = "${var.azurerm_location}"
  account_type        = "Standard_LRS"

  tags {
    environment = "production"
  }
}

resource "azurerm_storage_container" "prod" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.prod.name}"
  storage_account_name  = "${azurerm_storage_account.prod.name}"
  container_access_type = "private"
}


resource "azurerm_storage_account" "admin" {
  name                = "${var.allspark_admin_name}sa"
  resource_group_name = "${azurerm_resource_group.admin.name}"
  location            = "${var.azurerm_location}"
  account_type        = "Standard_LRS"

  tags {
    environment = "admin"
  }
}

resource "azurerm_storage_container" "admin" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.admin.name}"
  storage_account_name  = "${azurerm_storage_account.admin.name}"
  container_access_type = "private"
}
