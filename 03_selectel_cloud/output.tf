output "vm1_ip_address" {
   description = "Local IPv4 address of VM1"
   value = vcd_vapp_vm.vm1.network[0].ip
}

output "vm1_ip_uri" {
   description = "VM1 - URI"
   value = "${format("https://%s.wsr39.ru", join( "-", slice( reverse(split( ".", vcd_vapp_vm.vm1.network[0].ip)), 0, 2)) )}"
}

######

output "vm2_ip_address" {
   description = "Local IPv4 address of VM2"
   value = vcd_vapp_vm.vm2.network[0].ip
}

output "vm2_ip_uri" {
   description = "VM2 - URI"
   value = "${format("https://%s.wsr39.ru", join( "-", slice( reverse(split( ".", vcd_vapp_vm.vm2.network[0].ip)), 0, 2)) )}"
}