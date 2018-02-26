#
# network.tf
#   configure network for an instance
#

resource "aws_vpc" "default" {
  cidr_block            = "${var.vpc_cidr}"
  enable_dns_support    = true
  enable_dns_hostnames  = true

  tags {
    Name = "${var.environment}-${var.vpc_name}"
    environment = "${var.environment}"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.subnet1_cidr}"
  availability_zone = "${var.subnet1_zone}"

  tags {
    Name = "${var.environment}-${var.subnet1_name}"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = "${aws_vpc.default.id}"
  cidr_block        = "${var.subnet2_cidr}"
  availability_zone = "${var.subnet2_zone}"

  tags {
    Name = "${var.environment}-${var.subnet2_name}"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "${var.environment}-${var.gw_name}"
  }
}

data "aws_route_table" "default" {
  vpc_id = "${aws_vpc.default.id}"
}

resource "aws_route" "default" {
  route_table_id            = "${data.aws_route_table.default.id}"
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = "${aws_internet_gateway.default.id}"
}