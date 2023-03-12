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
  sg_ingress = [
    {
        description       = "SSH ingress rule"    
        cidr_blocks       = ["0.0.0.0/0"]       # Not good practice to open to the world
        from_port         = 22
        protocol          = "tcp"      
        to_port           = 22
        security_group_id = "sg-004da30f5a9709de3"
    },
    {
        description       = "RDP ingress rule"    
        cidr_blocks       = ["0.0.0.0/0"]      # Not good practice to open to the world
        from_port         = 3389
        protocol          = "tcp"      
        to_port           = 3389
        security_group_id = "sg-004da30f5a9709de3"
    }  
  ]
  sg_egress = [
    {
        description       = "ALL egress rule"    
        cidr_blocks       = ["0.0.0.0/0"]      # Not good practice to open to the world
        from_port         = 0
        protocol          = "-1"      
        to_port           = 0
        security_group_id = "sg-004da30f5a9709de3"
    }
  ]
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

  ## Unfortunately this is needed for the second instance as well. But duplicate entries will cause
  ## terraform to fail with duplicate error.
  ## Need to come up with a better solution to deploy security group rules with the instance.
  sg_ingress = [
    {
        description       = "HTTPS ingress rule"    
        cidr_blocks       = ["0.0.0.0/0"]            # Not good practice to open to the world
        from_port         = 443
        protocol          = "tcp"      
        to_port           = 443
        security_group_id = "sg-004da30f5a9709de3"
    }
    ]
  sg_egress  = [
    {
        description       = "Dummy egress rule"    
        cidr_blocks       = ["192.168.1.0/24"]       # Not good practice to open to the world
        from_port         = 0
        protocol          = -1
        to_port           = 0
        security_group_id = "sg-004da30f5a9709de3"
    }
  ]
}
]