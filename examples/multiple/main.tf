module "lambda" {
  source   = "../../"
  for_each = local.lambdas

  # IAM
  iam_role_assume_role_policy    = each.value.iam_role_assume_role_policy
  iam_role_policy_attachment_arn = each.value.iam_role_policy_attachment_arn

  # LAMBDA
  lambda_function_name = each.value.lambda_function_name
  lambda_filename      = each.value.lambda_filename
  lambda_handler       = each.value.lambda_handler
  lambda_runtime       = each.value.lambda_runtime
}
