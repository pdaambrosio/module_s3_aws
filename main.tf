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
    for_each = var.website_configuration == true ? [1] : []
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

resource "aws_s3_bucket_ownership_controls" "s3_bucket_ownership_controls" {
  bucket = aws_s3_bucket.s3_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  count = var.acl == "public" ? 1 : 0

  bucket = aws_s3_bucket.s3_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  depends_on = [aws_s3_bucket.s3_bucket, aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls]
  bucket     = aws_s3_bucket.s3_bucket.id
  acl        = var.acl
}

resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  depends_on = [aws_s3_bucket.s3_bucket]
  bucket     = aws_s3_bucket.s3_bucket.id
  policy     = var.custom_policy != null ? var.custom_policy : data.aws_iam_policy_document.s3_bucket_policy.json
}
