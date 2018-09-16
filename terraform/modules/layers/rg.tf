resource "azurerm_resource_group" "labrg" {
  name = "${var.rgname}"
  location = "${var.location}"
}
