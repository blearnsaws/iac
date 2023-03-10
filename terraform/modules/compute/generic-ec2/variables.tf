variable "ec2" {
  type = object({
    ami                         = string
    associate_public_ip_address = bool
    instance_type               = string
    key_name                    = string
    vpc_security_group_ids      = list(string)
    subnet_id                   = string
    tags                        = map(string)
    user_data                   = string
    volume_size                 = number
    volume_type                 = string
  })
}