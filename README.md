# terraform-aws-lambda-sns

## usage
```
module "lambda" {
  source = "git::https://gitlab.com/nalbam/terraform-aws-lambda-sns.git"
  region = "ap-northeast-2"

  name = "demo"
  stage = "dev"
  runtime = "nodejs6.10"
  handler = "index.handler"
  bucket = "bucket_name"
  package = "data/demo.zip"
}
```
