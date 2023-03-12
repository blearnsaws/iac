resource "aws_instance" "test_ec2" {
  ami                         = var.ec2.ami
  associate_public_ip_address = var.ec2.associate_public_ip_address
  instance_type               = var.ec2.instance_type
  key_name                    = var.ec2.key_name
  vpc_security_group_ids      = var.ec2.vpc_security_group_ids
  subnet_id                   = var.ec2.subnet_id
  tags                        = merge(var.ec2.tags, { Name = "${var.ec2.name}" })
  user_data                   = var.ec2.user_data
  root_block_device {
    volume_size = var.ec2.rootvolume_size
    volume_type = var.ec2.rootvolume_type
    tags        = merge(var.ec2.tags, { Name = "${var.ec2.name}-rootvol" })
  }
}

resource "aws_ebs_volume" "test_ebs" {
  availability_zone = aws_instance.test_ec2.availability_zone
  size              = var.ec2.ebs.size
  tags              = merge(var.ec2.tags, { Name = "${var.ec2.name}-ebs" })
  type              = var.ec2.ebs.type
}

resource "aws_volume_attachment" "test_ebs_attach" {
  device_name      = var.ec2.ebs.device_name
  volume_id        = aws_ebs_volume.test_ebs.id
  instance_id      = aws_instance.test_ec2.id
}

resource "aws_security_group_rule" "test_sg_ingress" {
  for_each = { for each in var.ec2.sg_ingress : each.description => each }

  description       = each.value.description
  cidr_blocks       = each.value.cidr_blocks
  from_port         = each.value.from_port
  protocol          = each.value.protocol
  security_group_id = each.value.security_group_id  
  to_port           = each.value.to_port
  type              = "ingress"
}

resource "aws_security_group_rule" "test_sg_egress" {
  for_each = { for each in var.ec2.sg_egress : each.description => each }

  description       = each.value.description
  cidr_blocks       = each.value.cidr_blocks
  from_port         = each.value.from_port
  protocol          = each.value.protocol
  security_group_id = each.value.security_group_id  
  to_port           = each.value.to_port
  type              = "egress"
}