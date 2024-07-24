output "lambda_arn" {
  description = "The arn of the lambda."
  value       = aws_lambda_function.lambda.arn
}

output "lambda_invoke_arn" {
  description = "ARN to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
  value       = aws_lambda_function.lambda.invoke_arn
}

output "lambda_invoke_id" {
  description = "The id of the lambda."
  value       = aws_lambda_function.lambda.id
}

output "lambda_last_modified" {
  description = "Date this lambda was last modified."
  value       = aws_lambda_function.lambda.last_modified
}

output "lambda_qualified_arn" {
  description = "ARN identifying your Lambda Function Version (if versioning is enabled via publish = true)."
  value       = var.lambda_publish ? aws_lambda_function.lambda.qualified_arn : null
}

output "lambda_qualified_invoke_arn" {
  description = "Qualified ARN (ARN with lambda version number) to be used for invoking Lambda Function from API Gateway - to be used in aws_api_gateway_integration's uri."
  value       = var.lambda_publish ? aws_lambda_function.lambda.qualified_invoke_arn : null
}

output "lambda_signing_job_arn" {
  description = "ARN of the signing job."
  value       = aws_lambda_function.lambda.signing_job_arn
}

output "lambda_signing_profile_version_arn" {
  description = "ARN of the signing profile version."
  value       = aws_lambda_function.lambda.signing_profile_version_arn
}

output "lambda_snap_start_optimization_status" {
  description = "Optimization status of the snap start configuration. Valid values are On and Off."
  value       = var.lambda_snap_start_apply_on != null ? aws_lambda_function.lambda.snap_start[0].optimization_status : null
}

output "lambda_tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider default_tags configuration block."
  value       = aws_lambda_function.lambda.tags_all
}

output "lambda_version" {
  description = "Latest published version of your Lambda Function."
  value       = aws_lambda_function.lambda.version
}

output "lambda_vpc_config_vpc_id" {
  description = "Optimization status of the snap start configuration. Valid values are On and Off."
  value       = var.lambda_vpc_config_security_group_ids != null && var.lambda_vpc_config_subnet_ids != null ? aws_lambda_function.lambda.vpc_config[0].vpc_id : null
}
