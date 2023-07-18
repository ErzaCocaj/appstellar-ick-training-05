data "aws_vpc" "this" {
    tags= {
        Environment= "dev"
    }

}

output "vpc_id" {
  value       = data.aws_vpc.this.id

}

data "aws_route53_zone" "zone" {
  name=local.domain
  vpc_id=output.vpc_id

}

locals {
  domain = "appstellar.training"
}


module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name  = "erza-assignment-4.${local.domain}"
  zone_id      = data.aws_route53_zone.zone.id


  wait_for_validation = true

  tags = {
    Name ="erza-assignment-4.${local.domain}"
  }
}
