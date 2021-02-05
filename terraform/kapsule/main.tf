locals {
    k8s_cluster_name = terraform.workspace

    k8s_cluster_version = var.k8s_cluster_version
    k8s_cluster_cni = var.k8s_cluster_cni
    k8s_cluster_ingress = var.k8s_cluster_ingress
    k8s_cluster_enable_dashboard = var.k8s_cluster_enable_dashboard

    k8s_pool_name = "${local.k8s_cluster_name}_pool"

    k8s_pool_size = var.k8s_pool_size
    k8s_pool_node_type = var.k8s_pool_node_type
    
}

resource scaleway_k8s_cluster cluster {
  name    = local.k8s_cluster_name
  version = local.k8s_cluster_version
  cni     = local.k8s_cluster_cni
  ingress = local.k8s_cluster_ingress
  enable_dashboard = local.k8s_cluster_enable_dashboard
}

resource scaleway_k8s_pool cluster_pool {
  cluster_id = scaleway_k8s_cluster.cluster.id

  name       = local.k8s_pool_name
  node_type  = local.k8s_pool_node_type
  size       = local.k8s_pool_size
}