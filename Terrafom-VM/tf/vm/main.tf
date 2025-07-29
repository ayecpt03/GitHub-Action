# # Folder: tf/vm/main.tf

resource "azurerm_network_interface" "tf-nic1" {
  for_each            = var.vms
  name                = "${each.value.vm_name}-nic"
  location            = data.azurerm_resource_group.tf-rg1.location
  resource_group_name = data.azurerm_resource_group.tf-rg1.name

  ip_configuration {
    name                          = "${each.value.vm_name}-ipconfig"
    subnet_id                     = data.azurerm_subnet.tf-subnet1.id
    private_ip_address_allocation = "Static"
    private_ip_address            = each.value.private_ip_address
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "tf-vms" {
  for_each              = var.vms
  name                  = each.value.vm_name
  resource_group_name   = data.azurerm_resource_group.tf-rg1.name
  location              = data.azurerm_resource_group.tf-rg1.location
  size                  = each.value.vm_size
  admin_username        = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.tf-nic1[each.key].id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file(var.ssh_public_key)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = each.value.disk_type
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }

  tags = var.tags
}

