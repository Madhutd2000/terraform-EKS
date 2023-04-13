data "aws_availability_zones" "available" {}

resource "aws_efs_file_system" "efs" {
#    creation_token = "efs"
   creation_token = var.efs_name
   performance_mode = "generalPurpose"
   throughput_mode = "bursting"
   encrypted = "true"
 tags = {
     Name = var.efs_name
   }
 }


resource "aws_efs_mount_target" "efs-mt-az1" {
 # count = length(data.aws_availability_zones.available.names)
   file_system_id  = aws_efs_file_system.efs.id
   subnet_id = var.subnet_ids[0]
   security_groups = [aws_security_group.efs.id]
 }


resource "aws_efs_mount_target" "efs-mt-az2" {
  # count = length(data.aws_availability_zones.available.names)
   file_system_id  = aws_efs_file_system.efs.id
   subnet_id = var.subnet_ids[1]
    security_groups = [aws_security_group.efs.id]
 }


resource "aws_efs_mount_target" "efs-mt3" {
  # count = length(data.aws_availability_zones.available.names)
   file_system_id  = aws_efs_file_system.efs.id
   subnet_id = var.subnet_ids[2]
   security_groups = [aws_security_group.efs.id]
 }

