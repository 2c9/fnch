# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/stringss
# Используется вместо random_password для наглядности в демонстрации
# и вывода на экран sensitive data
resource "random_string" "admin_passwd" {
  length = 12
  min_special = 2
  min_lower = 1
  min_upper = 1
  numeric = true
  min_numeric = 1
  override_special = "=-%.:"
}

# https://www.terraform.io/language/resources/provisioners/null_resource
# Ожидаем запуск backend сервисов CML2
# Производим смену пароля пользователя в CML2 после деплоя
# Скрипт написан на Powershell, так как компьютер участника иползует OS Windows
resource "null_resource" "passwords" {
  provisioner "local-exec" {
    environment = {
      admin_passwd = random_string.admin_passwd.result
      cml_uri = "${format("https://%s.${var.TF_DOMAIN_NAME}", join( "-", slice( reverse(split( ".", vcd_vapp_vm.vm.network[0].ip)), 0, 2)) )}"
    }
    command = "powershell -file ${path.cwd}/${path.module}/change.ps1"
    when = create
  }
  depends_on = [ vcd_vapp_vm.vm, random_string.admin_passwd ]
}