# Configure routing

//resource "aws_route53_record" "default" {
//  zone_id = "${var.route53_zone_id}"
//  name    = "www"
//  type    = "A"
//  ttl     = "60"
//
//  weighted_routing_policy {
//    weight = 1
//  }
//
//  set_identifier = "proxy"
//  records        = []
//}