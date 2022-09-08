# Выбираем датацентр
data "vsphere_datacenter" "dc" {
  name = "DatacenterDELLAllFlash"
}

# Выбираем кластер
data "vsphere_compute_cluster" "cluster" {
  name          = "ClusterDELLAllFlash"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Выбираем folder для виртуальных машин
data "vsphere_folder" "folder" {
  path          = "FNCH2022"
}

# Выбираем ресурс пул
data "vsphere_resource_pool" "pool" {
  name          = "FNCH2022"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Выбираем хранилку
data "vsphere_datastore" "ds" {
  name          = "vsanDatastore"
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Выбираем сеть
data "vsphere_network" "network" {
    name       = "DPGAllFlashVLAN1"
    datacenter_id = data.vsphere_datacenter.dc.id
}

# Выбираем шаблон
data "vsphere_virtual_machine" "template" {
  name          = "cmltestTM2ovf2"
  datacenter_id = data.vsphere_datacenter.dc.id
}