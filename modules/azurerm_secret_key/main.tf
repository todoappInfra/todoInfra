resource "azurerm_key_vault_secret" "secret" {
  name         = var.secret_name
  value        = var.secret_value
  key_vault_id = data.azurerm_key_vault.key_id.id
}

data "azurerm_key_vault" "key_id" {
  name                = "batch27vault"
  resource_group_name = "Sikhsha_Sathi27"
}


