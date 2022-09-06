output "properties" {
   description = "VM and CML properties"
   value = module.vapp-vm[*].properties
}