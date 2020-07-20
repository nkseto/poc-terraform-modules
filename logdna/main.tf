resource "ibm_resource_instance" "logdna_instance" {
  name              = var.service_name
  service           = "logdna"
  plan              = var.plan
  location          = var.resource_location
  resource_group_id = data.ibm_resource_group.resource_group.id
}

resource "ibm_resource_key" "logdna_instance_key" {
  name                 = "${var.service_name}-key"
  resource_instance_id = ibm_resource_instance.logdna_instance.id
  role                 = "Manager"
}

resource "null_resource" "bind_logdna" {
  provisioner "local-exec" {
    command = "${path.module}/scripts/bind-logdna.sh"

    environment={
      KUBECONFIG         = "${data.ibm_container_cluster_config.config.config_file_path}"
      REGION  = "${var.resource_location}"
      LOGDNA_AGENT_KEY = "${ibm_resource_key.logdna_instance_key.credentials.ingestion_key}"
    }
  }
}