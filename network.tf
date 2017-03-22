resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}_vnet"
  address_space       = ["${var.admin_address_space}/16", "${var.dev_address_space}/16", "${var.prod_address_space}/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
}

resource "azurerm_subnet" "admin_subnet" {
  name                 = "${var.name}_admin_sub"
  resource_group_name  = "${azurerm_resource_group.resource_group.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${var.admin_address_space}/24"
}

resource "azurerm_subnet" "dev_subnet" {
  name                 = "${var.name}_dev_sub"
  resource_group_name  = "${azurerm_resource_group.resource_group.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${var.dev_address_space}/24"
}

resource "azurerm_subnet" "prod_subnet" {
  name                 = "${var.name}_prod_sub"
  resource_group_name  = "${azurerm_resource_group.resource_group.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${var.prod_address_space}/24"
}
