aws configure set aws_access_key_id $TF_VAR_access_key
aws configure set aws_secret_access_key $TF_VAR_secret_key
aws configure set aws_session_token $TF_VAR_aws_session_token

#policystatus=$(aws iam get-policy --policy-arn arn:aws:iam::119276831673:policy/policy-create  2>&1)
#policystatus=$(aws iam get-policy --policy-arn arn:aws:iam::119276831673:policy/AmazonEKSClusterAutoscalerPolicy  2>&1)

autscalerpolicystatus=$(aws iam list-policies --query "Policies[?PolicyName=='AmazonEKSClusterAutoscalerPolicy'].Arn" --output text  2>&1)
echo "${autscalerpolicystatus}"
var=null
# if echo "${policystatus}"  | grep -q 'AmazonEKSClusterAutoscalerPolicy'
if echo "${autscalerpolicystatus}"  | grep -q 'AmazonEKSClusterAutoscalerPolicy'
then
    echo "cluster autoscaler policy already exists in this account"
    var="nocreate"
    echo $var
else
    echo "cluster autscaler policy doesn't exists in the account, so create it"
    var="create"
    echo $var
fi

echo "cluster-autoscaler-policy-count = \"$var\"" >> ../terraform-scripts/terraform.tfvars





###The Amazon EFS Container Storage Interface (CSI) driver provides a CSI interface that allows Kubernetes clusters running on AWS to manage the lifecycle of Amazon EFS file systems

efspolicystatus=$(aws iam list-policies --query "Policies[?PolicyName=='AmazonEKS_EFS_CSI_Driver_Policy'].Arn" --output text  2>&1)
echo "${efspolicystatus}"
efsvar=null
if echo "${efspolicystatus}"  | grep -q 'AmazonEKS_EFS_CSI_Driver_Policy'

then
    echo "AmazonEKS_EFS_CSI_Driver_Policy exists"
    efsvar="nocreate"
    echo $efsvar
else
    echo "AmazonEKS_EFS_CSI_Driver_Policy doesn't exist"
    efsvar="create"
    echo $efsvar
fi

echo "efs-policy-count = \"$efsvar\"" >> ../terraform-scripts/terraform.tfvars



