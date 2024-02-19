resource "aws_cloudwatch_event_rule" "daily_trigger_rule" {
  name                = var.name_eventbridge
  description         = var.description
  schedule_expression = var.schedule_expression

}

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.daily_trigger_rule.name
  target_id = var.target_id
  arn       = var.lambda_function_arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = var.statement_id
  action        = var.action
  function_name = var.function_name
  principal     = var.principal

  source_arn = aws_cloudwatch_event_rule.daily_trigger_rule.arn
}