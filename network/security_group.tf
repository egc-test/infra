#
# security_group.tf
#   configure a security group for vpc
#

resource "aws_security_group" "default" {
  name        = "${var.environment}-${var.sg_name}"
  description = "${var.sg_desc}"
  vpc_id      = "${aws_vpc.default.id}"

  # Allow SSH from World
  #   This is not secure - use for testing only. Changee for a more strict rule!
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


}