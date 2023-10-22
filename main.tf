data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    sid       = "AllowPublicRead"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.s3_bucket.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name

  dynamic "website" {
    for_each = var.website_configuration == yes ? [1] : []
    content {
      index_document = var.index_document != "" ? var.index_document : "index.html"
      error_document = var.error_document != "" ? var.error_document : "error.html"
    }
  }

  tags = merge(
    {
      Name        = var.bucket_name
      Environment = var.environment
    },
    var.extra_tags
  )
}

resource "aws_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = var.acl
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = var.custom_policy != null ? var.custom_policy : data.aws_iam_policy_document.s3_bucket_policy.json
}
