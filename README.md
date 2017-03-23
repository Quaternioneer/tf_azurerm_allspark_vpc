tf_azurerm_allspark
=================

Terraform module to configure an allspark network configuration.
This module will create vnets, storage accounts, ssh keys.

todo - nsg and bastion with public ip!

## Input variables
  * name [required]
  * location [optional - 'UK West']
  * ssh_dir [optional - './ssh']
  * subnets [optional - ["172.10.0.0", "172.11.0.0", "172.12.0.0"]]
  * subnet_names [optional - ["admin", "dev", "prod"]]


## Outputs
  * allspark_data - map


## Example use

    module "allspark" {
      source  = "github.com/broomyocymru/tf_azurerm_allspark"
      name = "allspark"
    }


## License

MIT - see the included LICENSE file for more details.
