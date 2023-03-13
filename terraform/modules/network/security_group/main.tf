resource "aws_security_group" "default_sg" {
  name        = var.sg.name
  description = var.sg.description
  vpc_id      = var.sg.vpc_id

  dynamic "ingress" {
    for_each = var.sg.ingress
    content {
        cidr_blocks      = ingress.value["cidr_blocks"]
        description      = ingress.value["description"]
        from_port        = ingress.value["from_port"]
        ipv6_cidr_blocks = ingress.value["ipv6_cidr_blocks"]
        protocol         = ingress.value["protocol"]
        to_port          = ingress.value["to_port"]
    }
  }

  dynamic "egress" {
    for_each = var.sg.egress
    content {
        cidr_blocks      = egress.value["cidr_blocks"]
        description      = egress.value["description"]
        from_port        = egress.value["from_port"]
        ipv6_cidr_blocks = egress.value["ipv6_cidr_blocks"]
        protocol         = egress.value["protocol"]
        to_port          = egress.value["to_port"]      
    }
  }

  tags = {
    Name = var.sg.name
  }
}