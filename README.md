[<img src="https://images.ctfassets.net/ede0ajjyowtx/uvtReubsCYyNXqiKaO4Fg/180842b35ff3d0d57836cf7083fb2328/kabisa_logo_two_color.svg" width="450" alt="Kabisa logo"/>][website]

# terraform-aws-logdna 
[![Build Status][build_status_img]][build_status_link] [![Latest Release][release_img]][release_url] [![Terraform version][terraform_version_logo]][terraform_version_url] [![Slack Community][slack_img]][theguild_slack_url] [![License][license_img]](LICENSE)


Terraform module designed to forward AWS Cloudwatch Logs to LogDNA.
The module subscribes to a Cloudwatch Logs Group. A Lambda function then forwards the logs to LogDNA.

&nbsp;
It's 100% Open Source and licensed under the [MIT](LICENSE) license.


## Usage

This project is available on the [Terraform Registry][terraform_registry_url]

Include this module in your existing terraform code:

```hcl
module "logdna" {
  source  = "kabisa/logdna/aws"
  #Use the latest version from the Terraform Registry
  version = "0.0.0"

  filter_pattern                    = "[host, ident, authuser, date, request, status, bytes]"
  environment                       = "acceptance"
  log_group_name                    = "name-of-cloudwatch-log-group"
  log_subscription_filter_name      = "name-of-cloudwatch-subscription-filter"
  lambda_execute_role_name          = "lambda-execute-stream-role"
  log_dna_key                       = "${var.log_dna_key}"
  log_group_arn                     = "arn-of-log-group"
  region                            = "eu-west-1"
  log_subscription_filter           = "logdna-cloudwatch"
  application_name                  = "testapp"
}
```




## Makefile Targets
```
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform code

```
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| filter_pattern | A valid CloudWatch Logs filter pattern for subscribing to a filtered stream of log events. | string | `[host, ident, authuser, date, request, status, bytes]` | no |
| environment | The name of the current environment. (e.g acceptence, production) | string | `-` | yes |
| log_group_name | The name of the log group to associate the subscription filter with. | string | `-` | yes |
| lambda_execute_role_name | The name of the execution IAM role. | string | `-` | yes |
| log_dna_key | LogDNA Ingestion Key. | string | `-` | yes |
| log_group_arn | The ARN of the Cloudwatch Log Group for which to forward logs for. | string | `-` | yes |
| region | The region in which the Cloudwatch Log Group is provisioned. | string | `-` | yes |
| log_subscription_filter | The name for the Cloudwatch Log subscription filter. | string | `-` | yes |


## Outputs

None




## Share the Love 

