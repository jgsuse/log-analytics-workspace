provider "azurerm" {
  features {}
}

module "Log_Analytics_Workspace"{
 source   ="./module"
 log_workspace_name        = var.log_workspace_name 
 location                  = var.location
 resource_group_name       = var.resource_group_name
 #log_sku                  = var.log_sku
 #tags                     = var.tags

 counter_interval          = var.counter_interval

 deployment_name           = var.deployment_name
 deployment_mode           = var.deployment_mode
}