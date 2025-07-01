# ram ram jiiiiiii
module "rg" {
  source      = "../modules/azurerm_resource_group"
 rg = var.rg_main
}
module "vnet1" {
  depends_on    = [module.rg]
  source        = "../modules/azurerm_virtual_network"
  vnet =var.vnet_main
}


module "subnet1" {
  depends_on = [module.vnet1]
  source     = "../modules/azurerm_subnet"
subnet = var.subnet_main
}


module "publicip1" {
  depends_on    = [module.subnet1]
  source        = "../modules/azurerm_public_ip"
  publicip = var.publicip_main
}



module "nic1" {
  depends_on   = [module.publicip1]
  source       = "../modules/azurerm_nic"
 nic = var.nic_main
}


 

module "vm1" {
  depends_on     = [module.nic1]
  source         = "../modules/azurerm_virtual_machine"
  
  vm = var.vm_main
}







# module "ser" {
#   depends_on = [ module.nic1]
#   source           = "../modules/azurerm_sql_server"
#   mssql_name       = "serraghu"
#   rg_name          = "todo_auto_5"
#   mssql_location   = "westus3"
#   mssql_version    = "12.0"
#   mssql_adminlogin = "deepak"

#   mssql_tls_ver    = "1.2"
#   secret_name = "vm3"
# }

# module "datamsql" {
#   depends_on     = [module.ser]
#   source         = "../modules/azure_sql_database"
#   msql_data_name = "dataraghu"
#   rg_name        = "todo_auto_5"
#   mssql_name     = "serraghu"

# }