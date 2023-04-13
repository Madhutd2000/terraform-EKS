# ##The Amazon EBS CSI plugin requires IAM permissions to make calls to AWS APIs on your behalf. For more information

# #create your Amazon EBS CSI plugin IAM role 
# resource "aws_iam_role" "ebs-csi-driver-iam-role" {
#     #name = "AmazonEKS_EBS_CSI_DriverRole"
#     name = var.ebs-iam-role
#     assume_role_policy = data.aws_iam_policy_document.ebs_assume_role.json
# }

# # trust relationship defined for the above creating role
# data "aws_iam_policy_document" "ebs_assume_role" {
#   statement {
#     actions = ["sts:AssumeRoleWithWebIdentity"]
#     principals {
#       type = "Federated"
#       identifiers = [
#         local.oidc_provider_arn,
#       ]
#     }
   
#    condition {
#      test     = "StringEquals"
#      variable = "${local.oidc_provider_name}:aud"
#      values = [
#         "sts.amazonaws.com"
#       ]
#     }
   
#     condition {
#       test     = "StringEquals"
#       variable = "${local.oidc_provider_name}:sub"
#       values = [
#         "system:serviceaccount:${var.eks_sa_namespace}:${var.ebs_sa_name}"
#       ]
#     }
    
#   }
# }






# ## attach AWS managed policy AmazonEBSCSIDriverPolicy to the role

# resource "aws_iam_role_policy_attachment" "AmazonEBSCSIDriverPolicy" {


#   policy_arn =  "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
  
#   role = aws_iam_role.ebs-csi-driver-iam-role.name
# }
