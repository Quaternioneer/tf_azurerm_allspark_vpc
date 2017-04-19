resource "azurerm_public_ip" "bastion_ip" {
  count                        = "${var.bastion_enabled}"
  name                         = "bastion_ip"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.resource_group.name}"
  public_ip_address_allocation = "static"
}

resource "azurerm_lb" "bastion_lb" {
  count               = "${var.bastion_enabled}"
  name                = "bastion_lb"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"

  frontend_ip_configuration {
    name                 = "bastion_ip_address"
    public_ip_address_id = "${azurerm_public_ip.bastion_ip.id}"
  }
}

resource "azurerm_lb_nat_rule" "bastion_nat" {
  count                          = "${var.bastion_enabled}"
  resource_group_name            = "${azurerm_resource_group.resource_group.name}"
  loadbalancer_id                = "${azurerm_lb.bastion_lb.id}"
  name                           = "ssh-access"
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "bastion_ip_address"
}

resource "azurerm_network_interface" "bastion_private_nic" {
    count = "${var.bastion_enabled}"
    name = "${var.name}-bastion-nic0"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"

    ip_configuration {
        name = "${var.name}-bastion-ip"
        subnet_id = "${azurerm_subnet.subnet.*.id[0]}"
        private_ip_address_allocation = "dynamic"
        load_balancer_inbound_nat_rules_ids = ["${azurerm_lb_nat_rule.bastion_nat.id}"]
    }
}

resource "azurerm_virtual_machine" "bastion" {
    count = "${var.bastion_enabled}"
    name = "${var.name}-bastion"
    location = "${var.location}"
    resource_group_name = "${azurerm_resource_group.resource_group.name}"
    network_interface_ids = ["${azurerm_network_interface.bastion_private_nic.id}"]
    vm_size = "Standard_D2_v2"

    storage_image_reference {
        publisher = "Canonical"
        offer = "UbuntuServer"
        sku = "16.04-LTS"
        version = "latest"
    }

    storage_os_disk {
        name = "${var.name}-bastion-os"
        caching = "ReadWrite"
        create_option = "FromImage"
        managed_disk_type = "Standard_LRS"
        disk_size_gb = "${lookup(var.bastion_config, "disk_size", "40")}"
    }

    os_profile {
        computer_name = "${var.name}-bastion"
        admin_username = "${var.bastion_config["username"]}"
        admin_password = "${var.bastion_config["password"]}"
    }

    os_profile_linux_config {
        disable_password_authentication = true

        ssh_keys {
          path = "/home/${var.bastion_config["username"]}/.ssh/authorized_keys"
          key_data = "${file(format("%s%s%s", path.cwd, var.ssh_dir, "/allspark.rsa.pub"))}"
        }
    }

    tags {
        environment = "${azurerm_resource_group.resource_group.name}"
        role = "bastion"
        os = "UbuntuServer-16.04-LTS"
        ssh_user = "${var.bastion_config["username"]}"
        ssh_ip = "${azurerm_network_interface.bastion_private_nic.private_ip_address}"
        remote_connection = "ssh"
        remote_port = "22"
    }
}

resource "azurerm_network_security_rule" "bastion" {
    count                       = "${var.bastion_enabled}"
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
    network_security_group_name = "${azurerm_network_security_group.nsg.*.name[0]}"
}
