output "vm1_ip_address" {
   description = "Local IPv4 address of VM1"
   value = vsphere_virtual_machine.cml2-fnch-01.default_ip_address
}

output "vm2_ip_address" {
   description = "Local IPv4 address of VM2"
   value = vsphere_virtual_machine.cml2-fnch-02.default_ip_address
}

output "vm3_ip_address" {
   description = "Local IPv4 address of VM3"
   value = vsphere_virtual_machine.cml2-fnch-03.default_ip_address
}