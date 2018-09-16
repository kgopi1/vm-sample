variable "rgname" {
  default = "cloudopslab-rg"
}

variable "location" {
  default = "northeurope"
}

variable "labvnetname" {
  default= "labvnet-prd"
}


variable "vnetaddspace" {
  default = "192.168.0.0/16"
}


variable "subnetname" {
  default = "labsubnet-prd"
}

variable "subnetaddspace" {
  default = "192.168.0.0/24"
}

variable "vm_hostname" {
  default = "dazwin00001"
}

variable "vm_size" {
  default = "Standard_DS12_v2"
}

variable "admin_username" {
  description = "The admin username of the VM that will be deployed"
  default     = "azureuser"
}
variable "admin_password" {
  description = "The admin password to be used on the VMSS that will be deployed. The password must meet the complexity requirements of Azure"
  default     = "@zadm1n1234"
}

variable "sgname" {
  default = "labsg01"
}

variable "sgkind" {
  default = "Standard"
}

variable "sgsku" {
    default = "LRS"
}
