output "vm_id" {
  description = "The ID of the VM"
  value       = azurerm_linux_virtual_machine.this.id
}

output "vm_private_ip" {
  description = "The private IP of the VM"
  value       = azurerm_network_interface.this.ip_configuration[0].private_ip_address
}
