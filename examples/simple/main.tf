module "lambda" {
  source = "../../"

  # IAM
  iam_role_assume_role_policy = data.aws_iam_policy_document.iam_role_assume_role_policy.json

  # LAMBDA
  lambda_function_name = "test_lambda"
  lambda_filename      = "../.resources/lambda_code/index.zip"
  lambda_handler       = "index"
  lambda_runtime       = "nodejs18.x"
}
