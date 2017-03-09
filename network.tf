resource "azurerm_virtual_network" "vnet" {
  name                = "allspark_vnet"
  address_space       = ["172.10.0.0/16", "172.11.0.0/16", "172.12.0.0/16"]
  location            = "${var.azurerm_location}"
  resource_group_name = "${azurerm_resource_group.net.name}"
}

resource "azurerm_subnet" "admin_subnet" {
  name                 = "${var.allspark_admin_name}_sub"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "172.10.0.0/24"
}

resource "azurerm_subnet" "dev_subnet" {
  name                 = "${var.allspark_dev_name}_sub"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "172.11.0.0/24"
}

resource "azurerm_subnet" "prod_subnet" {
  name                 = "${var.allspark_prod_name}_sub"
  resource_group_name  = "${azurerm_resource_group.net.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "172.12.0.0/24"
}
