# Creation of the lambda
resource "aws_lambda_function" "lambda" {
  depends_on = [
    aws_iam_role.iam_role,
    aws_iam_role_policy_attachment.iam_role_policy_attachment
  ]

  function_name                      = var.lambda_function_name
  description                        = var.lambda_description
  role                               = var.lambda_role_arn != null ? var.lambda_role_arn : aws_iam_role.iam_role[0].arn
  filename                           = var.lambda_filename != null ? var.lambda_filename : null
  image_uri                          = var.lambda_image_uri != null ? var.lambda_image_uri : null
  s3_bucket                          = var.lambda_filename == null && var.lambda_image_uri == null ? var.lambda_s3_bucket : null
  s3_key                             = var.lambda_filename == null && var.lambda_image_uri == null ? var.lambda_s3_key : null
  s3_object_version                  = var.lambda_filename == null && var.lambda_image_uri == null ? var.lambda_s3_object_version : null
  handler                            = var.lambda_handler
  runtime                            = var.lambda_runtime
  architectures                      = [var.lambda_architectures]
  code_signing_config_arn            = var.lambda_code_singing
  kms_key_arn                        = var.lambda_kms_key_arn
  layers                             = var.lambda_layers
  memory_size                        = var.lambda_memory_size
  package_type                       = var.lambda_package_type
  publish                            = var.lambda_publish
  reserved_concurrent_executions     = var.lambda_reserved_concurrent_executions
  replace_security_groups_on_destroy = var.lambda_replace_security_groups_on_destroy
  replacement_security_group_ids     = var.lambda_replace_security_groups_on_destroy ? var.lambda_replacement_security_group_ids : null
  skip_destroy                       = var.lambda_skip_destroy
  source_code_hash                   = var.lambda_filename != null || var.lambda_s3_key != null ? var.lambda_source_code_hash : null
  timeout                            = var.lambda_timeout
  tags                               = merge(var.general_tags, var.lambda_tags)
  dynamic "dead_letter_config" {
    for_each = var.lambda_dead_letter_config_target_arn != null ? [1] : []
    content {
      target_arn = var.lambda_dead_letter_config_target_arn
    }
  }
  environment {
    variables = var.lambda_environment_variables
  }
  ephemeral_storage {
    size = var.lambda_ephemeral_storage_size
  }
  dynamic "file_system_config" {
    for_each = var.lambda_file_system_config_arn != null && var.lambda_file_system_config_local_mount_path != null ? [1] : []
    content {
      arn              = var.lambda_file_system_config_arn
      local_mount_path = var.lambda_file_system_config_local_mount_path
    }
  }
  dynamic "image_config" {
    for_each = var.lambda_image_config_command != null || var.lambda_image_config_entry_point != null || var.lambda_image_config_working_directory != null ? [1] : []
    content {
      command           = var.lambda_image_config_command
      entry_point       = var.lambda_image_config_entry_point
      working_directory = var.lambda_image_config_working_directory
    }
  }
  dynamic "logging_config" {
    for_each = var.lambda_application_log_level != null || var.lambda_log_format != null || var.lambda_log_group != null || var.lambda_system_log_level != null ? [1] : []
    content {
      application_log_level = var.lambda_application_log_level
      log_format            = var.lambda_log_format
      log_group             = var.lambda_log_group
      system_log_level      = var.lambda_system_log_level
    }
  }
  dynamic "snap_start" {
    for_each = var.lambda_snap_start_apply_on != null ? [1] : []
    content {
      apply_on = var.lambda_snap_start_apply_on
    }
  }
  dynamic "tracing_config" {
    for_each = var.lambda_tracing_config_mode != null ? [1] : []
    content {
      mode = var.lambda_tracing_config_mode
    }
  }
  dynamic "vpc_config" {
    for_each = var.lambda_vpc_config_security_group_ids != null && var.lambda_vpc_config_subnet_ids != null ? [1] : []
    content {
      security_group_ids          = var.lambda_vpc_config_security_group_ids
      subnet_ids                  = var.lambda_vpc_config_subnet_ids
      ipv6_allowed_for_dual_stack = var.lambda_vpc_config_ipv6_allowed_for_dual_stack
    }

  }
}
