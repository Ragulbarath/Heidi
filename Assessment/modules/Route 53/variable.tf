variable "region" {
  description = "The AWS region in which to create Route 53 resources."
  type        = string
  default     = "ap-southeast-2"
}

variable "zone_name" {
  description = "The name of the hosted zone."
  type        = string
  default = "Heidi.com"
}

variable "record_name" {
  description = "The name of the DNS record."
  type        = string
  default = "www"
}

variable "record_type" {
  description = "The type of the DNS record (e.g., A, CNAME, MX)."
  type        = string
  default = "A"
}

variable "record_ttl" {
  description = "The TTL (time to live) of the DNS record."
  type        = number
  default = "300"
}

variable "record_values" {
  description = "The values of the DNS record."
  type        = list(string)
  default = ["10.0.3.0"]
}
