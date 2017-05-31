
resource "aws_s3_bucket" "dev" {
  bucket   = "dev"
  region   = "us-west-1"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "qa" {
  bucket   = "qa"
  region   = "us-west-1"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "staging" {
  bucket   = "staging"
  region   = "us-west-1"

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "prod" {
  bucket   = "prod"
  region   = "us-west-1"

  versioning {
    enabled = true
  }
}