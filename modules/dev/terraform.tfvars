rgs = {
  rg1 = {
    name     = "dev-rg1"
    location = "East US"
  }
}

virtual_networks = {
  vnet1 = {
    name                = "dev-vnet1"
    address_space       = ["10.0.0.0/16"]
    resource_group_name = "dev-rg1"
    location            = "East US"
  }
}

subnets = {
  subnet1 = {
    name                 = "dev-subnet1"
    resource_group_name  = "dev-rg1"
    virtual_network_name = "dev-vnet1"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "dev-rg1"
    virtual_network_name = "dev-vnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

vms = {
  vm1 = {
    name                          = "dev-vm1"
    resource_group_name           = "dev-rg1"
    location                      = "East US"
    size                          = "Standard_D2s_v3"
    admin_username                = "adminuser"
    admin_password                = "P@ssword1234!"
    nic_name                      = "dev-vm1-nic"
    ip_name                       = "dev-vm1-ip"
    private_ip_address_allocation = "Dynamic"
    subnet_name                   = "dev-subnet1"
    virtual_network_name          = "dev-vnet1"
    caching                       = "ReadWrite"
    storage_account_type          = "Standard_LRS"
    publisher                     = "Canonical"
    offer                         = "UbuntuServer"
    sku                           = "18.04-LTS"
    version                       = "latest"
  }
}

bastion = {
  bastion1 = {
    name                 = "dev-bastion1"
    resource_group_name  = "dev-rg1"
    location             = "East US"
    ip_name              = "dev-bastion1-ipconfig"
    subnet_name          = "AzureBastionSubnet"
    virtual_network_name = "dev-vnet1"


  }
}