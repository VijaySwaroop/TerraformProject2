resource "aws_vpc" "My_VPC" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags {
    Name = "${var.VPC_name}"
  }
}

resource "aws_subnet" "Subnet_1" {
  cidr_block = "${var.subnet_cidr}"
  map_public_ip_on_launch = "${var.public_ip}"
  vpc_id     = "${aws_vpc.My_VPC.id}"

  tags {
    Name = "${var.subnet_name}"
  }
}

resource "aws_subnet" "private_subnet_1" {
  cidr_block = "${var.Psubnet_cidr}"
  vpc_id     = "${aws_vpc.My_VPC.id}"

  tags {
    Name = "${var.Psubnet_name}"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = "${aws_vpc.My_VPC.id}"

  tags {
    Name = "${var.IGW_name}"
  }
}

resource "aws_route_table" "Public_route" {
  vpc_id     = "${aws_vpc.My_VPC.id}"
#  depends_on = "${aws_subnet.Subnet_1.id1}"

  route {
    cidr_block = "${var.gw_cidr}"
    gateway_id = "${aws_internet_gateway.IGW.id}"
  }

  tags {
    Name = "${var.route1_name}"
  }
}

resource "aws_route_table_association" "subnet_router_association" {
  subnet_id      = "${aws_subnet.Subnet_1.id}"
  route_table_id = "${aws_route_table.Public_route.id}"
}

resource "aws_route_table" "Private_route" {
  vpc_id     = "${aws_vpc.My_VPC.id}"
#  depends_on = "${aws_subnet.private_subnet_1.id}"
  route {
    cidr_block = "${var.ngw_cidr}"
    gateway_id = "${aws_nat_gateway.gw.id}"
  }
  tags {
    Name = "${var.route2_name}"
  }
}

resource "aws_route_table_association" "Psubnet_router_association" {
  subnet_id      = "${aws_subnet.private_subnet_1.id}"
  route_table_id = "${aws_route_table.Private_route.id}"
}
# resource "aws_nat_gateway" "gw" {
#   allocation_id = "${aws_eip.proxy_ip.id}"
#   subnet_id     = "${aws_subnet.private_subnet_1.id}"

#   tags {
#     Name = "gw NAT"
#   }
# }

# resource "aws_eip_association" "proxy_eip" {
#   instance_id   = "${aws_instance.web1.id}"
#   allocation_id = "${aws_eip.proxy_ip.id}"
# # }
# resource "aws_eip" "proxy_ip" {}
