########################################
# ----------> Lambda Function<----------
########################################

variable "lambda_function_name" {
  type    = string
  default = "UnusedEBSvolume_Lambda_Function"
}

variable "handler" {
  type    = string
  default = "index"
}

variable "lambda_handler" {
  type    = string
  default = "lambda_handler"
}

variable "python_ver" {
  type    = string
  default = "python3.11"
}

variable "source_dir" {
  type    = string
  default = "data_python"
}

variable "output_path" {
  type    = string
  default = "index.zip"
}

variable "type" {
  type    = string
  default = "zip"
}
#####################################
# ----------> EventBridge <----------
#####################################

variable "description" {
  type    = string
  default = "Trigger Lambda Function daily at 3 AM (BRST)"
}

variable "schedule_expression" {
  type    = string
  default = "cron(0 3 * * ? *)"
}

variable "name_eventbridge" {
  type    = string
  default = "DailyLambdaTrigger"
}

variable "target_id" {
  type    = string
  default = "LambdaTarget"
}

variable "statement_id" {
  type    = string
  default = "AllowExecutionFromCloudWatch"
}

variable "action" {
  type    = string
  default = "lambda:InvokeFunction"
}

variable "principal" {
  type    = string
  default = "events.amazonaws.com"
}

###################################################
# ----------> SimpleNotificationService <----------
###################################################

variable "name_sns_topic" {
  type    = string
  default = "lambda_error_topic"
}

variable "protocol" {
  type    = string
  default = "email"
}

variable "endpoint_email" {
  type    = string
  default = "paulo.odbcontato2@gmail.com"
}




