module "LambdaFunction" {
  source = "./LambdaFunction"

  type = var.type

  lambda_function_name = var.lambda_function_name
  handler              = var.handler
  lambda_handler       = var.lambda_handler
  python_ver           = var.python_ver
  source_dir           = var.source_dir
  output_path          = var.output_path

  sns_topic_arn = module.SimpleNotificationService.sns_topic_arn
}


module "EventBridge" {
  source = "./EventBridge"

  name_eventbridge    = var.name_eventbridge
  description         = var.description
  schedule_expression = var.schedule_expression

  target_id = var.target_id

  statement_id = var.statement_id
  action       = var.action
  principal    = var.principal

  lambda_function_arn = module.LambdaFunction.lambda_function_arn
  function_name       = module.LambdaFunction.function_name
}

module "SimpleNotificationService" {
  source = "./SimpleNotificationService"

  name_sns_topic = var.name_sns_topic

  protocol       = var.protocol
  endpoint_email = var.endpoint_email


  function_name       = module.LambdaFunction.function_name
  lambda_function_arn = module.LambdaFunction.lambda_function_arn
}