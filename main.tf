provider "azurerm" {
  subscription_id = "${var.azurerm_subscription_id}"
  client_id       = "${var.azurerm_client_id}"
  client_secret   = "${var.azurerm_client_secret}"
  tenant_id       = "${var.azurerm_tenant_id}"
}


# Resource Groups

resource "azurerm_resource_group" "net" {
  name     = "networking"
  location = "${var.azurerm_location}"
}

resource "azurerm_resource_group" "dev" {
  name     = "${var.allspark_dev_name}"
  location = "${var.azurerm_location}"
}

resource "azurerm_resource_group" "prod" {
  name     = "${var.allspark_prod_name}"
  location = "${var.azurerm_location}"
}

resource "azurerm_resource_group" "admin" {
  name     = "${var.allspark_admin_name}"
  location = "${var.azurerm_location}"
}
