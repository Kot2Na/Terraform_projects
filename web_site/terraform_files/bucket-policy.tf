resource "aws_s3_bucket_policy" "bucket-policy" {
  bucket = aws_s3_bucket.my-static-website.id

  policy = <<POLICY
{
  "Id": "Policy",
  "Statement": [
    {
      "Action": [
        "s3:GetObject"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::${aws_s3_bucket.my-static-website.bucket}/*",
      "Principal": {
        "AWS": [
          "*"
        ]
      }
    }
  ]
}
POLICY

depends_on = [aws_s3_bucket_public_access_block.my-static-website]
}