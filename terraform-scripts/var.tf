variable "iam_role_name_for_eks_cluster"{
type = string
description = "IAM role name of the EKS Cluster"  
}

variable "eks_cluster_name"{
type = string
description = "Name of the EKS cluster"  
}

variable "subnet_ids"{
type = list(string)
description = "List of Subnet ids"  
}

variable "template_name"{
type = string
description = "ami id which has nexus certificates"
}

variable "instances_name"{
type = string
description = "name to worker nodes"
}

variable "ami_id"{
type = string
description = "ami id which has nexus certificates"
}

# variable "additional-sg"{
# 	type = string
# 	default = "additional-sg"
# }

variable "tag_name_for_cluster"{
type = string
description = "Tags"  
}

variable "iam_role_name_for_eks_nodes"{
type = string
description = "IAM role name of the EKS Node group"   
}


variable "eks_node_group_name"{
type = string 
description = "Node group name" 
}


variable "instance_type"{
type = string
description = "Instance type"  
}

variable "ec2_ssh_key"{
type = string
description = "Name of the Pem key to login to the nodes."  
}

variable "desired_size"{
type = number
}


variable "max_size"{
type = number
}

variable "min_size"{
type = number
}

variable  "max_unavailable"{
type = number
}

variable "region"{
type = string
description = "Region where cluster need to be created"  
}



variable "eks_sa_namespace" {
  description = "The k8s service account namespace to allow assume from."
  type        = string
  default = "kube-system"	
	
 
	
}

variable "cluster-autoscaler-sa-name" {
  description = "The cluster autoscaler service account name to allow assume from."
  type        = string
  default = "cluster-autoscaler"		
	
}
variable "access_key" {    
  type = string
}

variable "secret_key" {    
  type = string
}

variable "aws_session_token" {
  description = "Temporary session token used to create instances"
  type = string
}

variable vpc_id {
   type = string
   description = "vpc id"
}

variable sg_name{
	type = string
	description = "security group name"
}	

