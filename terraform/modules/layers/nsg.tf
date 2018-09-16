resource "azurerm_network_security_group" "labnsg" {
  #depends_on          = ["module.vnet"]
  name                = "labnsg01"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.labrg.name}"

  security_rule {
    name                       = "gopirdp123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "86.0.230.142"
    destination_address_prefix = "*"
  }

}
