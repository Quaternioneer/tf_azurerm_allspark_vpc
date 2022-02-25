resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}_vnet"
  address_space       = "${formatlist("%s/16", var.subnets)}"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"

 # provisioner "local-exec" {
  #  command = "mkdir -p ${var.ssh_dir}"
  #}

  #provisioner "local-exec" {
  #  command = "if [ ! -f '${var.ssh_dir}/allspark.rsa' ]; then ssh-keygen -f '${var.ssh_dir}/allspark.rsa' -t rsa -N ''; fi"
  #}

  tags = {
    project = "${var.project}"
    environment = "${var.environment}"
  }
}

resource "azurerm_network_security_group" "nsg" {
  count               = "${length(var.subnets)}"
  name                = "${var.name}_${element(var.subnet_names,count.index)}_nsg"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"

  tags = {
    project = "${var.project}"
    environment = "${var.environment}"
  }
}

resource "azurerm_subnet" "subnet" {
  count                = "${length(var.subnets)}"
  name                 = "${var.name}_${element(var.subnet_names,count.index)}_subnet"
  resource_group_name  = "${azurerm_resource_group.resource_group.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefixes     = ["${element(var.subnets, count.index)}/24"]
}

resource "azurerm_subnet_network_security_group_association" "nsg-subnet" {
  count                = "${length(var.subnets)}"
  subnet_id	       = "${azurerm_subnet.subnet[count.index].id}"
  network_security_group_id = "${azurerm_network_security_group.nsg.*.id[count.index]}"
}
