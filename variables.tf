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
  # --- Unconfirmed validation candidates, derived from azurerm_mssql_server's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.ValidateMsSqlServerName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: version
  #   condition: contains(["2.0", "12.0"], value)
  #   message:   must be one of: 2.0, 12.0
  # path: administrator_login
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: azuread_administrator.login_username
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: azuread_administrator.object_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: azuread_administrator.tenant_id
  #   condition: can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", value))
  #   message:   must be a valid UUID
  # path: connection_policy
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: identity.identity_ids[*]
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: transparent_data_encryption_key_vault_key_id
  #   source:    [from keyvault.ValidateNestedItemID] !ok
  # path: transparent_data_encryption_key_vault_key_id
  #   source:    [from keyvault.ValidateNestedItemID] err != nil
  # path: primary_user_assigned_identity_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] !ok
  # path: primary_user_assigned_identity_id
  #   source:    [from commonids.ValidateUserAssignedIdentityID] err != nil
  # path: minimum_tls_version
  #   condition: contains(["1.2"], value)
  #   message:   must be one of: 1.2
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

