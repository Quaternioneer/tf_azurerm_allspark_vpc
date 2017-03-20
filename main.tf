# Resource Groups
resource "azurerm_resource_group" "allspark" {
  name     = "${var.allspark_name}"
  location = "${var.azurerm_location}"
}
