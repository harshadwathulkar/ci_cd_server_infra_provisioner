resource "aws_subnet" "release_prj_public_subnet" {
  vpc_id = aws_vpc.release_prj_vpc.id
  cidr_block = "172.20.10.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
  tags = {Name = "release_prj_public_subnet_A"}
  depends_on = [ aws_vpc.release_prj_vpc ]
}

resource "aws_subnet" "release_prj_private_subnet" {
    vpc_id = aws_vpc.release_prj_vpc.id
    cidr_block = "172.20.20.0/24"
    availability_zone = "ap-south-1a"
    tags = {Name = "release_prj_private_subnet_A"}
    depends_on = [ aws_vpc.release_prj_vpc ]
} 