provider "aws" {
  region = var.region
}

resource "aws_ec2_transit_gateway" "transit_gateway" {
  description = var.description
  tags        = var.tags
}

resource "aws_ec2_transit_gateway_route_table" "route_table" {
  transit_gateway_id = aws_ec2_transit_gateway.transit_gateway.id
  tags               = var.tags
}

resource "aws_ec2_transit_gateway_route" "route" {
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table.id
  destination_cidr_block         = var.destination_cidr_block
  transit_gateway_attachment_id  = var.transit_gateway_attachment_id
}

resource "aws_ec2_transit_gateway_attachment" "attachment" {
  transit_gateway_id         = aws_ec2_transit_gateway.transit_gateway.id
  vpc_id                     = var.vpc_id
  subnet_ids                 = var.subnet_ids
  tags                       = var.tags
}

resource "aws_ec2_transit_gateway_route_table_association" "association" {
  transit_gateway_attachment_id = aws_ec2_transit_gateway_attachment.attachment.id
  transit_gateway_route_table_id = aws_ec2_transit_gateway_route_table.route_table.id
}
