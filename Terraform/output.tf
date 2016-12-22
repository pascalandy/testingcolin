output "pub_access_key" {
    value = "${aws_iam_access_key.ghost_publish.id}"
}

output "pub_secret" {
  value = "${aws_iam_access_key.ghost_publish.secret}"
}

output "bucket_name" {
  value = "${aws_s3_bucket.ghost.bucket}"
}
