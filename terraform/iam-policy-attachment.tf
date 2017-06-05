# Attach the policy in the policy.tf to the role in the role.tf

resource "aws_iam_policy_attachment" "s3-reader" {
  name       = "s3-reader-iam-attachement"
  roles      = ["${aws_iam_role.s3-reader.name}"]
  policy_arn = "${aws_iam_policy.s3-reader.arn}"
}