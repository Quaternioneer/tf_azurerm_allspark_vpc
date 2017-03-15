tf_azurerm_allspark
=================

Terraform module to configure an allspark network configuration.
This module will create vnets, storage accounts, ssh keys.

## Input variables
  * azurerm_location [optional - 'UK West']
  * allspark_ssh_dir [optional - './ssh']
  * allspark_admin_name [optional - allsparkadmin]
  * allspark_dev_name [optional - allsparkdev]
  * allspark_prod_name [optional - allsparkprod]
  * allspark_admin_address_space [optional - 172.10.0.0]
  * allspark_dev_address_space [optional - 172.11.0.0]
  * allspark_prod_address_space [optional - 172.12.0.0]


## Outputs
  * admin_ssh_private
  * admin_ssh_public
  * dev_ssh_private
  * dev_ssh_public
  * prod_ssh_private
  * prod_ssh_public


## Example use

    module "allspark" {
      source  = "github.com/broomyocymru/tf_azurerm_allspark"
    }


## License

MIT - see the included LICENSE file for more details.
