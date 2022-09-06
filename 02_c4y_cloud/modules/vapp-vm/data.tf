# Ref: https://registry.terraform.io/providers/vmware/vcd/latest/docs/resources/vapp
data "vcd_vapp" "vapp" {
  name      = var.TF_VAPP_NAME
}

# Ref: https://registry.terraform.io/providers/vmware/vcd/latest/docs/resources/vapp_org_network
data "vcd_vapp_org_network" "vapp-net" {
  vapp_name        = var.TF_VAPP_NAME
  org_network_name = var.TF_LAN_NAME
}