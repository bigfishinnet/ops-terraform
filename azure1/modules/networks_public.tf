resource "azurerm_public_ip" "swterraformpublicip" {
    name                         = "swPublicIP"
    location                     = "eastus"
    resource_group_name          = "${azurerm_resource_group.swResourceGroup.name}"
    allocation_method            = "Dynamic"

    tags {
        environment = "Stephen Terraform Demo"
    }
}
