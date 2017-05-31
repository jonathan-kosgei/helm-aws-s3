resource "aws_s3_bucket" "dev" {
  bucket = "dev-bucket"
  acl    = "private"

  tags {
    Name        = "My bucket"
    Environment = "Dev"
  }
}