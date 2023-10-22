# module_s3_aws

- Terraform module to create S3 bucket on AWS
- Example of use see this repository: [project_aws_website_s3](https://github.com/pdaambrosio/project_aws_website_s3)

<!-- BEGIN_AUTOMATED_TF_DOCS_BLOCK -->
## Requirements

No requirements.

## Usage

Basic usage of this module is as follows:
```hcl
module "example" {
	 source  = "<module-path>"

	 # Optional variables
	 acl  = "private"
	 bucket_name  = "my-bucket"
	 custom_policy  = null
	 environment  = "dev"
	 error_document  = ""
	 extra_tags  = {}
	 index_document  = ""
	 website_configuration  = false
}
```

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.s3_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.s3_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.s3_bucket_ownership_controls](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.s3_bucket_public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_iam_policy_document.s3_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl"></a> [acl](#input\_acl) | The ACL for the bucket | `string` | `"private"` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name of the bucket | `string` | `"my-bucket"` | no |
| <a name="input_custom_policy"></a> [custom\_policy](#input\_custom\_policy) | Custom IAM policy JSON. If not provided, a default policy will be used. | `string` | `null` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment | `string` | `"dev"` | no |
| <a name="input_error_document"></a> [error\_document](#input\_error\_document) | The error document, if website configuration is enabled | `string` | `""` | no |
| <a name="input_extra_tags"></a> [extra\_tags](#input\_extra\_tags) | Extra tags to add to the bucket | `map(string)` | `{}` | no |
| <a name="input_index_document"></a> [index\_document](#input\_index\_document) | The index document, if website configuration is enabled | `string` | `""` | no |
| <a name="input_website_configuration"></a> [website\_configuration](#input\_website\_configuration) | Enable website configuration | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_arn"></a> [bucket\_arn](#output\_bucket\_arn) | The ARN of the bucket |
| <a name="output_website_url"></a> [website\_url](#output\_website\_url) | The website URL, if website configuration is enabled |
<!-- END_AUTOMATED_TF_DOCS_BLOCK -->