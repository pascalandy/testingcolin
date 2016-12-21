resource "aws_s3_bucket" "ghost" {
    bucket = "${var.ghost_bucket}"
    acl = "public-read"

    cors_rule {
        allowed_headers = ["Authorization"]
        allowed_methods = ["GET"]
        allowed_origins = ["*"]
        expose_headers = ["ETag"]
        max_age_seconds = 3000
    }

    website {
        index_document = "index.html"
        error_document = "error.html"
    }
}
