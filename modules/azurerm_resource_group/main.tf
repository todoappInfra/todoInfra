resource "azurerm_resource_group" "todo_auto" {
  for_each = tomap(var.rg)
  name = each.key
  location = each.value
}


