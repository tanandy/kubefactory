resource "rancher2_cloud_credential" "foo" {
  name = "foo"
  description = "foo test"
  amazonec2_credential_config {
    access_key = ""
    secret_key = ""
  }
}

terraform {
  required_providers {
    rancher2 = {
      source = "rancher/rancher2"
      version = "1.11.0"
    }
  }
}

provider "rancher2" {
  api_url   = "https://rancher.k3S.lab.wescale.fr"
  access_key = "token-wh6bj"
  secret_key = "rqmq45cdxz5bcvhn4fqmrpxrpph5bvzx67fm9l4jzq6pjzhxskbbzn"
}

resource "rancher2_cluster" "foo" {
  name = "foo2"
  description = "Rancher EKS cluster"
  eks_config_v2 {
    cloud_credential_id = rancher2_cloud_credential.foo.id
    region = "eu-west-1"
    kubernetes_version = "1.18"
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