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

variable "TF_LAN_NAME" {
    description = "Имя создаваемой сети организации в VCD"
    type = string
}

variable "TF_TAG" {
  description = "Тэг ресурсов"
  type        = map(string)
}

################

variable "TF_VAPP_NAME" {
    description = "Имя создаваемого vAPP"
    type = string
    default = "vapp-1"
}

variable "TF_CATALOG_NAME" {
    description = "Имя каталога"
    type = string
}

variable "TF_TEMPLATE_NAME" {
    description = "Имя шаблона в каталоге"
    type = string
}

variable "TF_VM_CPUS" {
    description = "Количество процессоров на создаваемой VM"
    type = number
    default = 1
}

variable "TF_VM_CPU_CORES" {
    description = "Количество сокетов на создаваемой VM"
    type = number
    default = 1
}

variable "TF_VM_RAM" {
    description = "Размер памяти создаваемой VM"
    type = number
    default = 1024
}