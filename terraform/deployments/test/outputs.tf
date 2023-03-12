output "ec2_instance_id" {
    value = module.ec2_instance.ec2_instance_id
}

output "ec2_public_ip" { 
    value = module.ec2_instance.ec2_instance_public_ip
}
