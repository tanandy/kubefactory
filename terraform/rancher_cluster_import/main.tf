locals {
  cluster_name = var.cluster_name
}

resource "rancher2_cluster" "imported" {
  name = local.cluster_name
}

output "registration_command" {
  value = rancher2_cluster.imported.cluster_registration_token.0.command
}

output "registration_manifest_url" {
  value = rancher2_cluster.imported.cluster_registration_token.0.manifest_url
}