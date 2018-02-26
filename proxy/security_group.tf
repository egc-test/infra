#
# security_group.tf
#   configure a security group for vpc
#

resource "aws_security_group" "default" {
  name        = "${var.environment}-${var.sg_name}"
  description = "${var.sg_description}"
  vpc_id      = "${var.vpc_id}"

  # Allow HTTP from World
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS from World
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow ALL outbound
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    self            = true
  }
}