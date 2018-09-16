resource "azurerm_managed_disk" "vmdisk" {
  count = 3
  name                 = "datadisk-${var.vm_hostname}-${count.index}"
  location             = "${azurerm_resource_group.labrg.location}"
  resource_group_name  = "${azurerm_resource_group.labrg.name}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}


resource "azurerm_virtual_machine_data_disk_attachment" "vmdiskattach" {
  count = 3
  managed_disk_id    = "${azurerm_managed_disk.vmdisk.*.id[count.index]}"
  virtual_machine_id = "${azurerm_virtual_machine.vm-windows.id}"
  lun                = "${count.index}"
  caching            = "ReadWrite"
}
