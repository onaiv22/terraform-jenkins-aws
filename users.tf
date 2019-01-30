resource "aws_iam_user" "seni_stone" {
  name = "seni_stone"
}

resource "aws_iam_user_policy" "RW-seni" {
    name = "seni_stone"
    user = "${aws_iam_user.seni_stone.name}"
    policy= <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::aws_s3_bucket.terraform-201920011140",
                "arn:aws:s3:::aws_s3_bucket.terraform-201920011140/*"
            ]
        },
                {
            "Effect": "Allow",
            "Action": ["dynamodb:*"],
            "Resource": [
                "${aws_dynamodb_table.terraform-locking.arn}"
            ]
        }
   ]
}
EOF
}

resource "aws_iam_user" "anna_jimoh" {
    name = "anna_jimoh"
}

resource "aws_iam_access_key" "anna_jimoh" {
    user = "${aws_iam_user.anna_jimoh.name}"
}

resource "aws_iam_user_policy" "anna_jimoh_rw" {
    name = "anna_jimoh"
    user = "${aws_iam_user.anna_jimoh.name}"
   policy= <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::aws_s3_bucket.terraform-201920011140",
                "arn:aws:s3:::aws_s3_bucket.terraform-201920011140/*"
            ]
        },
                {
            "Effect": "Allow",
            "Action": ["dynamodb:*"],
            "Resource": [
                "${aws_dynamodb_table.terraform-locking.arn}"
            ]
        }
   ]
}
EOF
}
