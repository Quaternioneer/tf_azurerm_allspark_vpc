provider "azurerm" {
  features {
    
  }
}

#Resource Groups
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.name}"
  location = "${var.location}"

  tags = {
    project = "${var.project}"
    environment = "${var.environment}"
  }
}

module "allspark" {
  source  = "github.com/broomyocymru/tf_azurerm_allspark_sql_always_on"
  allspark = "${module.allspark.allspark_data}"
  server_name = "allspark"
  admin_username = "adminusersql"
  admin_password = "reallySecurePassword909!"
  db_names = ["app1", "app2", "app3"]
}