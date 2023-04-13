###The Amazon EBS CSI plugin requires IAM permissions to make calls to AWS APIs on your behalf. For more information

#create your Amazon EBS CSI plugin IAM role 
resource "aws_iam_role" "efs-csi-driver-iam-role" {
    name = var.efs-iam-role
    assume_role_policy = data.aws_iam_policy_document.efs_assume_role.json
}

# trust relationship defined for the above creating role
data "aws_iam_policy_document" "efs_assume_role" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    principals {
      type = "Federated"
      identifiers = [
        local.oidc_provider_arn,
      ]
    }
   
#    condition {
#      test     = "StringEquals"
#      variable = "${local.oidc_provider_name}:aud"
#      values = [
#         "sts.amazonaws.com"
#       ]
#     }
   
    condition {
      test     = "StringEquals"
      variable = "${local.oidc_provider_name}:sub"
      values = [
        "system:serviceaccount:${var.eks_sa_namespace}:${var.efs_sa_name}"
      ]
    }
    
  }
}



## Create the policy

resource "aws_iam_policy" "efs_iam_policy" {
  count = "${var.efs-policy-count == "create" ? 1 : 0}"
  name = var.efs-policy-name
  description = "The policy will allow the Amazon EFS driver to interact with your file system"

  policy = <<EOT
{
     "Version": "2012-10-17",
      "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "elasticfilesystem:DescribeAccessPoints",
        "elasticfilesystem:DescribeFileSystems",
        "elasticfilesystem:DescribeMountTargets",
        "ec2:DescribeAvailabilityZones"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "elasticfilesystem:CreateAccessPoint"
      ],
      "Resource": "*",
      "Condition": {
        "StringLike": {
          "aws:RequestTag/efs.csi.aws.com/cluster": "true"
        }
      }
    },
    {
      "Effect": "Allow",
      "Action": "elasticfilesystem:DeleteAccessPoint",
      "Resource": "*",
      "Condition": {
        "StringEquals": {
          "aws:ResourceTag/efs.csi.aws.com/cluster": "true"
        }
      }
    }
  ]

}
EOT
}


## attach AWS managed policy AmazonEBSCSIDriverPolicy to the role

resource "aws_iam_role_policy_attachment" "AmazonEFSCSIDriverPolicy" {


  policy_arn =  "${var.efs-policy-count}" == "create" ? aws_iam_policy.efs_iam_policy[0].arn : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:policy/${var.efs-policy-name}"  
  
  role = aws_iam_role.efs-csi-driver-iam-role.name
}