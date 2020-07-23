variable ibmcloud_api_key {
    description = "IBM API Key"
}

variable resource_group_name {
    description = "IBM Cloud Resource Group"
}

variable service_name {
  type        = string
  description = "The name that should be used for the service"
}

variable plan {
  type        = string
  description = "The type of plan the service instance should run under (lite, 7-day, 14-day, or 30-day)"
  default     = "lite"
}

variable resource_location {
  type        = string
  description = "Geographic location of the resource (e.g. us-south, us-east)"
}

variable cluster_id {
    description = "The kubernetes cluster id"
}

data "ibm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "ibm_container_cluster_config" "config" {
  cluster_name_id = var.cluster_id
  resource_group_id = data.ibm_resource_group.resource_group.id
}