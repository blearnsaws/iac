variable "ec2s" {
  type = list(object({
    ami                         = string
    associate_public_ip_address = bool
    ebs = object({
      device_name = string
      size        = number
      type        = string
    })
    instance_type          = string
    key_name               = string
    name                   = string
    vpc_security_group_ids = list(string)
    subnet_id              = string
    tags                   = map(string)
    user_data              = string
    rootvolume_size        = number
    rootvolume_type        = string
  }))
}