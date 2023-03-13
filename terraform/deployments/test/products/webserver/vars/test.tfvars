sg = {
    name        = "web_security_group"
    description = "webserver security group"
    vpc_id      = "vpc-05a6df564589112f7"
    ingress = [
    {
        cidr_blocks      = ["0.0.0.0/0"]
        description      = "SSH ingress rule"
        from_port        = 22
        // ipv6_cidr_blocks = ["::/0"]
        protocol         = "tcp"
        to_port          = 22
    },
    {
        cidr_blocks      = ["0.0.0.0/0"]
        description      = "RDP ingress rule"
        from_port        = 3389
        // ipv6_cidr_blocks = ["::/0"]
        protocol         = "tcp"
        to_port          = 3389
    }    
    ]
    egress = [{
        cidr_blocks      = ["0.0.0.0/0"]
        description      = "ALL egress rule"
        from_port        = 0
        // ipv6_cidr_blocks = ["::/0"]
        protocol         = "-1"
        to_port          = 0        
    }]
}

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
  }
]