output "allspark_data" {

  value = {

    common = {
      location = "${var.azurerm_location}"
      resource_group_name = "${azurerm_resource_group.allspark.name}"
      storage_account_name = "${azurerm_storage_account.allspark.name}"
      storage_account_endpoint = "${azurerm_storage_account.allspark.primary_blob_endpoint}"
      ssh_public = "${tls_private_key.ssh.public_key_openssh}"
    }

    admin = {
        storage_container_name = "${azurerm_storage_container.admin.name}"
        subnet_name = "${azurerm_subnet.admin_subnet.name}"
        subnet_id = "${azurerm_subnet.admin_subnet.id}"
    }
    dev = {
        storage_container_name = "${azurerm_storage_container.dev.name}"
        subnet_name = "${azurerm_subnet.dev_subnet.name}"
        subnet_id = "${azurerm_subnet.dev_subnet.id}"
    }
    prod = {
        storage_container_name = "${azurerm_storage_container.prod.name}"
        subnet_name = "${azurerm_subnet.prod_subnet.name}"
        subnet_id = "${azurerm_subnet.prod_subnet.id}"
    }
  }
}
