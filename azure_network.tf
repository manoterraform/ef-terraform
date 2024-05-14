# Creating azure network
resource "azurerm_virtual_network" "name1" {
    resource_group_name = data.azurerm_resource_group.mano-existing-rsgroup.name
    location = data.azurerm_resource_group.mano-existing-rsgroup.location
    name = "net11"
    address_space = [ "10.0.0.0/16" ]
  
}

# Creating subnet

resource "azurerm_subnet" "mano-subnet1" {
  name = "mano-internal-subnet"
  virtual_network_name = azurerm_virtual_network.name1.name
  resource_group_name = data.azurerm_resource_group.mano-existing-rsgroup.name
  address_prefixes = [ "10.0.1.0/24" ]
}

# Creating network network ingerface
 resource "azurerm_network_interface" "mano-vnic1" {
  name = "mano-network-interface1"
  resource_group_name = data.azurerm_resource_group.mano-existing-rsgroup.name
  location = data.azurerm_resource_group.mano-existing-rsgroup.location

 ip_configuration {
    subnet_id = azurerm_subnet.mano-subnet1.id
    private_ip_address_allocation = "Dynamic"
    name = "mano-ip1"

     }
 }
