resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}_vnet"
  address_space       = ["${formatlist("%s/16", var.subnets)}"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
}

resource "azurerm_subnet" "subnet" {
  count                = "${length(var.subnets)}"
  name                 = "${var.name}_subnet${element(var.subnet_names,count.index)}"
  resource_group_name  = "${azurerm_resource_group.resource_group.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${lookup(var.subnets, count.index)}/24"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.name}_nsg"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
}
