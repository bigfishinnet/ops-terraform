resource "azurerm_resource_group" "swResourceGroup" {
    name     = "azswRG"
    location = "eastus"

    tags {
        environment = "Stephen Terraform Demo"
    }
}