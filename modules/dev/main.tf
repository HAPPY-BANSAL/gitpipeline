module "resource_group" {
  source          = "../../azurem_resource_group"
  resource_groups = var.rgs
}

module "virtual_network" {
  depends_on       = [module.resource_group]
  source           = "../../azurerm_virtual_network"
  virtual_networks = var.virtual_networks
}

module "subnet" {
  depends_on = [module.virtual_network]
  source     = "../../azurerm_subnet"
  subnets    = var.subnets
}



module "vm" {
  depends_on = [module.subnet]
  source     = "../../azurerm_virtual_machine"
  vms        = var.vms

}

module "bastion" {
  depends_on = [module.subnet]
  source     = "../../azurerm_bastion"
  bastion    = var.bastion
}