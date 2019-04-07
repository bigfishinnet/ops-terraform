resource "azurerm_subnet" "swterraformsubnet" {
    name                 = "swPrivateSubnet"
    resource_group_name  = "${azurerm_resource_group.swResourceGroup.name}"
    virtual_network_name = "${azurerm_virtual_network.swterraformnetwork.name}"
    address_prefix       = "${var.swPrivateSubnet}"
}