output "properties" {
   value = {
      "IP address" = vcd_vapp_vm.vm.network[0].ip
      "VM URI" = "${format("https://%s.wsr39.ru", join( "-", slice( reverse(split( ".", vcd_vapp_vm.vm.network[0].ip)), 0, 2)) )}"
      "CML2 user" = "admin"
      "CML2 password" = random_string.admin_passwd.result
   }
}