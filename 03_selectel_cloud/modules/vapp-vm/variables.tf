variable "TF_VAPP_NAME" {
    description = "Имя создаваемого vAPP"
    type = string
    default = "cml240"
}

variable "TF_VM_NAME" {
    description = "Имя создаваемой VM"
    type = string
}

variable "TF_CATALOG_NAME" {
    description = "Имя каталога"
    type = string
    default = "kp11"
}

variable "TF_TEMPLATE_NAME" {
    description = "Имя шаблона в каталоге"
    type = string
    default = "cml240"
}

variable "TF_VM_CPUS" {
    description = "Количество процессоров на создаваемой VM"
    type = number
    default = 4
}

variable "TF_VM_CPU_CORES" {
    description = "Количество сокетов на создаваемой VM"
    type = number
    default = 1
}

variable "TF_VM_RAM" {
    description = "Размер памяти создаваемой VM"
    type = number
    default = 8192
}

variable "TF_LAN_NAME" {
    description = "Имя создаваемой сети организации в VCD"
    type = string
}

variable "TF_DOMAIN_NAME" {
    description = "Доменное имя для подключения к CML2 из вне"
    type = string
    default = "wsr39.ru"
}