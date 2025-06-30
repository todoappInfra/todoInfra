data "azurerm_network_interface" "nicid" {
  for_each = tomap(var.vm)
  name                = each.value.nicname
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "user" {
  name         = "vm10user"
  key_vault_id = data.azurerm_key_vault.key_id.id
}

data "azurerm_key_vault_secret" "password" {
  name         = "vm10password"
  key_vault_id = data.azurerm_key_vault.key_id.id
}

data "azurerm_key_vault" "key_id" {
  name                = "batch27vault"
  resource_group_name = "Sikhsha_Sathi27"
}

resource "azurerm_linux_virtual_machine" "vm10" {
  for_each = tomap(var.vm)
  name                  = each.value.vm_name
  location              = each.value.vm_location
  resource_group_name   = each.value.rg_name
  network_interface_ids = [data.azurerm_network_interface.nicid[each.key].id]
  size               = each.value.vm_size
     admin_username = data.azurerm_key_vault_secret.user.value
    admin_password = data.azurerm_key_vault_secret.password.value
    disable_password_authentication = false

source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = "latest"
  }
  os_disk {
   caching           = "ReadWrite"
   storage_account_type = "Standard_LRS"
 }

# custom data ka throught nginx direct install

#  custom_data = base64encode(<<-EOF
#               #!/bin/bash
#               apt update
#               apt install nginx -y
#               systemctl start nginx
#               systemctl enable nginx
#               EOF
              # )

              provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y"
    ]
  }
  
}
 
