# create LB NAT rule

resource "azurerm_lb_nat_rule" "web_lb_inbound_nat_rule_22" {
  depends_on = [azurerm_linux_virtual_machine.web-linuxvm  ]
  for_each = var.web_linuxvm_instance_count
  name = "ssh-${each.key}-ssh-${each.value}-target-22"
  protocol = "Tcp"
  frontend_port = lookup(var.web_linuxvm_instance_count, each.key)
  # frontend_port = each.value
  backend_port = 22
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  loadbalancer_id = azurerm_lb.web_lb.id
  resource_group_name =  azurerm_resource_group.rg.name
}

# create NAT rule association with VM

resource "azurerm_network_interface_nat_rule_association" "web_nic_nat_rule_associate" {
  for_each = var.web_linuxvm_instance_count
  network_interface_id  = azurerm_network_interface.web_linuxvm_nic[each.key].id
  ip_configuration_name = azurerm_network_interface.web_linuxvm_nic[each.key].ip_configuration[0].name
  nat_rule_id           = azurerm_lb_nat_rule.web_lb_inbound_nat_rule_22[each.key].id
}