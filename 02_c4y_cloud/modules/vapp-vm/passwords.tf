# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
# Используется вместо random_password для наглядности в демонстрации
# и вывода на экран sensitive data
resource "random_string" "admin_passwd" {
  length           = 12
  min_special      = 2
  min_lower        = 1
  min_upper        = 1
  numeric          = true
  min_numeric      = 1
  override_special = "=-%.:"
}

# https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
# Используется вместо random_password для наглядности в демонстрации
# и вывода на экран sensitive data
resource "random_string" "sysadmin_passwd" {
  length      = 8
  min_lower   = 1
  min_upper   = 1
  numeric     = true
  special     = false
  min_numeric = 1
}