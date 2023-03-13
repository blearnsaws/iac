ec2s = [
// First Instance
  {
    ami                         = "ami-006dcf34c09e50022" # AmazonLinux2
    associate_public_ip_address = true
    ebs = {
      device_name             = "/dev/sdh"
      size                    = 5
      type                    = "gp2"  
     }
    instance_type               = "t2.micro"
    key_name                    = "bastion1"
    name                        = "Bastion-1"
    subnet_id                   = "subnet-0b5193086e82fd626"
    vpc_security_group_ids      = ["sg-004da30f5a9709de3"]
    tags = {
      Use          = "Test",
      Deployed_by  = "Terraform"
      Project_code =  "001"
    }
    user_data   = <<-EOF
          #!/bin/bash
          echo 'Deployed via terraform' > /tmp/deployment 
          EOF
    rootvolume_size = 8
    rootvolume_type = "gp2"
  },
  // Second Instance
  {
    ami                         = "ami-006dcf34c09e50022" # AmazonLinux2
    associate_public_ip_address = true
    ebs = {
      device_name             = "/dev/sdh"
      size                    = 2
      type                    = "gp2"  
     }
    instance_type               = "t2.micro"
    key_name                    = "bastion1"
    name                        = "Bastion-2"
    subnet_id                   = "subnet-0b5193086e82fd626"
    vpc_security_group_ids      = ["sg-004da30f5a9709de3"]
    tags = {
      Use          = "Test",
      Deployed_by  = "Terraform"
      Project_code =  "001"
    }
    user_data   = <<-EOF
          #!/bin/bash
          echo 'Deployed via terraform' > /tmp/deployment 
          EOF
    rootvolume_size = 8
    rootvolume_type = "gp2"
  }
]