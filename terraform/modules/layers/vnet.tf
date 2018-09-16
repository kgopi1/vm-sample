resource "azurerm_virtual_network" "labvnet" {
  name = "${var.labvnetname}"
  resource_group_name = "${azurerm_resource_group.labrg.name}"
  location = "${var.location}"
  address_space = ["${var.vnetaddspace}"]
}
