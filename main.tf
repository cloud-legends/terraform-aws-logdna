/* Lambda execution role */
data "aws_iam_policy_document" "lambda_stream_role"{
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_execute_role" {
  name                  = var.lambda_execute_role_name
  assume_role_policy    = data.aws_iam_policy_document.lambda_stream_role.json
  force_detach_policies = true
}

data "aws_iam_policy_document" "lambda_stream_policy"{
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_role_policy" "lambda_container_policy" {
  role   = aws_iam_role.lambda_execute_role.id
  policy = data.aws_iam_policy_document.lambda_stream_policy.json
}

/* Lambda function */
resource "aws_lambda_function" "lambda_stream" {
  function_name    = "logdna_cloudwatch"
  handler          = "index.handler"
  runtime          = "nodejs14.x"
  filename         = "${path.module}/lambda/stream_to_logdna.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda/stream_to_logdna.zip")
  role             = aws_iam_role.lambda_execute_role.arn

  environment {
    variables = {
      LOGDNA_KEY       = var.log_dna_key
      ENVIRONMENT      = var.environment
      APPLICATION_NAME = var.application_name
    }
  }

  lifecycle {
    ignore_changes = [filename]
  }
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_stream.function_name
  principal     = "logs.${var.region}.amazonaws.com"
  source_arn    = var.log_group_arn
}

/* Log subscription filter */
resource "aws_cloudwatch_log_subscription_filter" "test_lambdafunction_logfilter" {
  name            = var.log_subscription_filter
  log_group_name  = var.log_group_name
  filter_pattern  = var.filter_pattern
  destination_arn = aws_lambda_function.lambda_stream.arn
  distribution    = "ByLogStream"

  depends_on = [aws_lambda_permission.allow_cloudwatch]
}
