variable "filter_pattern" {
  type        = string
  description = "A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events."
  default     = "[host, ident, authuser, date, request, status, bytes]"
}

variable "environment" {
  type        = string
  description = "The name of the current environment. (e.g acceptence, production)"
}

variable "application_name" {
  type        = "string"
  description = "The name of the application"
}

variable "log_group_name" {
  type        = string
  description = "The name of the log group to associate the subscription filter with"
}

variable "lambda_execute_role_name" {
  type        = string
  description = "The name of the execution IAM role."
}

variable "log_dna_key" {
  type        = string
  description = "LogDNA Ingestion Key."
}

variable "log_group_arn" {
  type        = string
  description = "The ARN of the Cloudwatch Log Group for which to forward logs for."
}

variable "region" {
  type        = string
  description = "The region in which the Cloudwatch Log Group is provisioned."
}

variable "log_subscription_filter" {
  type        = string
  description = "The name for the Cloudwatch Log subscription filter."
}
