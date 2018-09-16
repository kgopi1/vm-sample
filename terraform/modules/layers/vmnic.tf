resource "azurerm_network_interface" "vmnic" {
  name                      = "nic-${var.vm_hostname}"
  location                  = "${var.location}"
  resource_group_name       = "${azurerm_resource_group.labrg.name}"
  network_security_group_id = "${azurerm_network_security_group.labnsg.id}"

  ip_configuration {
    name                          = "ipconfignic01"
    subnet_id                     = "${azurerm_subnet.labsubnet.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.vmpublic.id}"
}
}
