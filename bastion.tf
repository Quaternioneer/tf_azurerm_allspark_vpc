module "bastion" {
  source = "github.com/broomyocymru/tf_azurerm_allspark_vm"
  name = "${var.name}-bastion"
  username = "${var.bastion_username}"
  subnet = "${element(var.subnet_names,0)}"
  vm = "std_ubuntu_server"
  role = "bastion"
  password = "${var.bastion_password}"
  public_ip = 1

  allspark = {
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
    ssh_public = "${file(format("%s%s%s", path.cwd, var.ssh_dir, "/allspark.rsa.pub"))}"

    # Network Settings
    subnet_index = "${join(",", var.subnet_names)}"
    subnet_name = "${join(",", azurerm_subnet.subnet.*.name)}"
    subnet_id = "${join(",", azurerm_subnet.subnet.*.id)}"

    # Storage Details
    storage_container_name = "${join(",", azurerm_storage_container.storage.*.name)}"
    storage_account_name = "${azurerm_storage_account.storage.name}"
    storage_account_endpoint = "${azurerm_storage_account.storage.primary_blob_endpoint}"

    # Firewall Group - Configure rules externally
    nsg_name = "${azurerm_network_security_group.nsg.name}"
  }

  provisioner "local-exec" {
    command = "mkdir -p ${path.cwd}${var.ssh_dir}"
  }

  provisioner "local-exec" {
    command = "ssh-keygen -f ${path.cwd}${var.ssh_dir}/allspark.rsa -t rsa -N ''"
  }
}

resource "azurerm_network_security_rule" "bastion" {
    name                        = "ssh_bastion"
    priority                    = 100
    direction                   = "Inbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "22"
    source_address_prefix       = "Internet"
    destination_address_prefix  = "*"
    resource_group_name         = "${azurerm_resource_group.resource_group.name}"
    network_security_group_name = "${azurerm_network_security_group.nsg.name}"
}
