resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "My CloudFront OAI"
}

data "aws_iam_policy_document" "oai_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.static_website.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.oai.iam_arn]
    }
  }
}