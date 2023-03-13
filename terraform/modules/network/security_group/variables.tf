variable "sg" {
  type = object({
    name        = string
    description = string
    vpc_id      = string
    ingress = list(object({
        cidr_blocks      = list(string)
        description      = string  
        from_port        = number
        ipv6_cidr_blocks = optional(list(string))
        protocol         = string        
        to_port          = number
    }))
    egress = list(object({
        cidr_blocks      = list(string)
        description      = string  
        from_port        = number
        ipv6_cidr_blocks = optional(list(string))
        protocol         = string        
        to_port          = number
    }))    
  })
}