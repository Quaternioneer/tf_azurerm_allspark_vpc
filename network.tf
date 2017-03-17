resource "azurerm_virtual_network" "vnet" {
  name                = "allspark_vnet"
  address_space       = ["${var.allspark_admin_address_space}/16", "${var.allspark_dev_address_space}/16", "${var.allspark_prod_address_space}/16"]
  location            = "${var.azurerm_location}"
  resource_group_name = "${azurerm_resource_group.allspark.name}"
}

resource "azurerm_subnet" "admin_subnet" {
  name                 = "${var.allspark_name}_admin_sub"
  resource_group_name  = "${azurerm_resource_group.allspark.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${var.allspark_admin_address_space}/24"
}

resource "azurerm_subnet" "dev_subnet" {
  name                 = "${var.allspark_name}_dev_sub"
  resource_group_name  = "${azurerm_resource_group.allspark.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${var.allspark_dev_address_space}/24"
}

resource "azurerm_subnet" "prod_subnet" {
  name                 = "${var.allspark_name}_prod_sub"
  resource_group_name  = "${azurerm_resource_group.allspark.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${var.allspark_prod_address_space}/24"
}
