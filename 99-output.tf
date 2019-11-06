# output

output "arn" {
  value = module.lambda.arn
}

output "invoke_arn" {
  value = module.lambda.invoke_arn
}

output "sns_arn" {
  value = aws_sns_topic.default.arn
}
