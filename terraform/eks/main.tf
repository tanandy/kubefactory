resource "rancher2_cloud_credential" "foo" {
  name = "foo"
  description = "foo test"
  amazonec2_credential_config {
    access_key = "<AWS_ACCESS_KEY>"
    secret_key = "<AWS_SECRET_KEY>"
  }
}
resource "rancher2_cluster" "foo" {
  name = "foo"
  description = "Rancher EKS cluster"
  eks_config_v2 {
    cloud_credential_id = rancher2_cloud_credential.foo.id
    region = "<EKS_REGION>"
    kubernetes_version = "1.17"
    logging_types = ["audit", "api"]
    node_groups {
      name = "node_group1"
      instance_type = "t3.medium"
      desired_size = 3
      max_size = 5
    }
    node_groups {
      name = "node_group2"
      instance_type = "m5.xlarge"
      desired_size = 2
      max_size = 3
    }
  }
}