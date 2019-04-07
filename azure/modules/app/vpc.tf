resource "azurerm_virtual_network" "swterraformnetwork" {
    name                = "swVnet"
    address_space       = ["10.0.0.0/16"]
    location            = "eastus"
    resource_group_name = "${azurerm_resource_group.swResourceGroup.name}"

    tags {
        environment = "Stephen Terraform Demo"
    }
}