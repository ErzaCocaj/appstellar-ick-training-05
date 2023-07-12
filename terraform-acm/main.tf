variable "access_key" {
    description= "Access key id for the provider"

}

variable "secret_key" {
    description= "Secret key id for the provider"

}

provider "aws" {
    region= "eu-central-1"
    access_key= var.access_key
    secret_key= var.secret_key
}

data "aws_route53_zone" "this" {
  name=local.domain

}

locals {
  domain = "appstellar.training"
}


module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "erza.${local.domain}"
  zone_id      = data.aws_route53_zone.this.id


  wait_for_validation = true

  tags = {
    Name ="erza.${local.domain}"
  }
}

