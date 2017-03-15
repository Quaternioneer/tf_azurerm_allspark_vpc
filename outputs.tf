output "admin_data" {
  value = {
    location = "${azurerm_resource_group.admin.location}"
    resource_group_name = "${azurerm_resource_group.admin.name}"
    storage_account_name = "${azurerm_storage_account.admin.name}"
    storage_account_endpoint = "${azurerm_storage_account.admin.primary_blob_endpoint}"
    storage_container_name = "${azurerm_storage_container.admin.name}"
    subnet_name = "${azurerm_subnet.admin_subnet.name}"
    subnet_id = "${azurerm_subnet.admin_subnet.id}"
    ssh_public = "${tls_private_key.admin_ssh.public_key_openssh}"
  }
}

output "dev_data" {
  value = {
    location = "${azurerm_resource_group.dev.location}"
    resource_group_name = "${azurerm_resource_group.dev.name}"
    storage_account_name = "${azurerm_storage_account.dev.name}"
    storage_account_endpoint = "${azurerm_storage_account.dev.primary_blob_endpoint}"
    storage_container_name = "${azurerm_storage_container.dev.name}"
    subnet_name = "${azurerm_subnet.dev_subnet.name}"
    subnet_id = "${azurerm_subnet.dev_subnet.id}"
    ssh_public = "${tls_private_key.admin_ssh.public_key_openssh}"
  }
}

output "prod_data" {
  value = {
    location = "${azurerm_resource_group.prod.location}"
    resource_group_name = "${azurerm_resource_group.prod.name}"
    storage_account_name = "${azurerm_storage_account.prod.name}"
    storage_account_endpoint = "${azurerm_storage_account.prod.primary_blob_endpoint}"
    storage_container_name = "${azurerm_storage_container.prod.name}"
    subnet_name = "${azurerm_subnet.prod_subnet.name}"
    subnet_id = "${azurerm_subnet.prod_subnet.id}"
    ssh_public = "${tls_private_key.admin_ssh.public_key_openssh}"
  }
}
