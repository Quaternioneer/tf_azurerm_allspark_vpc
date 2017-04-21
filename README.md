# tf_azurerm_allspark_vpc
Terraform module to configure an AllSpark VPC configuration in Azure.

## Input variables
  * name [required]
  * ssh_dir [optional - '/../ssh']
  * location [optional - 'UK West']
  * subnets [optional - ["10.10.0.0", "10.11.0.0", "10.12.0.0"]]
  * subnet_names [optional - ["admin", "dev", "prod"]]


## Outputs
  * allspark_data - map


## Example use

    module "allspark" {
      source  = "github.com/broomyocymru/tf_azurerm_allspark_vpc"
      name = "allspark"
    }


## License

MIT - see the included LICENSE file for more details.