Like this project? Please give it a ★ on [our GitHub](https://github.com/kabisa/terraform-aws-logdna)! (it helps us **a lot**) 

Are you using this project or any of our other projects? Consider sharing this project: 
[<img align="right" title="Share via Email" src="https://images.ctfassets.net/ede0ajjyowtx/6FgtYsQxQy42f81BV5NVLb/86ada33c42037504add9c7f668434217/ios-email.svg"/>][share_email]
[<img align="right" title="Share on Twitter" src="https://images.ctfassets.net/ede0ajjyowtx/6d5a5dtEB77S4I1jXaZI2u/2a84b54a7b351a061e0bd5826052aaa6/social-twitter.svg" />][share_twitter]
[<img align="right" title="Share on LinkedIn" src="https://images.ctfassets.net/ede0ajjyowtx/4YEBKx16jYGABWjhBmO0x3/d4384b9e3088d39ca6bd4b5d8ba8f6a0/social-linkedin.svg" />][share_linkedin]
[<img align="right" title="Share on Facebook" src="https://images.ctfassets.net/ede0ajjyowtx/6NQy3vGRHYgTpi4geq6mVF/f3acf7286c7accb408e9deb8a0b6f4c2/social-facebook.svg" />][share_facebook]



## Help

**Got a question?**

File a GitHub [issue](https://github.com/kabisa/terraform-aws-logdna/issues), or send us an [email][contact].


## Support

At Kabisa we believe in the power of AWS in combination with Infrastructure as Code. Our DevOps Engineers are AWS certified and as a result of our expertise and experience we are official AWS partner Standard.

Struggling with Terraform our just need an extra hand? Contact us  at:

[![E-Mail](https://img.shields.io/badge/email-sales@kabisa.nl-blue.svg)](mailto:sales@kabisa.nl)



## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/kabisa/terraform-aws-logdna/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://cpco.io/help-out) with our other projects, we would love to hear from you! Shoot us an [email][contact].

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!


## Copyright

Copyright © 2019 [Kabisa B.V][website]



## License 

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE) 

See [LICENSE](LICENSE) for full details.

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [Kabisa B.V][website]. Like it? Please let us know by [leaving a comment][contact]!

[<img src="https://images.ctfassets.net/ede0ajjyowtx/uvtReubsCYyNXqiKaO4Fg/180842b35ff3d0d57836cf7083fb2328/kabisa_logo_two_color.svg" width="450" alt="Kabisa logo"/>][website]



  [logo]: https://images.ctfassets.net/ede0ajjyowtx/uvtReubsCYyNXqiKaO4Fg/180842b35ff3d0d57836cf7083fb2328/kabisa_logo_two_color.svg
  [website]: https://kabisa.nl
  [build_status_img]: https://api.travis-ci.com/kabisa/terraform-aws-logdna.svg?branch=master
  [build_status_link]: https://travis-ci.com/kabisa/terraform-aws-logdna
  [release_img]: https://img.shields.io/github/v/release/kabisa/terraform-aws-logdna?sort=semver
  [release_url]: https://github.com/kabisa/terraform-aws-logdna/releases/latest
  [terraform_version_logo]: https://img.shields.io/static/v1?label=Terraform%20version&message=v0.12.15&color=5C4EE5&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAjCAMAAADCMPhoAAAAAXNSR0IB2cksfwAAAAlwSFlzAAAWJQAAFiUBSVIk8AAAAltQTFRFX0PpX0PpX0PpAAAAX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyQECyX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PoR0C+QECyQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpX0PoR0C9QECyQECyQECyX0PpX0PpX0PpX0PpXkPoRkC9QECyQECyX0PpX0PpX0PpX0PpX0PpXkPoRkC9QECyX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyX0PpX0PpX0PpQECyQECyQECyX0PpX0PpX0PpQECyQECyQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyQECyX0PpX0PpX0PpX0PpX0PpX0PpQECyQECyQECyQECyX0PpX0PpX0PpXkPoRkC9QECyQECyQECyX0PpX0PpX0PpX0PpXkPnRkC9QECyQECyX0PpX0PpWULfQ0C4X0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpX0PpEc+yhgAAAMl0Uk5TTR0FALjDdCIDyPHlu3Yu9//fok8TAezCi04L++q/cgwIAAMM+csfVSgJARE9WvrRKY1UIytirbby1IpHHgALJVaZ3fbB+P2HPhIEG0ia5f/1ymkZCAEKKozc+27a/vC3Tg5qzPcadc/zwUDh/gIRN3n8ykTqBxtSpw8wYZsNL1HE9bUK0PbwuWdchab87MiRShMQhoSv2PHNllQWydaOZXzp+t6qF2ia171C2Mtp9L1kRHIxbyLvuQQCusbFHKDZcbzmO+08lC1rS/7iJQAAAbtJREFUeJxjYGBkYsYHGFhY2dg58Cng5OLm4eXDbQoDJ78Av6CQsIgoHgUCAmLiEpJS+BQISMvIyskrYJiiqKQMVSAgoKKqpq6hiapES1tHF65AT9+AxdDIWAFJWtnE1MwcWYGqhaWVtY2CLUTazt7B0cnZBUWBq4CbpbuHJ8geL28fXz9/f6AC2QBkBUC3BAYFh4SGhUdERvmDFUTHqMQiKxCIjYtPSExKTvH3hyhQSE1Ld0VWIBCbkZmVHZUDU8Ccm5dfEFiIpEDAtai4xN8froDZtrSsvEIMjwJmZtHKquoaHjwKgEpq6+rLGvgxFDQ2McDCTbS0uaClFVVBTlt7B1wBUEVnV7e+BUJBT29f/4SJSAomVUyOnjJ1WgBUwfQZM2fNBkY3koI5GXPnzV/AspAfqGDR4iW6S7WY0RQA40J8Wf3yFStXrV6z1lsLkmBQFQgIrFu/YeOmzVu2esFSFLoCgdht28t37NRSxKlAINZilzwiZWFRIOC6u5ZGCir3EFCgsAAWF9gV2Irunb9vvytuBSBDGA8cPKSCRwEzc+lhK84j/HgUMDNLHT0WswufAmZmheMnmhEKAKMnrgvDKLJtAAAAAElFTkSuQmCC
  [terraform_version_url]: https://github.com/hashicorp/terraform/blob/master/CHANGELOG.md#01215-november-14-2019
  [slack_img]: https://img.shields.io/badge/slack-theguild-pink.svg
  [license_img]: https://img.shields.io/badge/License-MIT-blue.svg
  [theguild_slack_url]: https://theguildslacking.herokuapp.com/
  [terraform_registry_url]: https://registry.terraform.io/modules/kabisa/logdna/aws/
  [contact]: https://www.kabisa.nl/contact/
  [share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-logdna&url=https://github.com/kabisa/terraform-aws-logdna
  [share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-logdna&url=https://github.com/kabisa/terraform-aws-logdna
  [share_reddit]: https://reddit.com/submit/?url=https://github.com/kabisa/terraform-aws-logdna
  [share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/kabisa/terraform-aws-logdna
  [share_email]: mailto:?subject=terraform-aws-logdna&body=https://github.com/kabisa/terraform-aws-logdna
