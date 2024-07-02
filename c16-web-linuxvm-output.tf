# Different output with terraform For Loops

## output List - single input to For loop
output "web_linuxvm_private_ip_address_list" {
  description = "Web Linux VM Private IP Addresses list"
  value = [for vm in azurerm_linux_virtual_machine.web-linuxvm: vm.private_ip_addresses]
}

## output Map - single input to For loop
output "web_linuxvm_private_ip_address_map" {
  description = "Web Linux VM Private IP Addresses Map"
  value = {for vm in azurerm_linux_virtual_machine.web-linuxvm: vm.name =>vm.private_ip_addresses}
}

## Terraform key() function : Keys take a map and return a list containing key from the map
output "web_linuxvm_private_ip_address_keys_function" {
  description = "Web Linux VM Private IP Addresses key function"
  value = keys({for vm in azurerm_linux_virtual_machine.web-linuxvm: vm.name => vm.private_ip_address })
}


## Terraform value() function : Keys take a map and return a list containing key from the map
output "web_linuxvm_private_ip_address_values_function"  {
  description = "Web Linux VM Private IP Addresses value function"
  value = values({for vm in azurerm_linux_virtual_machine.web-linuxvm: vm.name => vm.private_ip_address })
}


# Output List - Two Inputs to for loop (here vm is Iterator like "i")
output "web_linuxvm_network_interface_id_list" {
  description = "Web Linux VM Network Interface ID"
  value = [for vm, nic in azurerm_linux_virtual_machine.web-linuxvm: nic.id]
}

# Output Map  - Two Inputs to for loop (here vm is Iterator like "i")
output "web_linuxvm_network_interface_id_map" {
  description = "Web Linux VM Network Interface ID"
  value = {for vm, nic in azurerm_linux_virtual_machine.web-linuxvm: vm => nic.id}
}

