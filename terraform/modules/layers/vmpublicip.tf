resource "azurerm_public_ip" "vmpublic" {
  #count                        = "${var.nb_public_ip}"
  name                         = "${var.vm_hostname}-publicIP"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.labrg.name}"
  public_ip_address_allocation = "dynamic"
  #domain_name_label            = "${element(var.public_ip_dns, count.index)}"
}
