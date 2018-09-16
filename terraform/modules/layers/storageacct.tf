resource "azurerm_storage_account" "sgacctname" {
  name                     = "${var.sgname}"
  resource_group_name      = "${azurerm_resource_group.labrg.name}"
  location                 = "${var.location}"
  account_tier             = "${var.sgkind}"
  account_replication_type = "${var.sgsku}"
#   tags = "${merge(map(
#     "Description", "${var.tags["environment"]} storageAccount"),
#     var.tags
# )}"

}
