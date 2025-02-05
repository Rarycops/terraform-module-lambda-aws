variable "lambda_function_name" {
  description = "Unique name for your Lambda Function."
  type        = string
}

variable "lambda_filename" {
  description = "Path to the function's deployment package within the local filesystem. Exactly one of filename, image_uri, or s3_bucket must be specified."
  type        = string
  default     = null
  validation {
    condition = (
      (var.lambda_filename != null ? 1 : 0) +
      (var.lambda_image_uri != null ? 1 : 0) +
      (var.lambda_s3_bucket != null ? 1 : 0)
    ) == 1
    error_message = "If image_uri or s3_bucket are not set, at least filename should be set"
  }
}

variable "lambda_s3_bucket" {
  description = "S3 bucket location containing the function's deployment package. This bucket must reside in the same AWS region where you are creating the Lambda function. Exactly one of filename, image_uri, or s3_bucket must be specified. When s3_bucket is set, s3_key is required."
  type        = string
  default     = null
}

variable "lambda_s3_key" {
  description = "S3 key of an object containing the function's deployment package."
  type        = string
  default     = null
  validation {
    condition     = (var.lambda_s3_bucket != null && var.lambda_s3_key != null) || var.lambda_s3_key == null
    error_message = "When s3_bucket is set, s3_key is required."
  }
}

variable "lambda_s3_object_version" {
  description = "Object version containing the function's deployment package."
  type        = string
  default     = null
}

variable "lambda_image_uri" {
  description = "ECR image URI containing the function's deployment package. Exactly one of filename, image_uri, or s3_bucket must be specified."
  type        = string
  default     = null
}

variable "lambda_handler" {
  description = "Function entrypoint in your code."
  type        = string
}

variable "lambda_runtime" {
  description = "Function runtime"
  type        = string
}

variable "lambda_architectures" {
  description = "Instruction set architecture for your Lambda function. Valid values are x86_64 and arm64. Removing this attribute, function's architecture stay the same."
  type        = string
  default     = "x86_64"
}

variable "lambda_code_singing" {
  description = "To enable code signing for this function, specify the ARN of a code-signing configuration. A code-signing configuration includes a set of signing profiles, which define the trusted publishers for this function."
  type        = string
  default     = null
}

variable "lambda_dead_letter_config_target_arn" {
  description = "ARN of an SNS topic or SQS queue to notify when an invocation fails. If this option is used, the function's IAM role must be granted suitable access to write to the target object, which means allowing either the sns:Publish or sqs:SendMessage action on this ARN, depending on which service is targeted."
  type        = string
  default     = null
}

variable "lambda_description" {
  description = "Description of what your Lambda Function does."
  type        = string
  default     = null
}

variable "lambda_environment_variables" {
  description = "Map of environment variables that are accessible from the function code during execution."
  type        = map(string)
  default     = null
  validation {
    condition     = var.lambda_environment_variables == null || can(length(var.lambda_environment_variables) > 0)
    error_message = "If provided, at least one environment variable must be present."
  }
}

variable "lambda_ephemeral_storage_size" {
  description = "The size of the Lambda function Ephemeral storage(/tmp) represented in MB."
  type        = number
  default     = null
  validation {
    condition     = can(var.lambda_ephemeral_storage_size >= 512 && var.lambda_ephemeral_storage_size <= 10240) || var.lambda_ephemeral_storage_size == null
    error_message = "The size must be between 512 MB and 10240 MB."
  }
}

variable "lambda_file_system_config_arn" {
  description = "Amazon Resource Name (ARN) of the Amazon EFS Access Point that provides access to the file system."
  type        = string
  default     = null
}

variable "lambda_file_system_config_local_mount_path" {
  description = "Path where the function can access the file system, starting with /mnt/."
  type        = string
  default     = null
}

variable "lambda_image_config_command" {
  description = "Parameters that you want to pass in with entry_point."
  type        = list(string)
  default     = null
}

variable "lambda_image_config_entry_point" {
  description = "Entry point to your application, which is typically the location of the runtime executable."
  type        = list(string)
  default     = null
}

variable "lambda_image_config_working_directory" {
  description = "Working directory."
  type        = string
  default     = null
}

variable "lambda_kms_key_arn" {
  description = "Amazon Resource Name (ARN) of the AWS Key Management Service (KMS) key that is used to encrypt environment variables."
  type        = string
  default     = null
}

