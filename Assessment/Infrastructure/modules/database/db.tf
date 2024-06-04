provider "aws" {
  region = var.region
}

resource "aws_db_instance" "this" {
  allocated_storage    = var.allocated_storage
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  name                 = var.db_name
  username             = var.username
  password             = var.password
  parameter_group_name = var.parameter_group_name
  subnet_group_name    = var.subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "this" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids

  tags = "My DB Subnet Group"
}
