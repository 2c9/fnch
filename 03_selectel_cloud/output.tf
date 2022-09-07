# Выводим на экран данные о развернутых CML из модулей 
output "properties" {
   description = "VM and CML properties"
   value = module.vapp-vm[*].properties
}