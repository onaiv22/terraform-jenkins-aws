
#create a private subnet called db
#resource "aws_subnet" "db" {
#  vpc_id = "${aws_vpc.vpc_femi.id}"
#  cidr_block = "${element(var.subnet_cidr_block.*.id, count.index)}"
#  map_public_ip_on_launch = false
#  availability_zone = "${var.map_avail_zones}"
#  tags{
#      Name = "${var.subnet_Names[0]}"
 # }
#}

#create a private subnet called db
resource "aws_subnet" "db" {
  vpc_id = "${aws_vpc.vpc_femi.id}"
  cidr_block = "${var.subnet_cidr_block[0]}"
  map_public_ip_on_launch = false
  availability_zone = "${var.avail_zones[0]}"
  tags{
      Name = "${var.subnet_Names[0]}"
  }
}
# Create a public subnet called Web
resource "aws_subnet" "Web" {
  vpc_id = "${aws_vpc.vpc_femi.id}"
  cidr_block = "${var.subnet_cidr_block[1]}"
  map_public_ip_on_launch = true
  availability_zone = "${var.avail_zones[1]}"
  tags{
      Name = "${var.subnet_Names[1]}"
  }
}
# Create a public subnet called App
#resource "aws_subnet" "app" {
#  vpc_id = "${aws_vpc.vpc_femi.id}"
#  cidr_block = "${var.subnet_cidr_block[2]}"
#  map_public_ip_on_launch = true
#  availability_zone = "${var.avail_zones[2]}"
#  tags{
#      Name = "${var.subnet_Names[2]}"
#  }
#}


















# Create a public subnet called Web
#resource "aws_subnet" "web" {
 # vpc_id = "${aws_vpc.vpc_femi.id}"
 # cidr_block = "${length(var.subnet_cidr_block)}"
 # map_public_ip_on_launch = true
 # availability_zone = "${length(var.avail_zones)}"
 # count = "${var.count}"
 # tags{
 #     Name = "${length(var.tags)}"
 # }
#}
