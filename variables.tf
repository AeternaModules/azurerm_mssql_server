variable "mssql_servers" {
  description = <<EOT
Map of mssql_servers, attributes below
Required:
    - location
    - name
    - resource_group_name
    - version
Optional:
    - administrator_login
    - administrator_login_password
    - administrator_login_password_key_vault_id (alternative to administrator_login_password - read from Key Vault instead)
    - administrator_login_password_key_vault_secret_name (alternative to administrator_login_password - read from Key Vault instead)
    - administrator_login_password_wo
    - administrator_login_password_wo_key_vault_id (alternative to administrator_login_password_wo - read from Key Vault instead)
    - administrator_login_password_wo_key_vault_secret_name (alternative to administrator_login_password_wo - read from Key Vault instead)
    - administrator_login_password_wo_version
    - connection_policy
    - express_vulnerability_assessment_enabled
    - minimum_tls_version
    - outbound_network_restriction_enabled
    - primary_user_assigned_identity_id
    - public_network_access_enabled
    - tags
    - transparent_data_encryption_key_vault_key_id
    - azuread_administrator (block):
        - azuread_authentication_only (optional)
        - login_username (required)
        - object_id (required)
        - tenant_id (optional)
    - identity (block):
        - identity_ids (optional)
        - type (required)
EOT

  type = map(object({
    location                                              = string
    name                                                  = string
    resource_group_name                                   = string
    version                                               = string
    administrator_login                                   = optional(string)
    administrator_login_password                          = optional(string)
    administrator_login_password_key_vault_id             = optional(string)
    administrator_login_password_key_vault_secret_name    = optional(string)
    administrator_login_password_wo                       = optional(string)
    administrator_login_password_wo_key_vault_id          = optional(string)
    administrator_login_password_wo_key_vault_secret_name = optional(string)
    administrator_login_password_wo_version               = optional(number)
    connection_policy                                     = optional(string)
    express_vulnerability_assessment_enabled              = optional(bool)
    minimum_tls_version                                   = optional(string)
    outbound_network_restriction_enabled                  = optional(bool)
    primary_user_assigned_identity_id                     = optional(string)
    public_network_access_enabled                         = optional(bool)
    tags                                                  = optional(map(string))
    transparent_data_encryption_key_vault_key_id          = optional(string)
    azuread_administrator = optional(object({
      azuread_authentication_only = optional(bool)
      login_username              = string
      object_id                   = string
      tenant_id                   = optional(string)
    }))
    identity = optional(object({
      identity_ids = optional(set(string))
      type         = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.mssql_servers : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_servers : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_servers : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_servers : (
        contains(["2.0", "12.0"], v.version)
      )
    ])
    error_message = "must be one of: 2.0, 12.0"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_servers : (
        v.administrator_login == null || (length(v.administrator_login) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_servers : (
        v.azuread_administrator == null || (length(v.azuread_administrator.login_username) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_servers : (
        v.azuread_administrator == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.azuread_administrator.object_id)))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_servers : (
        v.azuread_administrator == null || (v.azuread_administrator.tenant_id == null || (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.azuread_administrator.tenant_id))))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_servers : (
        v.minimum_tls_version == null || (contains(["1.2"], v.minimum_tls_version))
      )
    ])
    error_message = "must be one of: 1.2"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_servers : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 14 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

