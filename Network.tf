resource "aws_vpc" "My_VPC" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "${var.tenancy}"

  tags {
    Name = "${var.VPC_name}"
  }
}

resource "aws_subnet" "Subnet_1" {
  cidr_block = "${var.subnet_cidr}"
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

  tags {
    Name = "${var.route2_name}"
  }
}

resource "aws_route_table_association" "Psubnet_router_association" {
  subnet_id      = "${aws_subnet.private_subnet_1.id}"
  route_table_id = "${aws_route_table.Private_route.id}"
}
