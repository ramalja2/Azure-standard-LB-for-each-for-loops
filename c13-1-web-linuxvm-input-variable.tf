# linux VM instance count
variable "web_linuxvm_instance_count" {
  description = "Web linux VM instance count"
  type = map(string)
  default = {
    "vm1" = "1022"
    "vm2" = "2022"
  }
}

