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

variable "subnets" {
  description = "Address spaces"
  default     = ["172.10.0.0", "172.11.0.0", "172.12.0.0"]
}

variable "subnet_names" {
  description = "Address spaces"
  default     = ["admin", "dev", "prod"]
}
