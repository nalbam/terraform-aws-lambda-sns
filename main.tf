# Lambda Function : sns > lambda

module "lambda" {
  source = "git::https://gitlab.com/nalbam/terraform-aws-lambda.git"
  region = "${var.region}"

  name = "${var.name}"
  stage = "${var.stage}"
  description = "${var.description}"
  runtime = "${var.runtime}"
  handler = "${var.handler}"
  memory_size = "${var.memory_size}"
  timeout = "${var.timeout}"
  s3_bucket = "${var.s3_bucket}"
  s3_key = "${var.s3_key}"
  env_vars = "${var.env_vars}"
}

resource "aws_sns_topic" "default" {
  name = "${var.name}-${var.stage}"
}

resource "aws_sns_topic_subscription" "default" {
  topic_arn = "${aws_sns_topic.default.arn}"
  protocol = "lambda"
  endpoint = "${module.lambda.lambda_function_arn}"
}

resource "aws_lambda_permission" "default" {
  action = "lambda:invokeFunction"
  function_name = "${module.lambda.lambda_function_arn}"
  principal = "sns.amazonaws.com"
  statement_id = "AllowSNSToSlackExecutionFromSNS"

  source_arn = "${aws_sns_topic.default.arn}"
}
