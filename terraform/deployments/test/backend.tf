terraform {
  required_version = ">=0.12.0"
  backend "s3" {
    region         = "us-east-1"
    key            = "infra/test/webserver/terraform.tfstate"
    bucket         = "blearnsaws-deployments"
    dynamodb_table = "test-webserver-dynamo"
  }
}