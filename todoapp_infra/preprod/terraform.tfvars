rg_main = {
  todo_auto_5 = "westus3"
 }

 vnet_main = { 
      vnet1 = {
        name = "vnet_todo5"
        location = "westus3"
        resource_group_name = "todo_auto_5"
        address_space = ["10.0.0.0/16"]
      }
}

subnet_main = {
  subnet1 = {
    name = "frontend6"
    resource_group_name = "todo_auto_5"
    virtual_network_name = "vnet_todo5"
    address_prefixes = ["10.0.1.0/24"]
  }

subnet2 = {
    name = "backend6"
    resource_group_name = "todo_auto_5"
    virtual_network_name = "vnet_todo5"
    address_prefixes = ["10.0.2.0/24"]
  }

}

publicip_main = {
  publicip1 = {
    name = "frontendip"
  resource_group_name  = "todo_auto_5"
  location      = "westus3"
  allocation_method    = "Dynamic"

  }
  publicip2 = {
    name = "backendip"
  resource_group_name  = "todo_auto_5"
  location      = "westus3"
  allocation_method    = "Dynamic"

  }
} 

nic_main = {
      nic1 = {
        nic_name     = "frountnic"
  nic_location = "westus3"
  rg_name      = "todo_auto_5"
  pip_name     = "frontendip"
  subnet_name  = "frontend6"
  vet_name     = "vnet_todo5"
  ip_config = "internal"
}
 nic2 = {
    nic_name     = "backendnic"
  nic_location = "westus3"
  rg_name      = "todo_auto_5"
  pip_name     = "backendip"
  subnet_name  = "backend6"
  vet_name     = "vnet_todo5"
ip_config = "internal"
}
}

vm_main = {
    vm1 = {
  vm_name        = "RGfrontend"
  vm_location    = "westus3"
  rg_name        = "todo_auto_5"
  nicname        = "frountnic"
  vm_size        = "Standard_F2"
  publisher      = "Canonical"
  offer          = "0001-com-ubuntu-server-jammy"
  sku            = "22_04-lts"
}
vm2 = {
    vm_name        = "RGbackend"
  vm_location    = "westus3"
  rg_name        = "todo_auto_5"
  nicname        = "backendnic"
  vm_size        = "Standard_F2"
  publisher      = "Canonical"
  offer          = "0001-com-ubuntu-server-focal"
  sku            = "20_04-lts"
}
}
