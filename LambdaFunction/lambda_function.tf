data "archive_file" "zip_the_python_code" {
  type        = var.type
  source_dir  = "${path.module}/${var.source_dir}/"
  output_path = "${path.module}/${var.source_dir}/${var.output_path}"
}

resource "aws_lambda_function" "lambda_function" {
  filename      = "${path.module}/${var.source_dir}/${var.output_path}"
  handler       = "${var.handler}.${var.lambda_handler}"
  function_name = var.lambda_function_name
  runtime       = var.python_ver
  role          = aws_iam_role.lambda_role_ebs.arn
  depends_on    = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]

  environment {
    variables = {
      SNS_TOPIC_ARN = var.sns_topic_arn
    }
  }

}
