# Introduction 
This is the subscription deployment for the Azure IPAM solution in Terraform.
This is translated copy for the Bicep code provided with the solution.

The code is a little rough around the edges, but will deploy the solution with the normal topology on Azure Web Apps. It is intended that the code is consumed and aligned to individual requirements.

The solution is not currently integrated with the deploy.ps1 deployment scripts. This assumes that the relevant app registrations are created prior to the execution of the terraform and the required values are passed in (so that they can be deployed into the relevant key vault).

Variables/parameters reside in the files **locals.tf** and **.deploy_pipeline.yml**, and have been replaced with **[ ]**, so that these are easy to locate and update.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.97.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.97.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_app_service"></a> [app\_service](#module\_app\_service) | ./modules/app_service | n/a |
| <a name="module_container_registry"></a> [container\_registry](#module\_container\_registry) | ./modules/container_registry | n/a |
| <a name="module_cosmos_db"></a> [cosmos\_db](#module\_cosmos\_db) | ./modules/cosmos_db | n/a |
| <a name="module_function_app"></a> [function\_app](#module\_function\_app) | ./modules/function_app | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ./modules/key_vault | n/a |
| <a name="module_log_analytics_workspace"></a> [log\_analytics\_workspace](#module\_log\_analytics\_workspace) | ./modules/log_analytics_workspace | n/a |
| <a name="module_managed_identity"></a> [managed\_identity](#module\_managed\_identity) | ./modules/managed_identity | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ./modules/storage_account | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault_access_policy.policy](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_access_policy) | resource |
| [azurerm_resource_group.ipam](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_engineappid"></a> [engineappid](#input\_engineappid) | IPAM-Engine App Registration Client/App ID | `string` | n/a | yes |
| <a name="input_engineappsecret"></a> [engineappsecret](#input\_engineappsecret) | IPAM-Engine App Registration Client Secret | `string` | n/a | yes |
| <a name="input_uiappid"></a> [uiappid](#input\_uiappid) | IPAM-UI App Registration Client/App ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_service_host_name"></a> [app\_service\_host\_name](#output\_app\_service\_host\_name) | The full app name e.g. 'app.azurewebsites.net'. |
| <a name="output_app_service_name"></a> [app\_service\_name](#output\_app\_service\_name) | The globally-unique name of the app service. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The resource group name for the deployed resources. |
<!-- END_TF_DOCS -->