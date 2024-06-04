provider "aws" {
  region = var.region
}

resource "aws_elastic_beanstalk_application" "app" {
  name        = var.application_name
  description = var.application_description
}

resource "aws_elastic_beanstalk_environment" "env" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = var.solution_stack_name

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    value     = var.min_size
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max_size
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = var.environment_type
  }
}

resource "aws_globalaccelerator_accelerator" "ga" {
  name               = var.ga_name
  ip_address_type    = "IPV4"
  enabled            = true

  attributes {
    flow_logs_enabled = false
  }
}

resource "aws_globalaccelerator_listener" "ga_listener" {
  accelerator_arn = aws_globalaccelerator_accelerator.ga.id
  protocol        = "TCP"
  port_range {
    from_port = 80
    to_port   = 80
  }
  port_range {
    from_port = 443
    to_port   = 443
  }
}

resource "aws_globalaccelerator_endpoint_group" "ga_endpoint_group" {
  listener_arn = aws_globalaccelerator_listener.ga_listener.id
  endpoint_configuration {
    endpoint_id   = aws_elastic_beanstalk_environment.env.endpoint_url
    weight        = 128
  }

  health_check_interval_seconds = 30
  health_check_path             = "/"
  health_check_port             = 80
  health_check_protocol         = "HTTP"
  traffic_dial_percentage       = 100
}
