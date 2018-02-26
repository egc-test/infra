# asg.tf
#   autoscaling group configuration

resource "aws_autoscaling_group" "default" {
  name                      = "${var.environment}-${var.asg_name}"
  max_size                  = "${var.asg_max_size}"
  min_size                  = "${var.asg_min_size}"
  health_check_grace_period = "${var.asg_health_check_grace_period}"
  health_check_type         = "${var.asg_health_check_type}"
  desired_capacity          = "${var.asg_desired_capacity}"
  vpc_zone_identifier       = "${var.asg_subnet_ids}"
  launch_configuration      = "${aws_launch_configuration.default.id}"

  tag {
    key                 = "Name"
    value               = "${var.environment}-${var.lc_instance_name}"
    propagate_at_launch = true
  }

  tag {
    key                 = "environment"
    value               = "${var.environment}"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}