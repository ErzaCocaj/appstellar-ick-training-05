data "aws_vpc" "this" {
    tags= {
        Environment= "dev"
    }

}

output "vpc_id" {
  value       = data.aws_vpc.this.id

}
