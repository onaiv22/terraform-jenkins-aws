# Create an internet gateway for the VPC called gw and Associate gw to vpc
resource "aws_internet_gateway" "gw"{
  vpc_id = "${aws_vpc.vpc_femi.id}"
  tags {
      name = "Internet-gw"
  }
}
#create an elastic IP, for the Nat-gateway. needs to have a public IP to be internet facing
resource "aws_eip" "femi-eip" {
  vpc = true
  depends_on = ["aws_internet_gateway.gw"]
}
#create Nat-gateway on the public subnet which is represented as the Web
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.femi-eip.id}"
  subnet_id = "${aws_subnet.Web.id}"
  depends_on = ["aws_internet_gateway.gw"]
}


# nat_gateway_id = "${aws_nat_gateway.nat.id}"


#create a route table for the vpc
resource "aws_route_table" "route-table"{
  vpc_id = "${aws_vpc.vpc_femi.id}"
  tags {
      Name = "vpc-route-table"
  }
}
#create internet gateway to route all
resource "aws_route" "internet-access" {
  route_table_id         = "${aws_vpc.vpc_femi.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.gw.id}"
  #nat_gateway_id = "${aws_nat_gateway.nat.id}"
}
#Associate the public subnet to the internet_access route table
resource "aws_route_table_association" "Web"{
  subnet_id = "${aws_subnet.Web.id}"
  route_table_id = "${aws_vpc.vpc_femi.main_route_table_id}"
 }
#create private route table for Nat users
#resource "aws_route_table" "db_route_Nat_user" {
#    vpc_id = "${aws_vpc.vpc_femi.id}"
#    tags {
#        Name = "private route table"
#    }
#}

# route_table_id = "${aws_vpc.vpc_femi.main_route_table_id}"
