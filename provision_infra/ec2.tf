 resource "aws_instance" "release_prj_public_ec2_1" {
    ami = "ami-052bcc688e76b5c03"
    
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.release_prj_sg.id ]
    subnet_id = aws_subnet.release_prj_public_subnet.id
    key_name = "eqExpertAssignmentKey_08022021"
    tags = {NAME = "release_prj_public_ec2_1" }
    depends_on = [ aws_vpc.release_prj_vpc, aws_subnet.release_prj_public_subnet, aws_security_group.release_prj_sg ]
}


resource "aws_instance" "release_prj_private_ec2_1" {
    ami = "ami-052bcc688e76b5c03"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.release_prj_sg.id ]
    subnet_id = aws_subnet.release_prj_private_subnet.id
    key_name = "eqExpertAssignmentKey_08022021"
    tags = {NAME = "release_prj_private_ec2_1" }
    depends_on = [ aws_vpc.release_prj_vpc, aws_subnet.release_prj_private_subnet, aws_security_group.release_prj_sg  ]
}