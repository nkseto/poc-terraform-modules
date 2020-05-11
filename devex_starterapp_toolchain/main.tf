resource "devex_app" "starterapp" {
  name                        = var.devex_app___starterapp___appname
  starter_kit_id              = var.devex_app___starterapp___starter_kit_id
  resource_group_id = data.ibm_resource_group.group.id
}

resource "devex_toolchain" "toolchain" {
  app_id                                  = devex_app.starterapp.app_id
  toolchain_name                          = var.devex_toolchain___toolchain___toolchain_name
  toolchain_resource_group_id             = data.ibm_resource_group.group.id
  deployment_type                         = var.devex_toolchain___toolchain___deployment_type
  deployment_cluster_region_id            = var.devex_toolchain___toolchain___deployment_cluster_region_id
  deployment_cluster_resource_group       = data.ibm_resource_group.group.name
  deployment_cluster_name                 = var.devex_toolchain___toolchain___deployment_cluster_name
  deployment_cluster_kube_namespace       = var.devex_toolchain___toolchain___deployment_cluster_kube_namespace
  deployment_container_registry_region_id = var.devex_toolchain___toolchain___deployment_container_registry_region_id
  deployment_container_registry_namespace = var.devex_toolchain___toolchain___deployment_container_registry_namespace
}
