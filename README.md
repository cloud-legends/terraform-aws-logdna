# Terraform Module LogDNA

This Terraform module uses a lambda function for routing Cloudwatch logs to [LogDNA](https://logdna.com/).

The Module currently supports Terraform 0.11.x, but does not require it. If you use tfenv, this module contains a .terraform-version file which matches the version of Terraform we currently use to test with.

Usage
-----

```hcl
module "logdna" {
  source                            = "github.com/kabisa/terraform-aws-logdna"
  filter_pattern                    = "[host, ident, authuser, date, request, status, bytes]"
  log_group_name                    = "name-of-cloudwatch-log-group"
  log_subscription_filter_name      = "name-of-cloudwatch-subscription-filter"
  lambda_execute_role_name          = "lambda-execute-stream-role"
  log_dna_key                       = "${var.log_dna_key}"
  log_group_arn                     = "arn-of-log-group"
  lambda_principal                  = "logs.eu-west-2.amazonaws.com"
  log_subscription_filter           = "logdna-cloudwatch"
}
```
