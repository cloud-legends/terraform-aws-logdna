variable "filter_pattern" {
  default = "[host, ident, authuser, date, request, status, bytes]"
}

variable "log_group_name" {}
variable "log_subscription_filter_name" {}
variable "lambda_execute_role_name" {}
variable "log_dna_key" {}
variable "log_group_arn" {}
variable "lambda_principal" {}
variable "log_subscription_filter" {}