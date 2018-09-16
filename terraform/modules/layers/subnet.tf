resource "azurerm_subnet" "labsubnet" {
  name = "${var.subnetname}"
  resource_group_name = "${azurerm_resource_group.labrg.name}"
  virtual_network_name = "${azurerm_virtual_network.labvnet.name}"
  address_prefix = "${var.subnetaddspace}"
}
