# Ref: https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/vapp
resource "vcd_vapp_vm" "vm" {
  vapp_name     = data.vcd_vapp.vapp.name
  name          = var.TF_VM_NAME
  catalog_name  = var.TF_CATALOG_NAME
  template_name = var.TF_TEMPLATE_NAME
  memory        = var.TF_VM_RAM
  cpus          = var.TF_VM_CPUS
  cpu_cores     = var.TF_VM_CPU_CORES

  # Enable Nested virtualization
  expose_hardware_virtualization = true

  # Trying to send user-data
  guest_properties = {
    "instance-id"       = format("%s", var.TF_VM_NAME)
    "local-hostname"    = format("%s", var.TF_VM_NAME)
    "userdata"          = base64encode(file("${path.cwd}/user-data.yaml"))   
  }

  # Init script for customization and changing sysadmin's password
  customization {
    enabled    = true
    initscript = templatefile("${path.cwd}/initialization.sh", { password = "Pa$$w0rd" })
  }

  # Connecting to VCD network
  network {
      name               = "${var.TF_LAN_NAME}"
      adapter_type       = "VMXNET3"
      type               = "org"
      ip_allocation_mode = "POOL"
      is_primary         = true
  }
}