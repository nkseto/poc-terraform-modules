resource "ibm_container_cluster" "cluster_instance" {
  count = var.cluster_exists == false ? 1 : 0
  name            = var.ibm_container_cluster___cluster_instance___name
  datacenter      = var.ibm_container_cluster___cluster_instance___datacenter
  default_pool_size = var.cluster_worker_count
  machine_type    = var.ibm_container_cluster___cluster_instance___machine_type
  hardware        = var.ibm_container_cluster___cluster_instance___hardware
  resource_group_id = data.ibm_resource_group.resource_group.id
  kube_version      = var.cluster_version
  public_vlan_id    = var.public_vlan_id
  private_vlan_id   = var.private_vlan_id  
  timeouts {
    create = "60m"
  }
}

locals {
  temp_dir = "${path.cwd}/.tmp"
  cluster_id_file = "cluster-id.txt"
  cluster_id = data.local_file.cluster_id.content != "" ? data.local_file.cluster_id.content : ibm_container_cluster.cluster_instance[0].id
  cluster_name = var.ibm_container_cluster___cluster_instance___name
}

resource "null_resource" "check_cluster" {
  count = var.cluster_exists != false ? 1 : 0
  provisioner "local-exec" {
    command = "${path.module}/scripts/check-cluster.sh"

    environment={
      APIKEY         = "${var.ibmcloud_api_key}"
      RESOURCE_GROUP  = "${var.ibmcloud_resource_group}"
      CLUSTER_NAME= "${var.ibm_container_cluster___cluster_instance___name}"
      TEMP_DIR = "${local.temp_dir}"
      FILE_NAME = "${local.cluster_id_file}"
    }
  }
  triggers = {
    cluster_name = "${var.ibm_container_cluster___cluster_instance___name}"
  }
}

data "local_file" "cluster_id" {
    depends_on = [null_resource.check_cluster]
    filename = "${local.temp_dir}/${local.cluster_id_file}"
}