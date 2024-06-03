variable "region" {
  description = "The AWS region in which to create the Transit Gateway."
  type        = string
  default     = "ap-southeast-2"
}

variable "description" {
  description = "A description for the Transit Gateway."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resources."
  type        = map(string)
  default = "MyTransitgateway"
}

variable "destination_cidr_block" {
  description = "The CIDR block to route traffic to."
  type        = string
  default     = "10.0.0.0/16"
}

variable "transit_gateway_attachment_id" {
  description = "The ID of the Transit Gateway attachment."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to attach to the Transit Gateway."
  type        = string
  default = "vpc-1234567890"
}

variable "subnet_ids" {
  description = "The IDs of the subnets to associate with the Transit Gateway attachment."
  type        = list(string)
  default = ["subnet-1234567890", "subnet-0987654321"]
}
