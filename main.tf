data "azurerm_key_vault_secret" "administrator_login_password" {
  for_each     = { for k, v in var.mssql_servers : k => v if v.administrator_login_password_key_vault_id != null && v.administrator_login_password_key_vault_secret_name != null }
  name         = each.value.administrator_login_password_key_vault_secret_name
  key_vault_id = each.value.administrator_login_password_key_vault_id
}
data "azurerm_key_vault_secret" "administrator_login_password_wo" {
  for_each     = { for k, v in var.mssql_servers : k => v if v.administrator_login_password_wo_key_vault_id != null && v.administrator_login_password_wo_key_vault_secret_name != null }
  name         = each.value.administrator_login_password_wo_key_vault_secret_name
  key_vault_id = each.value.administrator_login_password_wo_key_vault_id
}
resource "azurerm_mssql_server" "mssql_servers" {
  for_each = var.mssql_servers

  location                                     = each.value.location
  name                                         = each.value.name
  resource_group_name                          = each.value.resource_group_name
  version                                      = each.value.version
  administrator_login                          = each.value.administrator_login
  administrator_login_password                 = each.value.administrator_login_password != null ? each.value.administrator_login_password : try(data.azurerm_key_vault_secret.administrator_login_password[each.key].value, null)
  administrator_login_password_wo              = each.value.administrator_login_password_wo != null ? each.value.administrator_login_password_wo : try(data.azurerm_key_vault_secret.administrator_login_password_wo[each.key].value, null)
  administrator_login_password_wo_version      = each.value.administrator_login_password_wo_version
  connection_policy                            = each.value.connection_policy
  express_vulnerability_assessment_enabled     = each.value.express_vulnerability_assessment_enabled
  minimum_tls_version                          = each.value.minimum_tls_version
  outbound_network_restriction_enabled         = each.value.outbound_network_restriction_enabled
  primary_user_assigned_identity_id            = each.value.primary_user_assigned_identity_id
  public_network_access_enabled                = each.value.public_network_access_enabled
  tags                                         = each.value.tags
  transparent_data_encryption_key_vault_key_id = each.value.transparent_data_encryption_key_vault_key_id

  dynamic "azuread_administrator" {
    for_each = each.value.azuread_administrator != null ? [each.value.azuread_administrator] : []
    content {
      azuread_authentication_only = azuread_administrator.value.azuread_authentication_only
      login_username              = azuread_administrator.value.login_username
      object_id                   = azuread_administrator.value.object_id
      tenant_id                   = azuread_administrator.value.tenant_id
    }
  }

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }
}

