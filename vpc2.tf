#create VPC
resource "aws_vpc" "vpc_femi" {
  cidr_block = "${var.cidr}"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
      Name = "prod-env"
  }
}
