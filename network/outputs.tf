#
# outputs.tf
#   defines outputs which are printed out after terraform run

# Output VPC info
output "vpc_name" {
  value = "${var.vpc_name}"
}

output "vpc_id" {
  value = "${aws_vpc.default.id}"
}

# Output Subnet info
output "subnet1_name" {
  value = "${var.subnet1_name}"
}

output "subnet1_id" {
  value = "${aws_subnet.subnet1.id}"
}

output "subnet2_name" {
  value = "${var.subnet2_name}"
}

output "subnet2_id" {
  value = "${aws_subnet.subnet2.id}"
}

# Output SG info
output "sg_name" {
  value = "${var.sg_name}"
}

output "sg_id" {
  value = "${aws_security_group.default.id}"
}

output "route53_zone_name" {
  value = "${aws_route53_zone.development.name}"
}

output "route53_zone_id" {
  value = "${aws_route53_zone.development.id}"
}