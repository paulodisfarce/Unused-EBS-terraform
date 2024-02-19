output "lambda_function_arn" {
  value = module.LambdaFunction.lambda_function_arn
}

output "sns_topic_arn" {
  value = module.SimpleNotificationService.sns_topic_arn
}

output "function_name" {
  value = module.LambdaFunction.function_name
}