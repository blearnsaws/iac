output "security_group" {
  value = module.security_group.security_group_id
}

output "ec2_instance_id" {
  value = module.ec2_instance[*]
}

