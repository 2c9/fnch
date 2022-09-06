# Ref: https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/vapp
resource "vcd_vapp_vm" "vm" {
  vapp_name     = data.vcd_vapp.vapp.name
  name          = var.TF_VM_NAME
  catalog_name  = var.TF_CATALOG_NAME
  template_name = var.TF_TEMPLATE_NAME
  memory        = var.TF_VM_RAM
  cpus          = var.TF_VM_CPUS
  cpu_cores     = var.TF_VM_CPU_CORES

  expose_hardware_virtualization = true

  # guest_properties = {
  #   "local-hostname"      = "cloud-cml2"
  #   "user-data"  = base64encode(file("${path.cwd}/user-data.yaml"))
  # }

  network {
      name               = "${var.TF_LAN_NAME}"
      adapter_type       = "VMXNET3"
      type               = "org"
      ip_allocation_mode = "POOL"
      is_primary         = true
  }
  
}