# launch_configuration.tf
#   Launch configuration

resource "aws_launch_configuration" "default" {
  name_prefix       = "${var.environment}-${var.lc_name_prefix}"
  image_id          = "${var.lc_instance_ami}"
  instance_type     = "${var.lc_instance_type}"
  key_name          = "${var.lc_instance_keypair_name}"
  enable_monitoring = false
  security_groups   = [
                        "${aws_security_group.default.id}",
                        "${var.lc_instance_security_groups}",
                      ]

  associate_public_ip_address = true

  user_data     = "${file(var.lc_instance_user_data_file)}"

  root_block_device {
    volume_type = "${var.lc_instance_volume_type}"
    volume_size = "${var.lc_instance_volume_size}"

    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

}