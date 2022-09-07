# Используем модуль vapp-vm для развертывания нужного колличества CML2
# TF_CML_COUNT находится в ./variables.tf
module "vapp-vm" {
    count                 = var.TF_CML_COUNT
    source                = "./modules/vapp-vm"
    TF_VAPP_NAME          = "cml240"
    TF_VM_NAME            = "cml2-lab-${count.index}"
    TF_TEMPLATE_NAME      = "cml240"
    TF_CATALOG_NAME       = "kp11"
    TF_LAN_NAME           = "cml2-nsalab-tf-project.PROD"
}