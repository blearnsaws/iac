output "security_group" {
  value = module.security_group
}

output "ec2_instance_id" {
  value = module.ec2_instance[*]
}

