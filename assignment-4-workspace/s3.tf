module "web_client" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.14.0"
  bucket  = "erza-assignment-4"
}