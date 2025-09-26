variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for NIC"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2s"
  description = "VM size"
}

variable "admin_username" {
  type        = string
  description = "Admin username for VM"
}

variable "ssh_public_key" {
  type        = string
  description = "Admin SSH public key"
}

variable "image_publisher" {
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  type        = string
  default     = "18.04-LTS"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
