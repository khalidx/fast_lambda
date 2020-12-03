resource "aws_lambda_function" "fast_lambda" {
  function_name = "fast_lambda"
  runtime       = "provided"
  handler       = "bootstrap"
  filename      = "lambda.zip"
  source_code_hash = filebase64sha256("lambda.zip")
  role          = aws_iam_role.iam_for_lambda.arn
}

resource "aws_iam_role" "iam_for_lambda" {
  name = "fast_lambda_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      }
    }
  ]
}
EOF
}
