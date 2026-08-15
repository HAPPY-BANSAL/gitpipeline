resource "azurerm_public_ip" "example" {
    for_each = var.bastion
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "example" {
    for_each = var.bastion
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
 

  ip_configuration {
    name                 = each.value.ip_name
    subnet_id            = data.azurerm_subnet.example[each.key].id
    public_ip_address_id = azurerm_public_ip.example[each.key].id
  }
}