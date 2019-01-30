variable "access_key" {}
variable "secret_key" {}

variable "region" {
   default = "eu-west-1"
}
variable "cidr" {
   type = "string"
   default = "192.168.0.0/16"
}

variable "subnet_cidr_block" {
   type = "list"
   default = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
}

variable "count" {
    default = "2"
}

variable "avail_zones" {
    type = "list"
    default = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "ami" {
    type = "list"
    default = ["ami-047bb4163c506cd98", "ami-0a5e707736615003c"]
}
#ami-0b5cc54be15133c79
variable "map_ami" {
    type = "map"
    default = {
       "eu-west-1a" = "ami-047bb4163c506cd98"
       "eu-west-1b" = "ami-0a5e707736615003c"
    }
}

variable "subnet_Names" {
    type = "list"
    default = ["DB-servers", "Web-servers", "App-servers"]
}

variable "server_name" {
    type = "list"
    default = ["svr101", "svr102", "svr103"]
}
