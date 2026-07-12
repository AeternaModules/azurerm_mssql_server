output "mssql_servers_administrator_login" {
  description = "Map of administrator_login values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.administrator_login }
}
output "mssql_servers_administrator_login_password" {
  description = "Map of administrator_login_password values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.administrator_login_password }
  sensitive   = true
}
output "mssql_servers_administrator_login_password_wo" {
  description = "Map of administrator_login_password_wo values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.administrator_login_password_wo }
  sensitive   = true
}
output "mssql_servers_administrator_login_password_wo_version" {
  description = "Map of administrator_login_password_wo_version values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.administrator_login_password_wo_version }
}
output "mssql_servers_azuread_administrator" {
  description = "Map of azuread_administrator values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.azuread_administrator }
}
output "mssql_servers_connection_policy" {
  description = "Map of connection_policy values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.connection_policy }
}
output "mssql_servers_express_vulnerability_assessment_enabled" {
  description = "Map of express_vulnerability_assessment_enabled values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.express_vulnerability_assessment_enabled }
}
output "mssql_servers_fully_qualified_domain_name" {
  description = "Map of fully_qualified_domain_name values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.fully_qualified_domain_name }
}
output "mssql_servers_identity" {
  description = "Map of identity values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.identity }
}
output "mssql_servers_location" {
  description = "Map of location values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.location }
}
output "mssql_servers_minimum_tls_version" {
  description = "Map of minimum_tls_version values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.minimum_tls_version }
}
output "mssql_servers_name" {
  description = "Map of name values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.name }
}
output "mssql_servers_outbound_network_restriction_enabled" {
  description = "Map of outbound_network_restriction_enabled values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.outbound_network_restriction_enabled }
}
output "mssql_servers_primary_user_assigned_identity_id" {
  description = "Map of primary_user_assigned_identity_id values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.primary_user_assigned_identity_id }
}
output "mssql_servers_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.public_network_access_enabled }
}
output "mssql_servers_resource_group_name" {
  description = "Map of resource_group_name values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.resource_group_name }
}
output "mssql_servers_restorable_dropped_database_ids" {
  description = "Map of restorable_dropped_database_ids values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.restorable_dropped_database_ids }
}
output "mssql_servers_tags" {
  description = "Map of tags values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.tags }
}
output "mssql_servers_transparent_data_encryption_key_vault_key_id" {
  description = "Map of transparent_data_encryption_key_vault_key_id values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.transparent_data_encryption_key_vault_key_id }
}
output "mssql_servers_version" {
  description = "Map of version values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.version }
}

