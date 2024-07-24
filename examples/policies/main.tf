module "lambda" {
  source = "../../"

  # IAM
  iam_role_assume_role_policy = data.aws_iam_policy_document.iam_role_assume_role_policy.json
  iam_role_policy_attachment_arn = {
    "IAMReadOnly"         = "arn:aws:iam::aws:policy/IAMReadOnlyAccess",
    "AdministratorAccess" = "arn:aws:iam::aws:policy/AdministratorAccess"
  }
  iam_policies = {
    "policie_1" = {
      description = null
      name        = "test"
      path        = null
      policy      = data.aws_iam_policy_document.example_multiple_condition_keys_and_values.json
      tags = {
        "name" = "test"
      }
    }
    "policie_2" = {
      description = "test description"
      name        = null
      path        = null
      policy      = data.aws_iam_policy_document.example_multiple_condition_keys_and_values.json
      tags        = {}
    }
  }
  # lambda_role_arn = "arn:aws:iam::123456789012:user/JohnDoe"

  # LAMBDA
  lambda_function_name = "test_lambda"
  lambda_filename      = "../.resources/lambda_code/index.zip"
  lambda_handler       = "index"
  lambda_runtime       = "nodejs18.x"
}
