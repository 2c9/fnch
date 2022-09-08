output "vm_ip_address" {
   description = "Local IPv4 address of VM"
   value = vsphere_virtual_machine.cml2-fnch[*].default_ip_address
}