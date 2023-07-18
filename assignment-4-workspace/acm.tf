data "aws_route53_zone" "this" {
  name=local.domain

}

locals {
  domain = "appstellar.training"
}


module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "erza-assignment-4.${local.domain}"
  zone_id      = data.aws_route53_zone.this.id


  wait_for_validation = true

  tags = {
    Name ="erza-assignment-4.${local.domain}"
  }
}
