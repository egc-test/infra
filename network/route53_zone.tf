# route53 records

#resource "aws_route53_zone" "production" {
#  name = "example.com"
#}

#resource "aws_route53_zone" "test" {
#  name = "test.net"
#}

resource "aws_route53_zone" "development" {
  name    = "development.net"
  vpc_id  = "${aws_vpc.default.id}"

  tags {
    environment = "development"
  }
}