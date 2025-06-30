data "azurerm_public_ip" "pipid" {
  for_each = tomap(var.nic)
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

data "azurerm_subnet" "subnetid" {
  for_each = tomap(var.nic)
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vet_name
  resource_group_name  = each.value.rg_name
}

resource "azurerm_network_interface" "nic" {
  for_each = tomap(var.nic)
  
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.rg_name

  ip_configuration {
    
    name                          = each.value.ip_config
    subnet_id                     = data.azurerm_subnet.subnetid[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pipid[each.key].id
  }

}