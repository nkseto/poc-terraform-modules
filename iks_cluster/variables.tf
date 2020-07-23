
variable ibmcloud_api_key {
    description = "IBM API Key"
}

variable resource_group_name {
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

variable cluster_worker_count {
  description = "The number of worker nodes for the cluster"
  default     = 1 
}

variable "cluster_version" {
  type        = string
  description = "The IKS cluster version to install. Use `ibmcloud ks versions` to see a list of cluster versions"
  default     = "1.17.7"
}

variable "private_vlan_id" {
  type        = string
  description = "Existing private VLAN id for cluster creation. Use `ibmcloud ks vlan ls --zone <zone>` to see a list of available private vlans."
  default = ""
}

variable "public_vlan_id" {
  type        = string
  description = "Existing public VLAN number for cluster creation. Use `ibmcloud ks vlan ls --zone <zone>` to see a list of available public vlans."
  default = ""
}

variable cluster_exists {
    description = "Does cluster exist"
    type = bool
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}