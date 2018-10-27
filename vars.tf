variable "region" {
  default = "ap-south-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "tenancy" {
  default = "default"
}

variable "VPC_name" {
  default = "My VPC 1"
}

# variable "vpc_id" {
#   default = "${aws_vpc.My_VPC.id}"
# }

variable "subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "subnet_name" {
  default = "Mysubnet_1"
}

variable "Psubnet_cidr" {
  default = "10.0.2.0/24"
}

variable "Psubnet_name" {
  default = "Mysubnet_2"
}

variable "IGW_name" {
  default = "My_VPC_gateway"
}

# variable "subnet_id" {
#   default = "${aws_subnet.Subnet_1.id}"
# }

variable "gw_cidr" {
  default = "0.0.0.0/0"
}

# variable "IGW_id" {
#   default = "${aws_internet_gateway.IGW.id}"
# }

# variable "route_id" {
#   default = "${aws_route_table.Public_route.id}"
# }

variable "route1_name" {
  default = "Public_route_table"
}

# variable "psubnet_id" {
#   default = "${aws_subnet.private_subnet_1.id}"
# }

# variable "proute_id" {
#   default = "${aws_route_table.Private_route.id}"
# }

variable "route2_name" {
  default = "Private_route_table"
}
variable "ami" {
  default = "ami-06f2f23b8b95143c4"
}

variable "instance_type" {
  default = "t2.micro"
}
variable "Public_instance_name" {
  default = "Jenkins Ansible"
}

variable "keyname" {
  default = "keyone"
}



