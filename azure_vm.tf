# creating azure virtual machine of linux type
resource "azurerm_linux_virtual_machine" "mano-vm1" {
    name = "mano-linux-vm1"
    resource_group_name = data.azurerm_resource_group.mano-existing-rsgroup.name
    location = data.azurerm_resource_group.mano-existing-rsgroup.location
    admin_username = "mano"
    admin_password = "Eurofins@12345"
    disable_password_authentication = false
    network_interface_ids = [ azurerm_network_interface.mano-vnic1.id]
    size = "Standard_B1s"

os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}




  
