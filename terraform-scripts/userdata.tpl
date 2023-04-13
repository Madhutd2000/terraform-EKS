MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="==MYBOUNDARY=="

--==MYBOUNDARY==
Content-Type: text/x-shellscript; charset="us-ascii"

#!/bin/bash
set -ex

exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1

yum install -y amazon-ssm-agent

sudo yum install nfs-utils -y -q
 sudo yum -y install amazon-efs-utils
 
 
systemctl enable amazon-ssm-agent && systemctl start amazon-ssm-agent

/etc/eks/bootstrap.sh ${CLUSTER_NAME} --b64-cluster-ca ${B64_CLUSTER_CA} --apiserver-endpoint ${API_SERVER_URL}

sudo mkdir /efs
 sudo mount -t nfs -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport ${EFS_DNS_NAME}:/  /efs

 echo ${EFS_DNS_NAME}:/ /efs nfs4 defaults,_netdev 0 0  | sudo cat >> /etc/fstab
 sudo chmod go+rw /efs
 
 
--==MYBOUNDARY==--\
