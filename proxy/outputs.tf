#
# outputs.tf
#   defines outputs which are printed out after terraform run

output "asg_name" {
  value = "${aws_autoscaling_group.default.name}"
}

output "launch_configuration_name" {
  value = "${aws_launch_configuration.default.name}"
}

output "security_group_name" {
  value = "${aws_security_group.default.name}"
}

output "security_group_id" {
  value = "${aws_security_group.default.id}"
}