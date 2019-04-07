resource "azurerm_network_interface" "swterraformnic" {
    name                = "swNIC"
    location            = "eastus"
    resource_group_name = "${azurerm_resource_group.swResourceGroup.name}"
    network_security_group_id = "${azurerm_network_security_group.swterraformnsg.id}"

    ip_configuration {
        name                          = "swNicConfiguration"
        subnet_id                     = "${azurerm_subnet.swterraformsubnet.id}"
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = "${azurerm_public_ip.swterraformpublicip.id}"
    }

    tags {
        environment = "Stephen Terraform Demo"
    }
}