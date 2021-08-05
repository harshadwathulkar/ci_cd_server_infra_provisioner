
/*
This is the section to provision the public route table 
*/
resource "aws_route_table" "release_prj_publicRouteTable" {
  vpc_id = aws_vpc.release_prj_vpc.id
  route{
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.release_prj_gw.id
  }
  tags = {Name = "release_prj_publicRouteTable"}
  depends_on = [ aws_vpc.release_prj_vpc, aws_internet_gateway.release_prj_gw ]
}

/*
 *
This is the section to provision the public route table association
 *
 */

resource "aws_route_table_association" "release_prj_publicRouteTableAssociation" {
    subnet_id = aws_subnet.release_prj_public_subnet.id
    route_table_id = aws_route_table.release_prj_publicRouteTable.id
    depends_on = [ aws_subnet.release_prj_public_subnet, aws_route_table.release_prj_publicRouteTable ]
}



/*
This is the section to provision the private  route table 
*/

resource "aws_route_table" "release_prj_privateRouteTable" {
    vpc_id = aws_vpc.release_prj_vpc.id
    route {
     cidr_block = "0.0.0.0/0"
     gateway_id = aws_nat_gateway.release_prj_nat_gw.id
    }
    tags = { Name = "release_prj_privateRouteTable" }
    depends_on = [ aws_vpc.release_prj_vpc, aws_nat_gateway.release_prj_nat_gw ]
} 

/*
This is the section to provision private route table association
*/
 
resource "aws_route_table_association" "release_prj_privateRouteTableAssociation" {
 subnet_id = aws_subnet.release_prj_private_subnet.id 
 route_table_id = aws_route_table.release_prj_privateRouteTable.id
 depends_on = [ aws_subnet.release_prj_private_subnet,aws_route_table.release_prj_privateRouteTable ]
}
