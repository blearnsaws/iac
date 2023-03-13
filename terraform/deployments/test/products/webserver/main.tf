module "security_group" {
  source = "git::https://github.com/blearnsaws/iac.git//terraform/modules/network/security_group?ref=main"  

  sg = {
    name        = var.sg.name
    description = var.sg.description
    vpc_id      = var.sg.vpc_id
    ingress     = var.sg.ingress
    egress      = var.sg.egress
  }
}

module "ec2_instance" {
  source = "git::https://github.com/blearnsaws/iac.git//terraform/modules/compute/generic-ec2?ref=main"

  for_each = { for ec2 in var.ec2s : ec2.name => ec2 }

  ec2 = {
    ami                         = each.value.ami
    associate_public_ip_address = each.value.associate_public_ip_address
    ebs                         = each.value.ebs
    instance_type               = each.value.instance_type
    key_name                    = each.value.key_name
    name                        = each.value.name
    subnet_id                   = each.value.subnet_id
    vpc_security_group_ids      = [module.security_group.security_group_id]
    tags                        = each.value.tags
    user_data                   = each.value.user_data
    rootvolume_size             = each.value.rootvolume_size
    rootvolume_type             = each.value.rootvolume_type
  }
}