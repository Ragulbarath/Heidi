module "Elastic Bean stalk-Global accelerator" {
     source = "../../modules/elasticbeanstalk-globalaccelerator"     
}

module "Route 53" {
     source = "../../modules/Route53"     
}

module "Transit Gateway" {
     source = "../../modules/TransitGateway"     
}

module "Lambda" {
     source = "../../modules/Lambda"     
}


module "database" {
     source = "../../modules/database"     
}


module "waf" {
     source = "../../modules/web-application-fw"     
}

module "cloudformation-s3" {
     source = "../../modules/cloudfront-s3"
     arn_id = module.waf.arn_id
}