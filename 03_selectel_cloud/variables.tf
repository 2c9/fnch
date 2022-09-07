# Колличество CML2
variable "TF_CML_COUNT" {
    description = "Колличество CML2"
    type = number
    default = 2
}

# Переменные для работы с VCD
variable "TF_VCD_ORG" {
    description = "Имя нашей организации в облаке"
    type = string
}

variable "TF_VCD_USER" {
    description = "Имя пользователя для доступа к vCD"
    type = string
}
variable "TF_VCD_PASSWORD" {
    description = "Пароль пользователя для доступа к vCD"
    type = string
}

variable "TF_VCD_VDC" {
    description = "Имя нашего VDC"
    type = string
}

variable "TF_VCD_URL" {
    description = "vCD Tenant API URL"
    type = string
}

variable "TF_VCD_ORG_MAX_RETRY_TIMEOUT" {
  description = "Retry Timeout"
  type = number
  default = 240
}