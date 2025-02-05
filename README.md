## Requirements

The following requirements are needed by this module:

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (5.59.0)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (5.59.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_iam_policy.iam_policy](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_policy) (resource)
- [aws_iam_role.iam_role](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_role) (resource)
- [aws_iam_role_policy_attachment.iam_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_role_policy_attachment) (resource)
- [aws_iam_role_policy_attachment.iam_role_policy_attachment_arn](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/iam_role_policy_attachment) (resource)
- [aws_lambda_function.lambda](https://registry.terraform.io/providers/hashicorp/aws/5.59.0/docs/resources/lambda_function) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name)

Description: Unique name for your Lambda Function.

Type: `string`

### <a name="input_lambda_handler"></a> [lambda\_handler](#input\_lambda\_handler)

Description: Function entrypoint in your code.

Type: `string`

### <a name="input_lambda_runtime"></a> [lambda\_runtime](#input\_lambda\_runtime)

Description: Function runtime

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_general_tags"></a> [general\_tags](#input\_general\_tags)

Description: General tags provided for the whole module

Type: `map(string)`

Default: `{}`

### <a name="input_iam_policies"></a> [iam\_policies](#input\_iam\_policies)

Description: Map for generating policies that are going to be attached to the lambda

Type:

```hcl
map(object({
    name        = string
    description = string
    path        = string
    policy      = string
    tags        = map(string)
  }))
```

Default: `{}`

### <a name="input_iam_role_assume_role_policy"></a> [iam\_role\_assume\_role\_policy](#input\_iam\_role\_assume\_role\_policy)

Description: The policy that grants an entity permission to assume the role. Must be a valid JSON.

Type: `string`

Default: `null`

### <a name="input_iam_role_description"></a> [iam\_role\_description](#input\_iam\_role\_description)

Description: he description of the role.

Type: `string`

Default: `null`

### <a name="input_iam_role_force_detach_policies"></a> [iam\_role\_force\_detach\_policies](#input\_iam\_role\_force\_detach\_policies)

Description: Specifies to force detaching any policies the role has before destroying it. Defaults to false.

Type: `bool`

Default: `false`

### <a name="input_iam_role_max_session_duration"></a> [iam\_role\_max\_session\_duration](#input\_iam\_role\_max\_session\_duration)

Description: The maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours.

Type: `number`

Default: `null`

### <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name)

Description: The name of the role. If omitted, Terraform will assign a random, unique name.

Type: `string`

Default: `null`

### <a name="input_iam_role_path"></a> [iam\_role\_path](#input\_iam\_role\_path)

Description: The path to the role. See IAM Identifiers for more information.

Type: `string`

Default: `null`

### <a name="input_iam_role_permissions_boundary"></a> [iam\_role\_permissions\_boundary](#input\_iam\_role\_permissions\_boundary)

Description: The ARN of the policy that is used to set the permissions boundary for the role.

Type: `string`

Default: `null`

### <a name="input_iam_role_policy_attachment_arn"></a> [iam\_role\_policy\_attachment\_arn](#input\_iam\_role\_policy\_attachment\_arn)

Description: The ARN of the policy you want to apply.

Type: `map(string)`

Default: `{}`

### <a name="input_iam_role_tags"></a> [iam\_role\_tags](#input\_iam\_role\_tags)

Description: Key-value map of tags for the IAM role.

Type: `map(string)`

Default: `{}`

### <a name="input_lambda_application_log_level"></a> [lambda\_application\_log\_level](#input\_lambda\_application\_log\_level)

Description: For JSON structured logs, choose the detail level of the logs your application sends to CloudWatch when using supported logging libraries.

Type: `string`

Default: `null`

### <a name="input_lambda_architectures"></a> [lambda\_architectures](#input\_lambda\_architectures)

Description: Instruction set architecture for your Lambda function. Valid values are x86\_64 and arm64. Removing this attribute, function's architecture stay the same.

Type: `string`

Default: `"x86_64"`

### <a name="input_lambda_code_singing"></a> [lambda\_code\_singing](#input\_lambda\_code\_singing)

Description: To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function.

Type: `string`

Default: `null`

### <a name="input_lambda_dead_letter_config_target_arn"></a> [lambda\_dead\_letter\_config\_target\_arn](#input\_lambda\_dead\_letter\_config\_target\_arn)

Description: ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the sns:Publish or sqs:SendMessage action on this ARN, depending on which service is targeted.

Type: `string`

Default: `null`

### <a name="input_lambda_description"></a> [lambda\_description](#input\_lambda\_description)

Description: Description of what your Lambda Function does.

Type: `string`

Default: `null`

### <a name="input_lambda_environment_variables"></a> [lambda\_environment\_variables](#input\_lambda\_environment\_variables)

Description: Map of environment variables that are accessible from the function code during execution.

Type: `map(string)`

Default: `null`

### <a name="input_lambda_ephemeral_storage_size"></a> [lambda\_ephemeral\_storage\_size](#input\_lambda\_ephemeral\_storage\_size)

Description: The size of the Lambda function Ephemeral storage(/tmp) represented in MB.

Type: `number`

Default: `null`

### <a name="input_lambda_file_system_config_arn"></a> [lambda\_file\_system\_config\_arn](#input\_lambda\_file\_system\_config\_arn)

Description: Amazon Resource Name (ARN) of the Amazon EFS Access Point that provides access to the file system.

Type: `string`

Default: `null`

### <a name="input_lambda_file_system_config_local_mount_path"></a> [lambda\_file\_system\_config\_local\_mount\_path](#input\_lambda\_file\_system\_config\_local\_mount\_path)

Description: Path where the function can access the file system, starting with /mnt/.

Type: `string`

Default: `null`

### <a name="input_lambda_filename"></a> [lambda\_filename](#input\_lambda\_filename)

Description: Path to the function's deployment package within the local filesystem. Exactly one of filename, image\_uri, or s3\_bucket must be specified.

Type: `string`

Default: `null`

### <a name="input_lambda_image_config_command"></a> [lambda\_image\_config\_command](#input\_lambda\_image\_config\_command)

Description: Parameters that you want to pass in with entry\_point.

Type: `list(string)`

Default: `null`

### <a name="input_lambda_image_config_entry_point"></a> [lambda\_image\_config\_entry\_point](#input\_lambda\_image\_config\_entry\_point)

Description: Entry point to your application, which is typically the location of the runtime executable.

Type: `list(string)`

Default: `null`

### <a name="input_lambda_image_config_working_directory"></a> [lambda\_image\_config\_working\_directory](#input\_lambda\_image\_config\_working\_directory)

Description: Working directory.

Type: `string`

Default: `null`

### <a name="input_lambda_image_uri"></a> [lambda\_image\_uri](#input\_lambda\_image\_uri)

Description: ECR image URI containing the function's deployment package. Exactly one of filename, image\_uri, or s3\_bucket must be specified.

Type: `string`

Default: `null`

### <a name="input_lambda_kms_key_arn"></a> [lambda\_kms\_key\_arn](#input\_lambda\_kms\_key\_arn)

Description: Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables.

Type: `string`

Default: `null`

### <a name="input_lambda_layers"></a> [lambda\_layers](#input\_lambda\_layers)

Description: List of Lambda Layer Version ARNs to attach to your Lambda Function.

Type: `list(string)`

Default: `null`

### <a name="input_lambda_log_format"></a> [lambda\_log\_format](#input\_lambda\_log\_format)

Description: Select between Text and structured JSON format for your function's logs.

Type: `string`

Default: `"JSON"`

### <a name="input_lambda_log_group"></a> [lambda\_log\_group](#input\_lambda\_log\_group)

Description: The CloudWatch log group your function sends logs to.

Type: `string`

Default: `null`

### <a name="input_lambda_memory_size"></a> [lambda\_memory\_size](#input\_lambda\_memory\_size)

Description: Configuration block used to specify advanced logging settings.

Type: `number`

Default: `null`

### <a name="input_lambda_package_type"></a> [lambda\_package\_type](#input\_lambda\_package\_type)

Description: Lambda deployment package type. Valid values are Zip and Image.

Type: `string`

Default: `"Zip"`

### <a name="input_lambda_publish"></a> [lambda\_publish](#input\_lambda\_publish)

Description: Whether to publish creation/change as new Lambda Function Version.

Type: `bool`

Default: `false`

### <a name="input_lambda_replace_security_groups_on_destroy"></a> [lambda\_replace\_security\_groups\_on\_destroy](#input\_lambda\_replace\_security\_groups\_on\_destroy)

Description: Whether to replace the security groups on the function's VPC configuration prior to destruction. Removing these security group associations prior to function destruction can speed up security group deletion times of AWS's internal cleanup operations.

Type: `bool`

Default: `false`

### <a name="input_lambda_replacement_security_group_ids"></a> [lambda\_replacement\_security\_group\_ids](#input\_lambda\_replacement\_security\_group\_ids)

Description: List of security group IDs to assign to the function's VPC configuration prior to destruction.

Type: `set(string)`

Default: `null`

### <a name="input_lambda_reserved_concurrent_executions"></a> [lambda\_reserved\_concurrent\_executions](#input\_lambda\_reserved\_concurrent\_executions)

Description: Amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations.

Type: `number`

Default: `-1`

### <a name="input_lambda_role_arn"></a> [lambda\_role\_arn](#input\_lambda\_role\_arn)

Description: Amazon Resource Name (ARN) of the function's execution role. The role provides the function's identity and access to AWS services and resources.

Type: `string`

Default: `null`

### <a name="input_lambda_s3_bucket"></a> [lambda\_s3\_bucket](#input\_lambda\_s3\_bucket)

Description: S3 bucket location containing the function's deployment package. This bucket must reside in the same AWS region where you are creating the Lambda function. Exactly one of filename, image\_uri, or s3\_bucket must be specified. When s3\_bucket is set, s3\_key is required.

Type: `string`

Default: `null`

### <a name="input_lambda_s3_key"></a> [lambda\_s3\_key](#input\_lambda\_s3\_key)

Description: S3 key of an object containing the function's deployment package.

Type: `string`

Default: `null`

### <a name="input_lambda_s3_object_version"></a> [lambda\_s3\_object\_version](#input\_lambda\_s3\_object\_version)

Description: Object version containing the function's deployment package.

Type: `string`

Default: `null`

### <a name="input_lambda_skip_destroy"></a> [lambda\_skip\_destroy](#input\_lambda\_skip\_destroy)

Description: Set to true if you do not wish the function to be deleted at destroy time, and instead just remove the function from the Terraform state.

Type: `bool`

Default: `false`

### <a name="input_lambda_snap_start_apply_on"></a> [lambda\_snap\_start\_apply\_on](#input\_lambda\_snap\_start\_apply\_on)

Description: Conditions where snap start is enabled. Valid values are PublishedVersions.

Type: `string`

Default: `null`

### <a name="input_lambda_source_code_hash"></a> [lambda\_source\_code\_hash](#input\_lambda\_source\_code\_hash)

Description: Virtual attribute used to trigger replacement when source code changes. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3\_key.

Type: `string`

Default: `null`

### <a name="input_lambda_system_log_level"></a> [lambda\_system\_log\_level](#input\_lambda\_system\_log\_level)

Description: For JSON structured logs, choose the detail level of the Lambda platform event logs sent to CloudWatch, such as ERROR, DEBUG, or INFO.

Type: `string`

Default: `null`

### <a name="input_lambda_tags"></a> [lambda\_tags](#input\_lambda\_tags)

Description: Map of tags to assign to the object.

Type: `map(string)`

Default: `null`

### <a name="input_lambda_timeout"></a> [lambda\_timeout](#input\_lambda\_timeout)

Description: Amount of time your Lambda Function has to run in seconds.

Type: `number`

Default: `3`

### <a name="input_lambda_tracing_config_mode"></a> [lambda\_tracing\_config\_mode](#input\_lambda\_tracing\_config\_mode)

Description: Whether to sample and trace a subset of incoming requests with AWS X-Ray.

Type: `string`

Default: `null`

### <a name="input_lambda_vpc_config_ipv6_allowed_for_dual_stack"></a> [lambda\_vpc\_config\_ipv6\_allowed\_for\_dual\_stack](#input\_lambda\_vpc\_config\_ipv6\_allowed\_for\_dual\_stack)

Description: Allows outbound IPv6 traffic on VPC functions that are connected to dual-stack subnets.

Type: `bool`

Default: `false`

### <a name="input_lambda_vpc_config_security_group_ids"></a> [lambda\_vpc\_config\_security\_group\_ids](#input\_lambda\_vpc\_config\_security\_group\_ids)

Description: List of security group IDs associated with the Lambda function.

Type: `list(string)`

Default: `null`

### <a name="input_lambda_vpc_config_subnet_ids"></a> [lambda\_vpc\_config\_subnet\_ids](#input\_lambda\_vpc\_config\_subnet\_ids)

Description: List of subnet IDs associated with the Lambda function.

Type: `list(string)`

Default: `null`

## Outputs

The following outputs are exported:

### <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn)

Description: The arn of the iam role for the lambda

### <a name="output_iam_role_id"></a> [iam\_role\_id](#output\_iam\_role\_id)

Description: The id of the iam role for the lambda

### <a name="output_iam_role_unique_id"></a> [iam\_role\_unique\_id](#output\_iam\_role\_unique\_id)

Description: The unique\_id of the iam role for the lambda

### <a name="output_lambda_arn"></a> [lambda\_arn](#output\_lambda\_arn)

Description: The arn of the lambda.

### <a name="output_lambda_invoke_arn"></a> [lambda\_invoke\_arn](#output\_lambda\_invoke\_arn)

Description: ARN to be used for invoking Lambda Function from API Gateway - to be used in aws\_api\_gateway\_integration's uri.

### <a name="output_lambda_invoke_id"></a> [lambda\_invoke\_id](#output\_lambda\_invoke\_id)

Description: The id of the lambda.

### <a name="output_lambda_last_modified"></a> [lambda\_last\_modified](#output\_lambda\_last\_modified)

Description: Date this lambda was last modified.

### <a name="output_lambda_qualified_arn"></a> [lambda\_qualified\_arn](#output\_lambda\_qualified\_arn)

Description: ARN identifying your Lambda Function Version (if versioning is enabled via publish = true).

### <a name="output_lambda_qualified_invoke_arn"></a> [lambda\_qualified\_invoke\_arn](#output\_lambda\_qualified\_invoke\_arn)

Description: Qualified ARN (ARN with lambda version number) to be used for invoking Lambda Function from API Gateway - to be used in aws\_api\_gateway\_integration's uri.

### <a name="output_lambda_signing_job_arn"></a> [lambda\_signing\_job\_arn](#output\_lambda\_signing\_job\_arn)

Description: ARN of the signing job.

### <a name="output_lambda_signing_profile_version_arn"></a> [lambda\_signing\_profile\_version\_arn](#output\_lambda\_signing\_profile\_version\_arn)

Description: ARN of the signing profile version.

### <a name="output_lambda_snap_start_optimization_status"></a> [lambda\_snap\_start\_optimization\_status](#output\_lambda\_snap\_start\_optimization\_status)

Description: Optimization status of the snap start configuration. Valid values are On and Off.

### <a name="output_lambda_tags_all"></a> [lambda\_tags\_all](#output\_lambda\_tags\_all)

Description: A map of tags assigned to the resource, including those inherited from the provider default\_tags configuration block.

### <a name="output_lambda_version"></a> [lambda\_version](#output\_lambda\_version)

Description: Latest published version of your Lambda Function.

### <a name="output_lambda_vpc_config_vpc_id"></a> [lambda\_vpc\_config\_vpc\_id](#output\_lambda\_vpc\_config\_vpc\_id)

Description: Optimization status of the snap start configuration. Valid values are On and Off.
