output "ec2_instance_id" {
    value = aws_instance.test_ec2.id
}

output "ec2_instance_public_ip" {
    value = aws_instance.test_ec2.public_ip
}

output "ec2_instance_private_ip" {
    value = aws_instance.test_ec2.private_ip
}
