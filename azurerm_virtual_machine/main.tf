resource "azurerm_network_interface" "example" {
    for_each = var.vms
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ip_name
    subnet_id                     = data.azurerm_subnet.example[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

resource "azurerm_linux_virtual_machine" "linux-vm" {
    for_each = var.vms
    name               = each.value.name
    location           = each.value.location
    resource_group_name = each.value.resource_group_name
    size               = each.value.size
    admin_username     = each.value.admin_username
    admin_password     = each.value.admin_password
    network_interface_ids = [azurerm_network_interface.example[each.key].id]
    disable_password_authentication = false

    os_disk {
        caching              = each.value.caching
        storage_account_type = each.value.storage_account_type
    }

    source_image_reference {
        publisher = each.value.publisher
        offer     = each.value.offer
        sku       = each.value.sku
        version   = each.value.version
    }
}