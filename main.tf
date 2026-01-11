resource "azurerm_mssql_server" "mssql_servers" {
  for_each = var.mssql_servers

  location                                     = each.value.location
  name                                         = each.value.name
  resource_group_name                          = each.value.resource_group_name
  version                                      = each.value.version
  administrator_login                          = each.value.administrator_login
  administrator_login_password                 = each.value.administrator_login_password
  administrator_login_password_wo              = each.value.administrator_login_password_wo
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

