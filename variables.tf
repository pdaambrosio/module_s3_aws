variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
  default     = "my-bucket"
}

variable "environment" {
  description = "The environment"
  type        = string
  default     = "dev"
}

variable "website_configuration" {
  description = "Enable website configuration"
  type        = bool
  default     = false
}

variable "index_document" {
  description = "The index document, if website configuration is enabled"
  type        = string
  default     = ""
}

variable "error_document" {
  description = "The error document, if website configuration is enabled"
  type        = string
  default     = ""
}

variable "acl" {
  description = "The ACL for the bucket"
  type        = string
  default     = "private"
}

variable "custom_policy" {
  description = "Custom IAM policy JSON. If not provided, a default policy will be used."
  type        = string
  default     = null
}

variable "extra_tags" {
  description = "Extra tags to add to the bucket"
  type        = map(string)
  default     = {}
}
