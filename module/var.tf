variable "resource_group_name" {
    description = "The name of the Monitoring resource group to deploy the resource"
    type = string
}
variable "location" {
    type = string
    description = "The location into which the resource to be deployed"
}
/*variable "tags" {
   description = "A mapping of tags to assign to the resource."
   type = map
}*/
variable "log_workspace_name" {
    description = "The name of the log analytics workspace resource"
    type = string
}
/*variable "log_sku" {
    description = "The SKU of the log analytics workspace to be deployed"
    type = string
}
variable "subscription_id_prod" {
    description = "The Subscription id of production to enable activity log"
    type = string
}*/

variable "deployment_mode" {
    description = "The type of the deployment mode for the ARM template deployment"
    type = string
}
variable "counter_interval" {
    description = "The interval in seconds for the performance counters"
    type = string
}
variable "deployment_name" {
    description = "The name of the ARM template deployment"
    type = string
}