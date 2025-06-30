data "azurerm_mssql_server" "mssql" {
  name                = var.mssql_name
  resource_group_name = var.rg_name
}


resource "azurerm_mssql_database" "example" {
  name         = var.msql_data_name
  server_id    = data.azurerm_mssql_server.mssql.id
#  collation    = "SQL_Latin1_General_CP1_CI_AS"
# license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}