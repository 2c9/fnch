resource "vsphere_virtual_machine" "cml2-fnch-01" {

    name             = "cml2-fnch-01"
    folder           = data.vsphere_folder.folder.path
    resource_pool_id = data.vsphere_resource_pool.pool.id
    datastore_id     = data.vsphere_datastore.ds.id

    num_cpus = 4
    memory   = 8192
    nested_hv_enabled = true
    
    firmware = "efi"
    guest_id = data.vsphere_virtual_machine.template.guest_id
    scsi_type = data.vsphere_virtual_machine.template.scsi_type

    network_interface {
        network_id   = data.vsphere_network.network.id
        adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
    }

    disk {
        label            = "disk0"
        size             = data.vsphere_virtual_machine.template.disks.0.size
        eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
        thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    }

    clone {
      template_uuid = data.vsphere_virtual_machine.template.id
      linked_clone  = true
    }
}

resource "vsphere_virtual_machine" "cml2-fnch-02" {

    name             = "cml2-fnch-02"
    folder           = data.vsphere_folder.folder.path
    resource_pool_id = data.vsphere_resource_pool.pool.id
    datastore_id     = data.vsphere_datastore.ds.id

    num_cpus = 4
    memory   = 8192
    nested_hv_enabled = true
    
    firmware = "efi"
    guest_id = data.vsphere_virtual_machine.template.guest_id
    scsi_type = data.vsphere_virtual_machine.template.scsi_type

    network_interface {
        network_id   = data.vsphere_network.network.id
        adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
    }

    disk {
        label            = "disk0"
        size             = data.vsphere_virtual_machine.template.disks.0.size
        eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
        thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    }

    clone {
      template_uuid = data.vsphere_virtual_machine.template.id
      linked_clone  = true
    }
}

resource "vsphere_virtual_machine" "cml2-fnch-03" {

    name             = "cml2-fnch-03"
    folder           = data.vsphere_folder.folder.path
    resource_pool_id = data.vsphere_resource_pool.pool.id
    datastore_id     = data.vsphere_datastore.ds.id

    num_cpus = 4
    memory   = 8192
    nested_hv_enabled = true
    
    firmware = "efi"
    guest_id = data.vsphere_virtual_machine.template.guest_id
    scsi_type = data.vsphere_virtual_machine.template.scsi_type

    network_interface {
        network_id   = data.vsphere_network.network.id
        adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
    }

    disk {
        label            = "disk0"
        size             = data.vsphere_virtual_machine.template.disks.0.size
        eagerly_scrub    = data.vsphere_virtual_machine.template.disks.0.eagerly_scrub
        thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    }

    clone {
      template_uuid = data.vsphere_virtual_machine.template.id
      linked_clone  = true
    }
}