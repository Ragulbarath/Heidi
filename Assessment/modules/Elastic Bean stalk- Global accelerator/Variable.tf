variable "region" {
  description = "The AWS region to deploy the resources."
  type        = string
  default     = "ap-southeast-2"
}

variable "application_name" {
  description = "The name of the Elastic Beanstalk application."
  type        = string
}

variable "application_description" {
  description = "The description of the Elastic Beanstalk application."
  type        = string
  default     = ""
}

variable "environment_name" {
  description = "The name of the Elastic Beanstalk environment."
  type        = string
}

variable "solution_stack_name" {
  description = "The name of the solution stack to use with Elastic Beanstalk."
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for instances in the Elastic Beanstalk environment."
  type        = string
}

variable "min_size" {
  description = "The minimum number of instances for the autoscaling group."
  type        = number
}

variable "max_size" {
  description = "The maximum number of instances for the autoscaling group."
  type        = number
}

variable "environment_type" {
  description = "The environment type for the Elastic Beanstalk environment (e.g., LoadBalanced, SingleInstance)."
  type        = string
  default     = "LoadBalanced"
}

variable "ga_name" {
  description = "The name of the Global Accelerator."
  type        = string
}
