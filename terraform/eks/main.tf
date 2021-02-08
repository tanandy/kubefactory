###
# AWS User and Key
###

resource "aws_iam_user" "eks" {
  name = "rancher-eks"
}

resource "aws_iam_policy" "eks" {
  name = "eks"
  # user = aws_iam_user.eks.name

  policy = data.aws_iam_policy_document.eks.json
}

resource "aws_iam_user_policy_attachment" "eks" {
  user       = aws_iam_user.eks.name
  policy_arn = aws_iam_policy.eks.arn
}

resource "aws_iam_access_key" "eks" {
  user = aws_iam_user.eks.name
}


###
# Rancher
###

resource "rancher2_cloud_credential" "foo" {
  name        = "foo"
  description = "foo test"
  amazonec2_credential_config {
    access_key = aws_iam_access_key.eks.id
    secret_key = aws_iam_access_key.eks.secret
  }
}
resource "rancher2_cluster" "foo" {
  name        = "foo2"
  description = "Rancher EKS cluster"
  eks_config_v2 {
    cloud_credential_id = rancher2_cloud_credential.foo.id
    region              = "eu-west-1"
    kubernetes_version  = "1.18"
    logging_types       = ["audit", "api"]
    node_groups {
      name          = "node_group1"
      instance_type = "t3.medium"
      desired_size  = 3
      max_size      = 5
    }
    node_groups {
      name          = "node_group2"
      instance_type = "m5.xlarge"
      desired_size  = 2
      max_size      = 3
    }
  }
}
