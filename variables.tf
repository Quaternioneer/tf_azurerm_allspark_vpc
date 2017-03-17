variable "azurerm_location" {
  description = "azurerm_location"
  default     = "UK West"
}

variable "allspark_ssh_dir" {
  description = "Output path of generated ssh keys"
  default = "/ssh"
}

variable "allspark_name" {
  description = "Name of the admin resource group, used for DevOps tools"
  default     = "allspark"
}

variable "allspark_admin_address_space" {
  description = "Address space for the production environment"
  default     = "172.10.0.0"
}

variable "allspark_dev_address_space" {
  description = "Address space for the development environment"
  default     = "172.11.0.0"
}

variable "allspark_prod_address_space" {
  description = "Address space for the production environment"
  default     = "172.12.0.0"
}
