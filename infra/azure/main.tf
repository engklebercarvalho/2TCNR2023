terraform {
  required_version = ">= 0.12"
}

################AZURE###################
#Configure the Azure Provider
provider "azurerm" {
  features {
   resource_group { prevent_deletion_if_contains_resources = false   }
  }
  version         = ">= 2.0"
  environment     = "public"
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
  
}



#Create Azure Public IPs
resource "azurerm_public_ip" "vm-public-ip" {
  name                = "${var.virtual_machine_RM}-pip"
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = "Dynamic"
}


#Create Azure Network Interface
resource "azurerm_network_interface" "vm-rm-nic" {
  name                = "${var.virtual_machine_RM}-nic"
  location            = var.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "vm-frontend-ip-configuration"
    subnet_id                     = var.subnet_id
    private_ip_address            = "10.155.10.4"
    private_ip_address_allocation = "Static"
    public_ip_address_id          = azurerm_public_ip.vm-public-ip.id
  }
}


#Create Azure Virtual Machines
resource "azurerm_virtual_machine" "vm-rm" {
  name                  = var.virtual_machine_RM
  location              = var.location
  resource_group_name   = var.resource_group
  network_interface_ids = [azurerm_network_interface.vm-rm-nic.id]
  vm_size               = "Standard_B1s"


  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "20.04.202010140"
  }
  storage_os_disk {
    name              = "${var.virtual_machine_RM}-OsDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "svc_Linux"
    admin_password = "AlunoFiap@2023!"
    custom_data    = file("azure-user-data.sh")
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = var.storage_account_uri
  }

  tags = {
    environment = "staging"
  }


}

