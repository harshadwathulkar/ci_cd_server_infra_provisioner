resource "aws_vpc" "release_prj_vpc" {
    cidr_block = "172.20.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = true
    tags = { NAME = "release_prj_vpc"}
}

resource "aws_security_group" "release_prj_sg" {
  name = "allow_ssh"
  description = "allow inbound ssh traffic"
  vpc_id = aws_vpc.release_prj_vpc.id

    ingress {
    description = "Allowing all the incoming trrafic to port 22"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {Name = "releasePrj_sg_tf"}
    depends_on = [aws_vpc.release_prj_vpc]
}

resource "aws_internet_gateway" "release_prj_gw" {
  vpc_id = aws_vpc.release_prj_vpc.id
  tags = {Name= "release_prj_gw"}
  depends_on = [aws_vpc.release_prj_vpc]
}

resource "aws_eip" "relese_Prj_eip" {
    vpc = true
    tags = {
      Name = "relese_Prj_nat_eip"
    }   
}

resource "aws_nat_gateway" "release_prj_nat_gw" {
  allocation_id = aws_eip.relese_Prj_eip.id
  subnet_id = aws_subnet.release_prj_public_subnet.id
  tags = { Name = "release_prj_nat_gw"}
  depends_on = [ aws_eip.relese_Prj_eip, aws_subnet.release_prj_public_subnet ]
}