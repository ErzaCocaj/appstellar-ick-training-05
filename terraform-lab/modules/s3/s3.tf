resource "aws_s3_bucket_object" "object" {
  bucket = var.bucket_name
  key    = var.file_key
  source = var.file_source

  # The filemd5() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the md5() function and the file() function:
  # etag = "${md5(file("path/to/file"))}"
  #etag = filemd5("path/to/file")
}