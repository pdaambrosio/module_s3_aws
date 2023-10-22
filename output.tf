output "bucket_arn" {
  description = "The ARN of the bucket"
  value       = aws_s3_bucket.s3_bucket.arn

}

output "website_url" {
  description = "The website URL, if website configuration is enabled"
  value       = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}