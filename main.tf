# Resource Groups
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.name}"
  location = "${var.location}"

  tags {
    project = "${var.project}"
    environment = "${var.environment}"
  }
}
