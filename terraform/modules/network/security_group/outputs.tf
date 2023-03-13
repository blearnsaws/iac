output "security_group_id" {
    value = resource.aws_security_group.default_sg.id
}

output "security_group_id_all" {
    value = resource.aws_security_group.default_sg
}

