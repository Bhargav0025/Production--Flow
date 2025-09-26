variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
  default     = "eastus"
}

variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "admin_username" {
  description = "VM admin username"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "tags" {
  description = "Tags for all resources"
  type        = map(string)
  default     = {}
}
