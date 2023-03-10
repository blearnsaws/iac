ec2 = {
  ami                         = "ami-006dcf34c09e50022"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = "bastion1"
  subnet_id                   = "subnet-0b5193086e82fd626"
  vpc_security_group_ids      = ["sg-068369949f5e955a2"]
  tags = {
    Name         = "Bastion-1",
    Use          = "Test",
    Deployed_by  = "Terraform"
    Project_code = "001"
  }
  user_data   = <<-EOF
        #!/bin/bash
        echo 'Deployed via terraform' > /tmp/deployment 
        EOF
  volume_size = 8
  volume_type = "gp2"
}
