
variable ibmcloud_resource_group {
    description = "IBM Cloud Resource Group"
}


variable ibm_container_cluster___cluster_instance___name {
    description = "IBM Kube cluster name"
}

variable ibm_container_cluster___cluster_instance___datacenter {
    description = "IBM Kube cluster datacenter"
}

variable ibm_container_cluster___cluster_instance___machine_type {
    description = "IBM Kube cluster machine type"
    default = "free"
}

variable ibm_container_cluster___cluster_instance___hardware {
    description = "IBM Kube cluster hardware"
    default = "shared"
}

data "ibm_resource_group" "group" {
  name = var.ibmcloud_resource_group
}