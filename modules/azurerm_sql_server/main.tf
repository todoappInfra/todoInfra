resource "azurerm_mssql_server" "azurerm_mssql_server" {
  name                         = var.mssql_name
  resource_group_name          = var.rg_name
  location                     = var.mssql_location
  version                      = var.mssql_version
  administrator_login          = var.mssql_adminlogin
  administrator_login_password = data.azurerm_key_vault_secret.example.value
  minimum_tls_version          = var.mssql_tls_ver

   
   lifecycle {
  prevent_destroy = false
}
}


data "azurerm_key_vault_secret" "example" {
  name         = var.secret_name
  key_vault_id = data.azurerm_key_vault.key_id.id
# key_vault_id = "/subscriptions/e712f7a9-858c-4636-876e-16f5711d3587/resourceGroups/Sikhsha_Sathi27/providers/Microsoft.KeyVault/vaults/batch27vault"
# }
}

data "azurerm_key_vault" "key_id" {
  name                = "batch27vault"
  resource_group_name = "Sikhsha_Sathi27"
}

# data "azurerm_key_vault_secret" "example" {
#   name         = var.secret_name
#   key_vault_id = data.azurerm_key_vault.key_id.id
# }

# data "azurerm_key_vault" "key_id" {
#   name                = "batch27vault"
#   resource_group_name = "Sikhsha_Sathi27"
# }