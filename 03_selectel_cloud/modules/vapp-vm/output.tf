# Выводим данные о CML2
output "properties" {
   value = {
      "ip-address"    = vcd_vapp_vm.vm.network[0].ip
      "vm-uri"        = "${format("https://%s.wsr39.ru", join( "-", slice( reverse(split( ".", vcd_vapp_vm.vm.network[0].ip)), 0, 2)) )}"
      "cml2-user"     = "admin"
      "cml2-password" = random_string.admin_passwd.result
      "os-user"       = "sysadmin"
      "os-password"   = random_string.sysadmin_passwd.result
   }
}