data "aws_vpc" "this" {
    tags= {
        Environment= "dev"
    }

}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-erza"

  tags = {
    Name        = "Ick training"
    Environment = "Dev"
  }
}

output "vpc_id" {
  value       = data.aws_vpc.this.id

}

module "s3_bucket" {

    source= "./modules/s3"
    bucket_name= aws_s3_bucket.example.bucket
    file_key= "my-first-bucket-file"
    file_source= "./this-is-my-file.txt"
}