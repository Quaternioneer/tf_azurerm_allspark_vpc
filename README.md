tf_azurerm_allspark
=================

Terraform module to configure an allspark network configuration.
This module will create vnets, storage accounts, ssh keys.

## Input variables
  * azurerm_location [optional - 'UK West']
  * allspark_ssh_dir [optional - './ssh']
  * allspark_name [optional - allspark]
  * allspark_admin_address_space [optional - 172.10.0.0]
  * allspark_dev_address_space [optional - 172.11.0.0]
  * allspark_prod_address_space [optional - 172.12.0.0]


## Outputs
  * allspark_data - map 


## Example use

    module "allspark" {
      source  = "github.com/broomyocymru/tf_azurerm_allspark"
    }


## License

MIT - see the included LICENSE file for more details.
