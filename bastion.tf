resource "azurerm_public_ip" "bastion_ip" {
  name                         = "bastion_ip"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.resource_group.name}"
  public_ip_address_allocation = "dynamic"
}

resource "azurerm_network_interface" "public_nic" {
    name = "bastion_nic1"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"

    ip_configuration {
        name = "bastion_ip"
        subnet_id = "${azurerm_subnet.bastion.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id = "${azurerm_public_ip.bastion_ip.id}"
    }
}

resource "azurerm_virtual_machine" "bastion" {
    name = "bastion"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
    network_interface_ids = ["${azurerm_network_interface.public_nic.id}"]
    vm_size = "Standard_D2_v2"

    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "16.04-LTS"
        version = "latest"
    }

    storage_os_disk {
        name = "${var.name}_os"
        vhd_uri = "${azurerm_storage_account.storage.primary_blob_endpoint}${azurerm_storage_container.bastion.name}/bastion_os_disk.vhd"
        caching = "ReadWrite"
        create_option = "FromImage"
    }

    os_profile {
        computer_name = "${var.name}_bastion"
        admin_username = "${var.bastion_username}"
        admin_password = "${var.bastion_password}"
    }

    os_profile_linux_config {
        disable_password_authentication = true

        ssh_keys {
          path = "/home/${var.bastion_username}/.ssh/authorized_keys"
          key_data = "${tls_private_key.ssh.public_key_openssh}"
        }
    }

    tags {
        environment = "${azurerm_resource_group.resource_group.name}"
        role = "bastion"
        os = "UbuntuServer-16.04-LTS"
        ssh_user = "${var.bastion_username}"
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
    destination_address_prefix  = "${azurerm_public_ip.bastion_ip.ip_address}"
    resource_group_name         = "${azurerm_resource_group.resource_group.name}"
    network_security_group_name = "${azurerm_network_security_group.nsg.name}"
}
