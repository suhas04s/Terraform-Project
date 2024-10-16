# 1 vpc, 1 subnet , 1 security group 

#createing vpc
resource "aws_vpc" "myvpc" {
    cidr_block = var.cird
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
        Name = "myvpc"
    }
}

#createing subnet for above vpc
resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.cird1
    availability_zone = "us-east-2a"
    map_public_ip_on_launch = true

    tags = {
      Name = "sub1"
    }
  
}

#creating security group for vpc 
resource "aws_security_group" "sg" {
    vpc_id = aws_vpc.myvpc.id
    name = "my_sg"

    #inbound rule are defined using ingress / inbound traffic
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]        
    }

    #outbound rule are defined by egress / outbound traffic
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}