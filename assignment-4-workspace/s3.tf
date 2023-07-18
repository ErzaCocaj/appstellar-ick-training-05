resource "aws_s3_bucket" "static_website" {
  bucket = "erza-assignment-4"
  
  tags = {
    Environment = "Dev"
  }

}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_website.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.static_website.id
  acl    = "public-read"
}
  
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.static_website.id
  policy = data.aws_iam_policy_document.oai_policy.json
}
