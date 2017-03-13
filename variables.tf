variable "azurerm_location" {
  description = "azurerm_location"
  default     = "UK West"
}

variable "allspark_ssh_dir" {
  description = "Output path of generated ssh keys"
  default = "~/"
}

variable "allspark_admin_name" {
  description = "Name of the admin resource group, used for DevOps tools"
  default     = "allsparkadmin"
}

variable "allspark_dev_name" {
  description = "Name of the dev resource group, used for hosting the development environment"
  default     = "allsparkdev"
}

variable "allspark_prod_name" {
  description = "Name of the prod resource group, used for hosting the production environment"
  default     = "allsparkprod"
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
