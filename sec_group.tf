#create aws security group
resource "aws_security_group" "webops-firewall" {
  name = "webops-firewall"
  description = "ec2 security group rules for public servers"
  vpc_id = "${aws_vpc.vpc_femi.id}"

  #ssh access
  ingress{
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =["0.0.0.0/0"]
  }
  #http access from anywhere
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  #http access for uber app 7000
  ingress {
    from_port = 7000
    to_port = 7000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db-firewall" {
   name = "db-firewall"
   description = "ec2 security group for database servers"
   vpc_id = "${aws_vpc.vpc_femi.id}"

  #port connection for mysql db only for connections from webservers in public subnet_Names
  ingress {
     from_port = 3306
     to_port = 3306
     protocol = "tcp"
     cidr_blocks = ["192.168.2.0/24"]
  }

  egress {
     from_port = 3306
     to_port = 3306
     protocol = "tcp"
     cidr_blocks = ["192.168.2.0/24"]
   }
  }
