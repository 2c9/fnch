terraform {
  # Ref: https://registry.terraform.io/providers/vmware/vcd/latest/docs  
  required_providers {
    vcd = {
      source = "VMware/vcd"
      version  = ">= 3.4.0"
    }
  }
}

# Ref: https://registry.terraform.io/providers/vmware/vcd/latest/docs
provider "vcd" {
  user                  = var.TF_VCD_USER
  password              = var.TF_VCD_PASSWORD
  org                   = var.TF_VCD_ORG 
  vdc                   = var.TF_VCD_VDC 
  url                   = var.TF_VCD_URL 
  allow_unverified_ssl  = true
  max_retry_timeout     = var.TF_VCD_ORG_MAX_RETRY_TIMEOUT
}