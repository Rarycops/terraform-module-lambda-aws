locals {
  lambdas = {
    "lambda_1" = {

      # IAM
      iam_role_assume_role_policy = data.aws_iam_policy_document.iam_role_assume_role_policy.json
      iam_role_policy_attachment_arn = {
        "IAMReadOnly"         = "arn:aws:iam::aws:policy/IAMReadOnlyAccess",
        "AdministratorAccess" = "arn:aws:iam::aws:policy/AdministratorAccess"
      }

      #LAMBDA
      lambda_function_name = "test_lambda"
      lambda_filename      = "../.resources/lambda_code/index.zip"
      lambda_handler       = "index"
      lambda_runtime       = "nodejs18.x"
    }
    "lambda_2" = {

      # IAM
      iam_role_assume_role_policy = data.aws_iam_policy_document.iam_role_assume_role_policy.json
      iam_role_policy_attachment_arn = {
        "IAMReadOnly" = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
      }

      #LAMBDA
      lambda_function_name = "test_lambda_2"
      lambda_filename      = "../.resources/lambda_code/index.zip"
      lambda_handler       = "index"
      lambda_runtime       = "nodejs18.x"
    }
  }
}
