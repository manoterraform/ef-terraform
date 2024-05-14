
# keword function           name of function -- this is not for providers
# resource "azurerm_resource_group" "mano-rsgrp" {
#     name = "mano-resource-group1"
#     location = "Central US"
# }
data "azurerm_resource_group" "mano-existing-rsgroup" {
   name = "mano-manual-resoucesgroup"  
}

