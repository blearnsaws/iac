sg = {
    name = "test_security_group"
    description = "test default security group"
    vpc_id = "vpc-05a6df564589112f7"
    ingress = [
    {
        cidr_blocks      = ["0.0.0.0/0"]
        description      = "testing SSH ingress rule"
        from_port        = 22
        // ipv6_cidr_blocks = ["::/0"]
        protocol         = "tcp"
        to_port          = 22
    },
    {
        cidr_blocks      = ["0.0.0.0/0"]
        description      = "testing RDP ingress rule"
        from_port        = 3389
        // ipv6_cidr_blocks = ["::/0"]
        protocol         = "tcp"
        to_port          = 3389
    }    
    ]
    egress = [{
        cidr_blocks      = ["0.0.0.0/0"]
        description      = "testing SSH egress rule"
        from_port        = 0
        // ipv6_cidr_blocks = ["::/0"]
        protocol         = "-1"
        to_port          = 0        
    }]
}