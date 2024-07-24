output "iam_role_arn" {
  description = "The arn of the iam role for the lambda"
  value       = var.lambda_role_arn == null ? aws_iam_role.iam_role[0].arn : "role not generated"
}

output "iam_role_id" {
  description = "The id of the iam role for the lambda"
  value       = var.lambda_role_arn == null ? aws_iam_role.iam_role[0].id : "role not generated"
}

output "iam_role_unique_id" {
  description = "The unique_id of the iam role for the lambda"
  value       = var.lambda_role_arn == null ? aws_iam_role.iam_role[0].unique_id : "role not generated"
}
