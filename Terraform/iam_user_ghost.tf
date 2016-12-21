resource "aws_iam_user" "ghost_publish" {
    name = "ghost_publish"
    path = "/"
}

resource "aws_iam_user_policy" "ghost_publish" {
    name = "PublishAssetsToGhostBucket"
    user = "${aws_iam_user.ghost_publish.name}"
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1464515618000",
            "Effect": "Allow",
            "Action": [
                "s3:DeleteObject",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:PutObject",
                "s3:PutObjectAcl",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${var.ghost_bucket}",
                "arn:aws:s3:::${var.ghost_bucket}/*"
            ]
        }
    ]
}EOF
}

resource "aws_iam_access_key" "ghost_publish" {
    user = "${aws_iam_user.ghost_publish.name}"
}
