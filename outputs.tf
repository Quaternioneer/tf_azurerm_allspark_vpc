output "allspark_data" {
  value = {
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
    ssh_public = "${file(format("%s%s%s", path.cwd, var.ssh_dir, "/allspark.rsa.pub"))}"
    identity_file = "${path.cwd}${var.ssh_dir}/allspark.rsa"

    # Network Settings
    subnet_index = "${join(",", var.subnet_names)}"
    subnet_name = "${join(",", azurerm_subnet.subnet.*.name)}"
    subnet_id = "${join(",", azurerm_subnet.subnet.*.id)}"

    # Firewall Group - Configure rules externally
    nsg_name = "${join(",", azurerm_network_security_group.nsg.*.name)}"
    nsg_id = "${join(",", azurerm_network_security_group.nsg.*.id)}"

    # Bastion
    bastion_ip = "${azurerm_public_ip.bastion_ip.ip_address}"
    bastion_private_ip = "${azurerm_network_interface.bastion_private_nic.private_ip_address}"
    bastion_username = "${var.bastion_config["username"]}"

    vnet_name = "${azurerm_virtual_network.vnet.name}"
    vnet_id = "$(azurerm_virtual_network.vnet.id}"
  }
}
