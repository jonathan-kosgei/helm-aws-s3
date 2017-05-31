resource "aws_iam_policy" "s3-reader" {
  name = "s3-reader-policy"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.dev.arn}",
        "${aws_s3_bucket.prod.arn}",
        "${aws_s3_bucket.qa.arn}",
        "${aws_s3_bucket.staging.arn}"
      ]
    }
  ]
}
POLICY
}