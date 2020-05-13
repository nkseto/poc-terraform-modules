resource "ibm_container_cluster" "cluster_instance" {
  name            = var.ibm_container_cluster___cluster_instance___name
  datacenter      = var.ibm_container_cluster___cluster_instance___datacenter
  machine_type    = var.ibm_container_cluster___cluster_instance___machine_type
  hardware        = var.ibm_container_cluster___cluster_instance___hardware
  resource_group_id = data.ibm_resource_group.group.id
  timeouts {
    create = "60m"
  }
}