variable security_groups {
  default = [ 
 { # 1st akamai sg group
    	description = "akamai sg1"
    	egress_rules = [
    	{
      		from = 0 #from is of type number
      		to = 0 #to is of type number
      		protocol = "-1"
      		cidr = ["0.0.0.0/0"]
    	}]
    	ingress_rules = [{
      		from = 30443 #from is of type number
      		to = 30443  #to is of type number
      		protocol = "tcp"
      		cidr = ["104.107.116.14/31","108.233.192.1/32","144.202.53.167/32","156.55.173.208/32",
      		"104.107.61.132/31","104.112.226.200/30","104.116.241.196/30","104.116.243.214/31","104.125.80.12/32","104.64.0.0/10","104.71.131.0/24","104.77.168.0/24","104.90.204.144/29","104.96.91.132/31","104.97.78.0/24","118.214.0.0/16","124.40.41.200/29","124.40.42.228/31","125.252.224.36/31","125.56.219.52/31","138.122.197.0/24","165.254.1.100/31","172.224.0.0/12","173.205.7.116/31","173.222.0.0/15","184.24.0.0/13","184.25.56.10/31","184.26.44.0/24","184.27.120.0/24","184.27.198.224/31","184.27.45.0/24","184.28.127.0/24","184.28.156.0/24","184.28.51.0/24","184.50.0.0/15","184.50.228.238/31","184.50.84.196/32","184.50.84.198/32","184.51.151.0/24","184.51.199.0/24","184.84.0.0/14","184.84.242.21/32","184.84.242.22/31","184.84.242.32/30","189.36.162.0/25","192.204.11.4/31","193.108.155.118/32","193.108.155.208/32","199.200.27.7/32","199.200.27.9/32","2.16.0.0/13","2.16.106.0/24","2.16.15.0/24","2.16.157.170/31","2.18.240.0/24","2.18.25.47/32","2.19.193.116/31","2.22.10.12/31","201.16.50.0/24","201.33.187.0/25","201.33.187.68/30","201.6.6.214/31","203.69.138.120/30","203.69.138.121/32","203.69.138.122/32","204.1.136.238/31","204.2.159.68/31","204.2.160.182/31","204.2.166.173/32","204.2.166.174/31","204.2.166.176/30","204.2.166.180/32","204.201.160.246/31","205.185.205.132/31","207.126.104.118/31","208.49.157.49/32","208.49.157.50/31","208.49.157.52/31"]
	    },
     	    {
      		from = 30080  #from is of type number
      		to = 30080   #to is of type number
      		protocol = "tcp"
      		cidr = ["104.107.116.14/31","108.233.192.1/32","144.202.53.167/32","156.55.173.208/32",
	        "104.107.61.132/31","104.112.226.200/30","104.116.241.196/30","104.116.243.214/31","104.125.80.12/32","104.64.0.0/10","104.71.131.0/24","104.77.168.0/24","104.90.204.144/29","104.96.91.132/31","104.97.78.0/24","118.214.0.0/16","124.40.41.200/29","124.40.42.228/31","125.252.224.36/31","125.56.219.52/31","138.122.197.0/24","165.254.1.100/31","172.224.0.0/12","173.205.7.116/31","173.222.0.0/15","184.24.0.0/13","184.25.56.10/31","184.26.44.0/24","184.27.120.0/24","184.27.198.224/31","184.27.45.0/24","184.28.127.0/24","184.28.156.0/24","184.28.51.0/24","184.50.0.0/15","184.50.228.238/31","184.50.84.196/32","184.50.84.198/32","184.51.151.0/24","184.51.199.0/24","184.84.0.0/14","184.84.242.21/32","184.84.242.22/31","184.84.242.32/30","189.36.162.0/25","192.204.11.4/31","193.108.155.118/32","193.108.155.208/32","199.200.27.7/32","199.200.27.9/32","2.16.0.0/13","2.16.106.0/24","2.16.15.0/24","2.16.157.170/31","2.18.240.0/24","2.18.25.47/32","2.19.193.116/31","2.22.10.12/31","201.16.50.0/24","201.33.187.0/25","201.33.187.68/30","201.6.6.214/31","203.69.138.120/30","203.69.138.121/32","203.69.138.122/32","204.1.136.238/31","204.2.159.68/31","204.2.160.182/31","204.2.166.173/32","204.2.166.174/31","204.2.166.176/30","204.2.166.180/32","204.201.160.246/31","205.185.205.132/31","207.126.104.118/31","208.49.157.49/32","208.49.157.50/31","208.49.157.52/31"]
           }]
   }, 	# 1st akamai sg group
   {	# 2nd akamai sg group
    	description = "akamai sg2"
    	ingress_rules = [{
      		from = 30443  #from is of type number
      		to = 30443  #to is of type number
      		protocol = "tcp"
      		cidr = ["208.49.157.54/32", "209.107.208.188/31", "209.170.113.100/31", "209.170.113.106/31", "209.170.113.108/32", "209.170.113.98/31", "209.249.98.36/31", "209.8.112.100/30", "209.8.112.104/31", "209.8.112.96/30", "209.8.118.39/32", "209.8.118.44/32", "220.90.198.178/31", "23.0.0.0/12", "23.10.248.0/24", "23.192.0.0/11", "23.200.75.14/31", "23.200.84.166/31", "23.205.121.153/32", "23.205.127.0/24", "23.210.209.63/32", "23.210.209.66/31", "23.210.209.74/31", "23.211.118.0/24", "23.216.10.0/24", "23.219.162.0/24", "23.219.163.0/24", "23.219.36.0/24", "23.3.104.186/31", "23.3.11.140/32", "23.32.0.0/11", "23.35.151.34/31", "23.35.219.28/31", "23.35.219.36/30", "23.43.164.0/24", "23.44.172.230/31", "23.48.168.0/22", "23.48.94.0/24", "23.50.48.0/20", "23.54.169.0/24", "23.57.69.52/30", "23.57.74.70/31", "23.58.82.133/32", "23.58.82.196/32", "23.58.82.204/32", "23.58.83.133/32", "23.58.83.196/32", "23.58.83.204/32", "23.61.1.150/31", "23.62.2.210/31", "23.62.98.172/31", "23.63.234.0/27", "23.63.234.13/32", "23.64.0.0/14", "23.65.182.244/31", "23.67.251.0/24", "23.67.76.0/24", "23.72.0.0/13", "23.79.240.0/24", "23.79.242.196/32", "23.79.242.198/32", "60.254.173.30/31", "61.111.58.82/31", "63.148.207.60/31", "63.151.118.0/24", "63.217.211.110/31", "63.217.211.116/31", "63.235.21.192/31", "63.235.29.198/32", "63.239.233.160/30", "63.239.233.161/32", "63.239.233.162/32", "64.145.89.236/31", "65.120.61.100/31", "65.124.174.194/31"]
          },
         {
      		from = 30080  #from is of type number
      		to = 30080  #to is of type number
      		protocol = "tcp"
      		cidr = ["208.49.157.54/32", "209.107.208.188/31", "209.170.113.100/31", "209.170.113.106/31", "209.170.113.108/32", "209.170.113.98/31", "209.249.98.36/31", "209.8.112.100/30", "209.8.112.104/31", "209.8.112.96/30", "209.8.118.39/32", "209.8.118.44/32", "220.90.198.178/31", "23.0.0.0/12", "23.10.248.0/24", "23.192.0.0/11", "23.200.75.14/31", "23.200.84.166/31", "23.205.121.153/32", "23.205.127.0/24", "23.210.209.63/32", "23.210.209.66/31", "23.210.209.74/31", "23.211.118.0/24", "23.216.10.0/24", "23.219.162.0/24", "23.219.163.0/24", "23.219.36.0/24", "23.3.104.186/31", "23.3.11.140/32", "23.32.0.0/11", "23.35.151.34/31", "23.35.219.28/31", "23.35.219.36/30", "23.43.164.0/24", "23.44.172.230/31", "23.48.168.0/22", "23.48.94.0/24", "23.50.48.0/20", "23.54.169.0/24", "23.57.69.52/30", "23.57.74.70/31", "23.58.82.133/32", "23.58.82.196/32", "23.58.82.204/32", "23.58.83.133/32", "23.58.83.196/32", "23.58.83.204/32", "23.61.1.150/31", "23.62.2.210/31", "23.62.98.172/31", "23.63.234.0/27", "23.63.234.13/32", "23.64.0.0/14", "23.65.182.244/31", "23.67.251.0/24", "23.67.76.0/24", "23.72.0.0/13", "23.79.240.0/24", "23.79.242.196/32", "23.79.242.198/32", "60.254.173.30/31", "61.111.58.82/31", "63.148.207.60/31", "63.151.118.0/24", "63.217.211.110/31", "63.217.211.116/31", "63.235.21.192/31", "63.235.29.198/32", "63.239.233.160/30", "63.239.233.161/32", "63.239.233.162/32", "64.145.89.236/31", "65.120.61.100/31", "65.124.174.194/31"]
         }]
       egress_rules = [{
      		from = 0  # from  is of type number
      		to = 0  # to is of type number
      		protocol = "-1"
      		cidr = ["0.0.0.0/0"]
    	}]
   }, 	# 2nd akamai sg group
   {	# 3rd akamai sg group
    	description = "akamai sg3"
    	ingress_rules = [{
     		from = 30443  #from is of type number
      		to = 30443  #to is of type number
      		protocol = "tcp"
      		cidr = ["65.152.116.70/31", "65.158.180.206/31", "66.198.26.68/30", "66.198.26.69/32", "66.198.26.70/32", "66.198.8.141/32", "66.198.8.142/32", "66.198.8.143/32", "66.198.8.144/32", "66.198.8.167/32", "66.198.8.168/32", "67.220.142.19/32", "67.220.142.20/32", "67.220.142.21/32", "67.220.142.22/32", "67.220.143.216/31", "69.192.0.0/16", "69.192.3.135/32", "69.192.3.140/32", "69.31.121.20/31", "69.31.138.100/31", "69.31.59.188/31", "69.31.59.196/32", "69.31.59.202/32", "69.31.59.86/32", "72.246.0.0/15", "72.246.150.0/24", "72.246.194.165/32", "72.246.216.0/24", "72.246.52.144/28", "72.246.57.84/31", "72.246.97.0/24", "72.247.124.172/31", "72.247.237.135/32", "72.247.39.94/32", "77.67.85.52/31", "8.18.43.199/32", "8.18.43.240/32", "80.239.206.148/30", "80.239.206.152/31", "81.20.66.77/32", "88.221.0.0/16", "88.221.213.4/32", "88.221.53.86/31", "90.84.52.180/31", "90.84.52.180/32", "92.122.0.0/15", "92.122.127.108/31", "92.122.191.60/32", "92.122.191.66/32", "92.123.244.140/30", "95.100.0.0/15", "96.16.0.0/15", "96.17.173.47/32", "96.17.173.71/32", "96.6.0.0/15", "96.6.123.0/24", "195.35.90.1/32", "63.32.67.110/32", "195.35.91.111/32", "64.57.156.71/32", "199.247.32.205/32", "86.11.225.197/32", "146.148.21.97/32", "4.30.151.198/32", "64.57.146.12/32", "64.57.146.11/32", "63.32.67.110/32", "64.57.146.70/32", "99.86.115.116/32", "64.57.146.71/32", "52.211.106.80/32", "124.155.211.1/32", "82.203.36.53/32", "195.35.91.1/32"]
         },
        {
      		from = 30080  #from is of type number
      		to = 30080   #to is of type number
      		protocol = "tcp"
      		cidr = ["65.152.116.70/31", "65.158.180.206/31", "66.198.26.68/30", "66.198.26.69/32", "66.198.26.70/32", "66.198.8.141/32", "66.198.8.142/32", "66.198.8.143/32", "66.198.8.144/32", "66.198.8.167/32", "66.198.8.168/32", "67.220.142.19/32", "67.220.142.20/32", "67.220.142.21/32", "67.220.142.22/32", "67.220.143.216/31", "69.192.0.0/16", "69.192.3.135/32", "69.192.3.140/32", "69.31.121.20/31", "69.31.138.100/31", "69.31.59.188/31", "69.31.59.196/32", "69.31.59.202/32", "69.31.59.86/32", "72.246.0.0/15", "72.246.150.0/24", "72.246.194.165/32", "72.246.216.0/24", "72.246.52.144/28", "72.246.57.84/31", "72.246.97.0/24", "72.247.124.172/31", "72.247.237.135/32", "72.247.39.94/32", "77.67.85.52/31", "8.18.43.199/32", "8.18.43.240/32", "80.239.206.148/30", "80.239.206.152/31", "81.20.66.77/32", "88.221.0.0/16", "88.221.213.4/32", "88.221.53.86/31", "90.84.52.180/31", "90.84.52.180/32", "92.122.0.0/15", "92.122.127.108/31", "92.122.191.60/32", "92.122.191.66/32", "92.123.244.140/30", "95.100.0.0/15", "96.16.0.0/15", "96.17.173.47/32", "96.17.173.71/32", "96.6.0.0/15", "96.6.123.0/24", "195.35.90.1/32", "63.32.67.110/32", "195.35.91.111/32", "64.57.156.71/32", "199.247.32.205/32", "86.11.225.197/32", "146.148.21.97/32", "4.30.151.198/32", "64.57.146.12/32", "64.57.146.11/32", "63.32.67.110/32", "64.57.146.70/32", "99.86.115.116/32", "64.57.146.71/32", "52.211.106.80/32", "124.155.211.1/32", "82.203.36.53/32", "195.35.91.1/32"] 
         }]
         egress_rules = [{
      		from = 0  #from is of type number
      		to = 0  #to is of type number
      		protocol = "-1"
      		cidr = ["0.0.0.0/0"]
    	}]
  } # 3rd akamai sg group
]
}

