output "allspark_data" {
  value = {
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
    ssh_public = "${file(join("", [path.cwd, var.ssh_dir, "/allspark.rsa.pub"]))}"
    identity_file = "${path.cwd}${var.ssh_dir}/allspark.rsa"

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

    bastion_ip = "${module.bastion.public_ip}"
    bastion_private_ip = "${element(split(",", module.bastion.private_ip),0)}"
    bastion_username = "${var.bastion_username}"
  }
}
