output "mssql_servers" {
  description = "All mssql_server resources"
  value       = azurerm_mssql_server.mssql_servers
  sensitive   = true
}
output "mssql_servers_administrator_login" {
  description = "List of administrator_login values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.administrator_login]
}
output "mssql_servers_administrator_login_password" {
  description = "List of administrator_login_password values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.administrator_login_password]
  sensitive   = true
}
output "mssql_servers_administrator_login_password_wo" {
  description = "List of administrator_login_password_wo values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.administrator_login_password_wo]
  sensitive   = true
}
output "mssql_servers_administrator_login_password_wo_version" {
  description = "List of administrator_login_password_wo_version values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.administrator_login_password_wo_version]
}
output "mssql_servers_azuread_administrator" {
  description = "List of azuread_administrator values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.azuread_administrator]
}
output "mssql_servers_connection_policy" {
  description = "List of connection_policy values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.connection_policy]
}
output "mssql_servers_express_vulnerability_assessment_enabled" {
  description = "List of express_vulnerability_assessment_enabled values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.express_vulnerability_assessment_enabled]
}
output "mssql_servers_fully_qualified_domain_name" {
  description = "List of fully_qualified_domain_name values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.fully_qualified_domain_name]
}
output "mssql_servers_identity" {
  description = "List of identity values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.identity]
}
output "mssql_servers_location" {
  description = "List of location values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.location]
}
output "mssql_servers_minimum_tls_version" {
  description = "List of minimum_tls_version values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.minimum_tls_version]
}
output "mssql_servers_name" {
  description = "List of name values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.name]
}
output "mssql_servers_outbound_network_restriction_enabled" {
  description = "List of outbound_network_restriction_enabled values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.outbound_network_restriction_enabled]
}
output "mssql_servers_primary_user_assigned_identity_id" {
  description = "List of primary_user_assigned_identity_id values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.primary_user_assigned_identity_id]
}
output "mssql_servers_public_network_access_enabled" {
  description = "List of public_network_access_enabled values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.public_network_access_enabled]
}
output "mssql_servers_resource_group_name" {
  description = "List of resource_group_name values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.resource_group_name]
}
output "mssql_servers_restorable_dropped_database_ids" {
  description = "List of restorable_dropped_database_ids values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.restorable_dropped_database_ids]
}
output "mssql_servers_tags" {
  description = "List of tags values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.tags]
}
output "mssql_servers_transparent_data_encryption_key_vault_key_id" {
  description = "List of transparent_data_encryption_key_vault_key_id values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.transparent_data_encryption_key_vault_key_id]
}
output "mssql_servers_version" {
  description = "List of version values across all mssql_servers"
  value       = [for k, v in azurerm_mssql_server.mssql_servers : v.version]
}

