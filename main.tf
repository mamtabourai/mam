resource "azurerm_resource_group" "anna" {
  for_each = var.varsha
  name     = each.value.name
  location = each.value.location
}

resource "azurerm_storage_account" "banna" {
  for_each                 = var.varsha
  name                     = each.value.storage_name
  resource_group_name      = azurerm_resource_group.anna[each.key].name
  location                 = azurerm_resource_group.anna[each.key].location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "cbanna" {
  for_each              = var.varsha
  name                  = each.value.container_name
  storage_account_id    = azurerm_storage_account.banna[each.key].id
  container_access_type = "private"

}