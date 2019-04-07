resource "azurerm_virtual_machine" "swterraformvm" {
    name                  = "swVM"
    location              = "eastus"
    resource_group_name   = "${azurerm_resource_group.swResourceGroup.name}"
    network_interface_ids = ["${azurerm_network_interface.swterraformnic.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "myOsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "swvm"
        admin_username = "${var.swadmin_user}"
        admin_password = "${var.swadmin_password}"
        custom_data = "${file("installapache.txt")}"
    }

    os_profile_linux_config {
        disable_password_authentication = true
        ssh_keys {
            path     = "/home/azureuser/.ssh/authorized_keys"
            key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/IgwXqFED6+a70T+W7qCmr8/sHzUE2IBvdvQrZ/DeYTRPYUwOko+k5P+58KH5xZPk7CjwI+sDNbypRYSEMCzjvbW95Trxq+P7ZPu+fD8ujnO00EenEJvOzTQiL9Uu8pZoBYTOjQD1RwN9Bo7ZMmqskfdL/vdaAcFEf/kBY5SaCsCflZrF2SF3tGNpD64pkZQJdjRJQ23IV7oSQvc8CJG4ElFyvVfQIJfhkhmaYj5hQru20Ze+9jKoU2WnF7Vzent+/mVNTeZYnqAOmJxqHWuWhpiI4F+Sbq2eJP4OEP676HgECM/myaXlrmJpbovRjKWYTgrxvWuxAFYMzUlMd0ix stephenwe@Celtic.local"
        }
    }
    
    boot_diagnostics {
       enabled     = "true"
        storage_uri = "${azurerm_storage_account.swstorageaccount.primary_blob_endpoint}"
    }

    tags {
        environment = "${var.sw_env_tag}"
    }
}