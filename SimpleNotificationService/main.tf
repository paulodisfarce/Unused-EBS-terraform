resource "aws_sns_topic" "lambda_error_topic" {
  name = var.name_sns_topic
}

resource "aws_sns_topic_subscription" "lambda_error_email_subscription" {
  protocol  = var.protocol
  endpoint  = var.endpoint_email
  topic_arn = aws_sns_topic.lambda_error_topic.arn

}


