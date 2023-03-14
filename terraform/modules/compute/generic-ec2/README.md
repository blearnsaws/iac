## Generic EC2 instance deployment
Deployes EC2 instance with an additional EBS volume.


Usage Example:

```
module "ec2_instance" {
  source = "git::https://github.com/blearnsaws/iac.git//terraform/modules/compute/generic-ec2?ref=v0.01"

  ec2 = {
    ami                         = var.ec2.ami
    associate_public_ip_address = var.ec2.associate_public_ip_address
    ebs                         = var.ec2.ebs
    instance_type               = var.ec2.instance_type
    key_name                    = var.ec2.key_name
    name                        = var.ec2.name
    subnet_id                   = var.ec2.subnet_id
    vpc_security_group_ids      = var.ec2.vpc_security_group_ids
    tags                        = var.ec2.tags
    user_data                   = var.ec2.user_data
    rootvolume_size             = var.ec2.rootvolume_size
    rootvolume_type             = var.ec2.rootvolume_type
  }
}
```