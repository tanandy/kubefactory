variable k8s_cluster_version {
  default = "1.20.2"
}

variable k8s_cluster_cni {
    default = "calico"
}

variable k8s_pool_size {
    default = 3
}

variable k8s_pool_node_type {
  default = "DEV1_M"
}
    
variable k8s_cluster_enable_dashboard {
  default = false
}
 
variable k8s_cluster_ingress {
  default = "traefik"
}
