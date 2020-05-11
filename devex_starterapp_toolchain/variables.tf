variable devex_app___starterapp___appname {
    description = "Starter app name"
}

variable devex_app___starterapp___starter_kit_id {
    description = "Starter kit id"
}

variable devex_toolchain___toolchain___toolchain_name {
    description = "Toolchain name"
}

variable devex_toolchain___toolchain___deployment_type {
    description = "Toolchain deployment type"
    default="KUBE"
}

variable devex_toolchain___toolchain___deployment_cluster_name {
    description = "The kubernetes cluster name"
}

variable devex_toolchain___toolchain___deployment_cluster_region_id {
    description = "The Kubernetes cluster region id"
}

variable devex_toolchain___toolchain___deployment_cluster_kube_namespace {
    description = "The Kubernetes namespace to deploy toolchain"
    default = "default"
}

variable devex_toolchain___toolchain___deployment_container_registry_region_id {
    description = "The container registry region id"
    default = "ibm:yp:us-south"
}

variable devex_toolchain___toolchain___deployment_container_registry_namespace {
    description = "The container registry namespace"
}

variable ibmcloud_resource_group {
    description = "IBM Cloud Resource Group"
}

data "ibm_resource_group" "group" {
  name = var.ibmcloud_resource_group
}