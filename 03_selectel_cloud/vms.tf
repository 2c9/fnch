# Ref: https://registry.terraform.io/providers/vmware/vcd/latest/docs/data-sources/vapp
resource "vcd_vapp_vm" "vm1" {
  vapp_name     = data.vcd_vapp.vapp.name
  name          = "cml2-lab-01"
  catalog_name  = var.TF_CATALOG_NAME
  template_name = var.TF_TEMPLATE_NAME
  memory        = var.TF_VM_RAM
  cpus          = var.TF_VM_CPUS
  cpu_cores     = var.TF_VM_CPU_CORES

  expose_hardware_virtualization = true

  network {
      name               = "${var.TF_LAN_NAME}"
      adapter_type       = "VMXNET3"
      type               = "org"
      ip_allocation_mode = "POOL"
      is_primary         = true
  }
  
  depends_on = [ data.vcd_vapp_org_network.vapp-net ]

}

resource "vcd_vapp_vm" "vm2" {
  vapp_name     = data.vcd_vapp.vapp.name
  name          = "cml2-lab-02"
  catalog_name  = var.TF_CATALOG_NAME
  template_name = var.TF_TEMPLATE_NAME
  memory        = var.TF_VM_RAM
  cpus          = var.TF_VM_CPUS
  cpu_cores     = var.TF_VM_CPU_CORES

  expose_hardware_virtualization = true

  network {
      name               = "${var.TF_LAN_NAME}"
      adapter_type       = "VMXNET3"
      type               = "org"
      ip_allocation_mode = "POOL"
      is_primary         = true
  }
  
  depends_on = [ data.vcd_vapp_org_network.vapp-net ]

}