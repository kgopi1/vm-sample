# # # # ## az vm image list --publisher MicrosoftSQLServer --all -o table
# #
  resource "azurerm_virtual_machine" "vm-windows" {
  name                          = "${var.vm_hostname}"
  location                      = "${var.location}"
  resource_group_name           = "${azurerm_resource_group.labrg.name}"
  #availability_set_id           = "${azurerm_availability_set.vm.id}"
  vm_size                       = "${var.vm_size}"
  network_interface_ids         = ["${azurerm_network_interface.vmnic.id}"]
  #delete_os_disk_on_termination = "${var.delete_os_disk_on_termination}"

  # storage_image_reference {
  #   id        = "${var.vm_os_id}"
  #   publisher = "${var.vm_os_id == "" ? coalesce(var.vm_os_publisher, module.os.calculated_value_os_publisher) : ""}"
  #   offer     = "${var.vm_os_id == "" ? coalesce(var.vm_os_offer, module.os.calculated_value_os_offer) : ""}"
  #   sku       = "${var.vm_os_id == "" ? coalesce(var.vm_os_sku, module.os.calculated_value_os_sku) : ""}"
  #   version   = "${var.vm_os_id == "" ? var.vm_os_version : ""}"
  # }

  storage_image_reference {
    #id        = "${var.vm_os_id}"
    publisher = "MicrosoftSQLServer"
    offer     = "SQL2016SP1-WS2016"
    sku       = "Standard"
    version   = "13.1.900302"
  }

  storage_os_disk {
    name              = "osdisk-${var.vm_hostname}-${count.index}"
    create_option     = "FromImage"
    caching           = "ReadWrite"
    managed_disk_type = "Premium_LRS"
  }

  os_profile {
    computer_name  = "${var.vm_hostname}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  #tags = "${var.tags}"

  os_profile_windows_config {
    provision_vm_agent = true
  }

  boot_diagnostics {
    enabled     = "true"
    storage_uri = "${azurerm_storage_account.sgacctname.primary_blob_endpoint}"
  }
}
