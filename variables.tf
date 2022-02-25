variable "name" {
  description = "Name of the admin resource group, used for DevOps tools"
}

variable "ssh_dir" {
  description = "Output path of generated ssh keys"
  default     = "../ssh"
}

variable "location" {
  description = "azurerm_location"
  default     = "UK West"
}

variable "project" {
  description = "project"
  default     = "allspark"
}

variable "environment" {
  description = "environment"
  default     = "dev"
}

variable "subnets" {
  description = "Address spaces"
  default     = ["10.10.0.0"]
}

variable "subnet_names" {
  description = "Address spaces"
  default     = ["admin"]
}

variable "bastion_enabled" {
  description = "Set to one to expose the bastion"
  default     = "0"
}

variable "bastion_config" {
  description = ""
  type = map
  default = {
     username = ""
     password = ""
  }
}
