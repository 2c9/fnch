terraform {
  required_providers {
    vsphere = {
        source = "hashicorp/vsphere"
    }
  }
}

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "DatacenterDELLAllFlash"
}

data "vsphere_datastore" "ds" {
  name          = "vsanDatastore"
  datacenter_id = data.vsphere_datacenter.dc.id
}

###################################################

data "vsphere_virtual_machine" "template" {
  name          = "cmltestTM2ovf2"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
    name       = "DPGAllFlashVLAN1"
    datacenter_id = data.vsphere_datacenter.dc.id
}

###################################################

data "vsphere_compute_cluster" "cluster" {
  name          = "ClusterDELLAllFlash"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "FNCH2022"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_folder" "folder" {
  path          = "FNCH2022"
}