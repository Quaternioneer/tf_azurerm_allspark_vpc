variable "name" {
  description = "Name of the admin resource group, used for DevOps tools"
}

variable "location" {
  description = "azurerm_location"
  default     = "UK West"
}

variable "ssh_dir" {
  description = "Output path of generated ssh keys"
  default = "/ssh"
}

variable "admin_address_space" {
  description = "Address space for the production environment"
  default     = "172.10.0.0"
}

variable "dev_address_space" {
  description = "Address space for the development environment"
  default     = "172.11.0.0"
}

variable "prod_address_space" {
  description = "Address space for the production environment"
  default     = "172.12.0.0"
}
