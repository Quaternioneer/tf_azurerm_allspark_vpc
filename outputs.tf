output "allspark_data" {
  value = {
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
#    ssh_public = "${file(format("%s%s", var.ssh_dir, "/allspark.rsa.pub"))}"
    identity_file = "${var.ssh_dir}/allspark.rsa"

    # Network Settings
    subnet_index = "${join(",", var.subnet_names)}"
    subnet_name = "${join(",", azurerm_subnet.subnet.*.name)}"
    subnet_id = "${join(",", azurerm_subnet.subnet.*.id)}"

    # Firewall Group - Configure rules externally
    nsg_name = "${join(",", azurerm_network_security_group.nsg.*.name)}"
    nsg_id = "${join(",", azurerm_network_security_group.nsg.*.id)}"

    vnet_name = "${azurerm_virtual_network.vnet.name}"
    vnet_id = "${azurerm_virtual_network.vnet.id}"

    tag_proj = "${var.project}"
    tag_env = "${var.environment}"
  }
}

output "bastion_data" {
  value = {
    bastion_ip = "${azurerm_public_ip.bastion_ip.ip_address}"
    bastion_private_ip = "${azurerm_network_interface.bastion_private_nic.private_ip_address}"
    bastion_username = "${var.bastion_config["username"]}"
    identity_file = "${var.ssh_dir}/allspark.rsa"
  }
}
