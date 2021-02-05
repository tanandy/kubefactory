output apiserver_url {
    value = scaleway_k8s_cluster.cluster.apiserver_url
}

output wildcard_dns {
    value = scaleway_k8s_cluster.cluster.wildcard_dns
}

output kubeconfig_file {
    value = scaleway_k8s_cluster.cluster.kubeconfig[0].config_file
}

output kubeconfig_host {
    value = scaleway_k8s_cluster.cluster.kubeconfig[0].host
}

output kubeconfig_token {
    value = scaleway_k8s_cluster.cluster.kubeconfig[0].token
}

output kubeconfig_cluster_ca_certificate {
    value = scaleway_k8s_cluster.cluster.kubeconfig[0].cluster_ca_certificate
}