variable "lambda_layers" {
  description = "List of Lambda Layer Version ARNs to attach to your Lambda Function."
  type        = list(string)
  default     = null
  validation {
    condition     = can(length(var.lambda_layers) <= 5) || var.lambda_layers == null
    error_message = "Maximum of 5."
  }
}

variable "lambda_application_log_level" {
  description = "For JSON structured logs, choose the detail level of the logs your application sends to CloudWatch when using supported logging libraries."
  type        = string
  default     = null
}

variable "lambda_log_format" {
  description = "Select between Text and structured JSON format for your function's logs."
  type        = string
  default     = "JSON"
}

variable "lambda_log_group" {
  description = "The CloudWatch log group your function sends logs to."
  type        = string
  default     = null
}

variable "lambda_system_log_level" {
  description = "For JSON structured logs, choose the detail level of the Lambda platform event logs sent to CloudWatch, such as ERROR, DEBUG, or INFO."
  type        = string
  default     = null
}

variable "lambda_memory_size" {
  description = "Configuration block used to specify advanced logging settings."
  type        = number
  default     = null
}

variable "lambda_package_type" {
  description = "Lambda deployment package type. Valid values are Zip and Image."
  type        = string
  default     = "Zip"
}

variable "lambda_publish" {
  description = "Whether to publish creation/change as new Lambda Function Version."
  type        = bool
  default     = false
}

variable "lambda_role_arn" {
  description = "Amazon Resource Name (ARN) of the function's execution role. The role provides the function's identity and access to AWS services and resources."
  type        = string
  default     = null
  validation {
    condition     = (var.lambda_role_arn == null && var.iam_role_assume_role_policy != null) || var.lambda_role_arn != null
    error_message = "If this resource is set that role will be used for the lambda, if not the variable iam_role_assume_role_policy must be set instead to generate a role for the lambda."
  }
}

variable "lambda_reserved_concurrent_executions" {
  description = "Amount of reserved concurrent executions for this lambda function. A value of 0 disables lambda from being triggered and -1 removes any concurrency limitations."
  type        = number
  default     = -1
}

variable "lambda_replace_security_groups_on_destroy" {
  description = "Whether to replace the security groups on the function's VPC configuration prior to destruction. Removing these security group associations prior to function destruction can speed up security group deletion times of AWS's internal cleanup operations."
  type        = bool
  default     = false
}

variable "lambda_replacement_security_group_ids" {
  description = "List of security group IDs to assign to the function's VPC configuration prior to destruction."
  type        = set(string)
  default     = null
  validation {
    condition     = (var.lambda_replace_security_groups_on_destroy == true && var.lambda_replacement_security_group_ids != null) || var.lambda_replacement_security_group_ids == null
    error_message = "lambda_replace_security_groups_on_destroy must be set to true to use this attribute."
  }
}

variable "lambda_skip_destroy" {
  description = "Set to true if you do not wish the function to be deleted at destroy time, and instead just remove the function from the Terraform state."
  type        = bool
  default     = false
}

variable "lambda_source_code_hash" {
  description = "Virtual attribute used to trigger replacement when source code changes. Must be set to a base64-encoded SHA256 hash of the package file specified with either filename or s3_key."
  type        = string
  default     = null
}

variable "lambda_snap_start_apply_on" {
  description = "Conditions where snap start is enabled. Valid values are PublishedVersions."
  type        = string
  default     = null
}

variable "lambda_timeout" {
  description = "Amount of time your Lambda Function has to run in seconds."
  type        = number
  default     = 3
}

variable "lambda_tags" {
  description = "Map of tags to assign to the object."
  type        = map(string)
  default     = null
}

variable "lambda_tracing_config_mode" {
  description = "Whether to sample and trace a subset of incoming requests with AWS X-Ray."
  type        = string
  default     = null
  validation {
    condition     = can(regex("^PassThrough|Active$", var.lambda_tracing_config_mode)) || var.lambda_tracing_config_mode == null
    error_message = "Valid values are PassThrough and Active."
  }
}

variable "lambda_vpc_config_security_group_ids" {
  description = "List of security group IDs associated with the Lambda function."
  type        = list(string)
  default     = null
}

variable "lambda_vpc_config_subnet_ids" {
  description = "List of subnet IDs associated with the Lambda function."
  type        = list(string)
  default     = null
}

variable "lambda_vpc_config_ipv6_allowed_for_dual_stack" {
  description = "Allows outbound IPv6 traffic on VPC functions that are connected to dual-stack subnets."
  type        = bool
  default     = false
}
