data "aws_iam_policy_document" "eks" {
  statement {
    sid = "EC2Permisssions"

    actions = [
      "ec2:RevokeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:DescribeVpcs",
      "ec2:DescribeTags",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeRouteTables",
      "ec2:DescribeKeyPairs",
      "ec2:DescribeInternetGateways",
      "ec2:DescribeImages",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeAccountAttributes",
      "ec2:DeleteTags",
      "ec2:DeleteSecurityGroup",
      "ec2:DeleteKeyPair",
      "ec2:CreateTags",
      "ec2:CreateSecurityGroup",
      "ec2:CreateKeyPair",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:ReplaceRoute",
      "ec2:ModifyVpcAttribute",
      "ec2:ModifySubnetAttribute",
      "ec2:DisassociateRouteTable",
      "ec2:DetachInternetGateway",
      "ec2:DescribeVpcs",
      "ec2:DeleteVpc",
      "ec2:DeleteSubnet",
      "ec2:DeleteRouteTable",
      "ec2:DeleteRoute",
      "ec2:DeleteInternetGateway",
      "ec2:CreateVpc",
      "ec2:CreateSubnet",
      "ec2:CreateRouteTable",
      "ec2:CreateRoute",
      "ec2:CreateInternetGateway",
      "ec2:AttachInternetGateway",
    ]

    resources = ["*"]
  }

  statement {
    sid = "CloudFormationPermisssions"

    actions = [
      "cloudformation:ListStacks",
      "cloudformation:ListStackResources",
      "cloudformation:DescribeStacks",
      "cloudformation:DescribeStackResources",
      "cloudformation:DescribeStackResource",
      "cloudformation:DeleteStack",
      "cloudformation:CreateStackSet",
      "cloudformation:CreateStack"
    ]

    resources = ["*"]
  }

  statement {
    sid = "IAMPermissions"

    actions = [
      "iam:PassRole",
      "iam:ListRoles",
      "iam:ListRoleTags",
      "iam:ListInstanceProfilesForRole",
      "iam:ListInstanceProfiles",
      "iam:ListAttachedRolePolicies",
      "iam:GetRole",
      "iam:GetInstanceProfile",
      "iam:DetachRolePolicy",
      "iam:DeleteRole",
      "iam:CreateRole",
      "iam:AttachRolePolicy",
      "iam:AddRoleToInstanceProfile",
      "iam:CreateInstanceProfile",
      "iam:CreateServiceLinkedRole",
      "iam:DeleteInstanceProfile",
      "iam:RemoveRoleFromInstanceProfile"
    ]

    resources = ["*"]
  }

  statement {
    sid = "KMSPermisssions"

    actions = ["kms:ListKeys"]

    resources = ["*"]
  }

  statement {
    sid = "EKSPermisssions"

    actions = [
      "eks:UpdateNodegroupVersion",
      "eks:UpdateNodegroupConfig",
      "eks:UpdateClusterVersion",
      "eks:UpdateClusterConfig",
      "eks:UntagResource",
      "eks:TagResource",
      "eks:ListUpdates",
      "eks:ListTagsForResource",
      "eks:ListNodegroups",
      "eks:ListFargateProfiles",
      "eks:ListClusters",
      "eks:DescribeUpdate",
      "eks:DescribeNodegroup",
      "eks:DescribeFargateProfile",
      "eks:DescribeCluster",
      "eks:DeleteNodegroup",
      "eks:DeleteFargateProfile",
      "eks:DeleteCluster",
      "eks:CreateNodegroup",
      "eks:CreateFargateProfile",
      "eks:CreateCluster"
    ]

    resources = ["*"]
  }
}
