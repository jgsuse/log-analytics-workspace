locals {
  win_perf_details = csvdecode(file("${path.module}/win_counters.csv"))
}
resource "azurerm_log_analytics_workspace" "log_workspace" {
  name                = var.log_workspace_name 
  location            = var.location
  resource_group_name = var.resource_group_name
  #sku                 = var.log_sku
  #tags                = var.tags
}


resource "azurerm_log_analytics_datasource_windows_performance_counter" "windows_counter" {
  count               = length(local.win_perf_details)
  name                = local.win_perf_details[count.index].name
  resource_group_name = var.resource_group_name
  workspace_name      = azurerm_log_analytics_workspace.log_workspace.name
  object_name         = local.win_perf_details[count.index].object_name
  instance_name       = "*"
  counter_name        = local.win_perf_details[count.index].counter_name
  interval_seconds    = var.counter_interval
}

resource "azurerm_template_deployment" "linux_counter" {
  name                = var.deployment_name
  resource_group_name = var.resource_group_name
  deployment_mode     = var.deployment_mode
  template_body       = file("${path.module}/lglinuxobject.json")
  parameters          = {
    "workspaceName"   = var.log_workspace_name
  }
  depends_on          = [
    azurerm_log_analytics_workspace.log_workspace,
  ]
}