output "mssql_servers_id" {
  description = "Map of id values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "mssql_servers_administrator_login" {
  description = "Map of administrator_login values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.administrator_login if v.administrator_login != null && length(v.administrator_login) > 0 }
}
output "mssql_servers_administrator_login_password" {
  description = "Map of administrator_login_password values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.administrator_login_password if v.administrator_login_password != null && length(v.administrator_login_password) > 0 }
  sensitive   = true
}
output "mssql_servers_administrator_login_password_wo" {
  description = "Map of administrator_login_password_wo values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.administrator_login_password_wo if v.administrator_login_password_wo != null && length(v.administrator_login_password_wo) > 0 }
  sensitive   = true
}
output "mssql_servers_administrator_login_password_wo_version" {
  description = "Map of administrator_login_password_wo_version values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.administrator_login_password_wo_version if v.administrator_login_password_wo_version != null }
}
output "mssql_servers_azuread_administrator" {
  description = "Map of azuread_administrator values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.azuread_administrator if v.azuread_administrator != null && length(v.azuread_administrator) > 0 }
}
output "mssql_servers_connection_policy" {
  description = "Map of connection_policy values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.connection_policy if v.connection_policy != null && length(v.connection_policy) > 0 }
}
output "mssql_servers_express_vulnerability_assessment_enabled" {
  description = "Map of express_vulnerability_assessment_enabled values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.express_vulnerability_assessment_enabled if v.express_vulnerability_assessment_enabled != null }
}
output "mssql_servers_fully_qualified_domain_name" {
  description = "Map of fully_qualified_domain_name values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.fully_qualified_domain_name if v.fully_qualified_domain_name != null && length(v.fully_qualified_domain_name) > 0 }
}
output "mssql_servers_identity" {
  description = "Map of identity values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.identity if v.identity != null && length(v.identity) > 0 }
}
output "mssql_servers_location" {
  description = "Map of location values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.location if v.location != null && length(v.location) > 0 }
}
output "mssql_servers_minimum_tls_version" {
  description = "Map of minimum_tls_version values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.minimum_tls_version if v.minimum_tls_version != null && length(v.minimum_tls_version) > 0 }
}
output "mssql_servers_name" {
  description = "Map of name values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "mssql_servers_outbound_network_restriction_enabled" {
  description = "Map of outbound_network_restriction_enabled values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.outbound_network_restriction_enabled if v.outbound_network_restriction_enabled != null }
}
output "mssql_servers_primary_user_assigned_identity_id" {
  description = "Map of primary_user_assigned_identity_id values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.primary_user_assigned_identity_id if v.primary_user_assigned_identity_id != null && length(v.primary_user_assigned_identity_id) > 0 }
}
output "mssql_servers_public_network_access_enabled" {
  description = "Map of public_network_access_enabled values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.public_network_access_enabled if v.public_network_access_enabled != null }
}
output "mssql_servers_resource_group_name" {
  description = "Map of resource_group_name values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "mssql_servers_restorable_dropped_database_ids" {
  description = "Map of restorable_dropped_database_ids values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.restorable_dropped_database_ids if v.restorable_dropped_database_ids != null && length(v.restorable_dropped_database_ids) > 0 }
}
output "mssql_servers_tags" {
  description = "Map of tags values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "mssql_servers_transparent_data_encryption_key_vault_key_id" {
  description = "Map of transparent_data_encryption_key_vault_key_id values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.transparent_data_encryption_key_vault_key_id if v.transparent_data_encryption_key_vault_key_id != null && length(v.transparent_data_encryption_key_vault_key_id) > 0 }
}
output "mssql_servers_version" {
  description = "Map of version values across all mssql_servers, keyed the same as var.mssql_servers"
  value       = { for k, v in azurerm_mssql_server.mssql_servers : k => v.version if v.version != null && length(v.version) > 0 }
}

