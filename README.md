# terraform-aws-lambda-sns

## usage

```hcl
module "slack-sns" {
  source = "github.com/nalbam/terraform-aws-lambda-sns"
  region = "${var.region}"

  name        = "slack"
  stage       = "${var.stage}"
  description = "sns > lambda > slack"
  runtime     = "nodejs10.x"
  handler     = "index.handler"
  memory_size = 512
  timeout     = 5
  s3_bucket   = "${var.bucket}"
  s3_key      = "data/lambda-slack.zip"

  env_vars = {
    PROFILE        = "${var.stage}"
    SLACK_HOOK_URL = "${var.SLACK_HOOK_URL}"
  }
}
```
