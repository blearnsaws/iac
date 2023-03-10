resource "aws_instance" "test_ec2" {
  ami                         = var.ec2.ami
  associate_public_ip_address = var.ec2.associate_public_ip_address
  instance_type               = var.ec2.instance_type
  key_name                    = var.ec2.key_name
  vpc_security_group_ids      = var.ec2.vpc_security_group_ids
  subnet_id                   = var.ec2.subnet_id
  tags                        = var.ec2.tags
  user_data                   = var.ec2.user_data
  root_block_device {
    volume_size = var.ec2.volume_size
    volume_type = var.ec2.volume_type
    tags        = var.ec2.tags
  }
}