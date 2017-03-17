# Resource Groups
resource "azurerm_resource_group" "allspark" {
  name     = "Default Resource Group"
  location = "${var.azurerm_location}"
}
