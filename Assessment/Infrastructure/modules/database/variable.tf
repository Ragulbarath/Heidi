variable "region" {
  description = "The AWS region to deploy the RDS instance."
  type        = string
  default     = "ap-southeast-2"
}

variable "allocated_storage" {
  description = "The amount of storage  to allocate to the DB instance."
  type        = number
  default     = 20
}

variable "engine" {
  description = "The database engine to use (e.g., mysql, postgres)."
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The version of the database engine."
  type        = string
  default     = "5.7"
}

variable "instance_class" {
  description = "The instance type of the RDS instance."
  type        = string
  default     = "db.t2.micro"
}

variable "db_name" {
  description = "The name of the database to create."
  type        = string
  default     = "RB"
}

variable "username" {
  description = "The master username for the database."
  type        = string
}

variable "password" {
  description = "The master password for the database."
  type        = string
  sensitive   = true
}

variable "parameter_group_name" {
  description = "The name of the DB parameter group to associate."
  type        = string
  default     = "default"
}

variable "subnet_group_name" {
  description = "The name of the DB subnet group to associate."
  type        = string
  default     = "Subnet Group1"
}

variable "subnet_ids" {
  description = "A list of VPC subnet IDs for the DB subnet group."
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "A list of VPC security groups to associate with the RDS instance."
  type        = list(string)
}



