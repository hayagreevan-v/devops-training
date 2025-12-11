output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "app_service_name" {
  value = azurerm_linux_web_app.app.name
}

output "app_service_plan_id" {
  value = azurerm_service_plan.asp.id
}
