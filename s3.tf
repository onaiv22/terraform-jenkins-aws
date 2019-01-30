resource "aws_s3_bucket" "bucket-logs" {
  bucket = "terraform-201920011135"
  acl    = "log-delivery-write"
  force_destroy = true
}

resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-201920011140"
  acl    = "private"
  force_destroy = true

  versioning {
     enabled = true
  }
  lifecycle {
     prevent_destroy = false
  }
  logging {
     target_bucket = "${aws_s3_bucket.bucket-logs.id}"
     target_prefix = "log/"
  }
  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "Read-content",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_iam_user.seni_stone.arn}"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::terraform-201920011140/*"
        },
        {
            "Sid": "full-right",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_iam_user.anna_jimoh.arn}"
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::terraform-201920011140",
                "arn:aws:s3:::terraform-201920011140/*"
            ]
        }
    ]
  }
  EOF
  }

resource "aws_s3_bucket" "application-20192001" {
  bucket = "application-20192001"
  acl    = "private"
  force_destroy = true

  versioning {
     enabled = true

  }
  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "Read-NetTeam",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_iam_user.anna_jimoh.arn}"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::application-20192001/*"
        },
        {
            "Sid": "full-right",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_iam_user.seni_stone.arn}"
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::application-20192001",
                "arn:aws:s3:::application-20192001/*"
            ]
        }
    ]
  }
  EOF
  }