variable "ports"{
  default = [[30080,8443,30443,443,22,80]]
}

variable "cidr"{
   default = [["10.0.0.0/8"]]
}

variable "cluster-autoscaler-policy-count"{
type = string
# default = "-1"
	default = "nocreate"
description = "check policy exists or not"
}

variable "cluster-autoscaler-policy-name"{
type = string
default = "AmazonEKSClusterAutoscalerPolicy"
description = "creates policy if not exists"
}	

variable "cluster_autoscaler_role_name" {
  description = "The cluster autoscaler role name"
  type        = string
}

variable "host_name"{
	type=string
	default="test.local"
	description="hostname in ingress rule for k8s dashboard"
}	


variable "aws_lb_target_group_name"{
type = string 
description = "target group name" 
}

variable "aws_lb_internal_443_protocl"{
type = string 
description = "proctol for internal target group for port 443. cab be TCP or TLS" 
}

## velero
variable "bucket_name"{
	type = string
	description = "s3 bucket name for backup using velero"
}

variable"velero-sa-name"{
	type = string
	description = "velero service account name in the kubernetes"
	default = "velero"
}

variable "acl"{
  type = string
  default = "private"
}

variable "versioning"{
  type = string
  default = "Enabled"
}

variable "velero_backup_role_name"{
  type = string
  description ="IAM role for velero to store backups in s3 bucket"
}


variable "velero_backup_policy_name"{
  type = string
  description ="IAM policy name to attach to Velero role"
}

variable "namespace_name"{
  type = string
  description ="application namespace"
}	
