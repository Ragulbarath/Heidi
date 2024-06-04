provider "aws" {
  region = var.region
}

resource "aws_route53_zone" "zone" {
  name = var.zone_name
}

resource "aws_route53_record" "record" {
  zone_id = aws_route53_zone.zone.zone_id
  name    = var.record_name
  type    = var.record_type
  ttl     = var.record_ttl
  records = var.record_values
}
