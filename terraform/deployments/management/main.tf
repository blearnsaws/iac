resource "aws_s3_bucket" "mgt" {
  bucket = "blearnsaws-deployments"
  versioning {
    enabled = true
  }
  tags = {
    Name        = "DeploymentBucket"
    Environment = "Management"
  }
}

resource "aws_s3_bucket_acl" "mgt" {
  bucket = aws_s3_bucket.mgt.id
  acl    = "private"
}

// Test environment
resource "aws_dynamodb_table" "state-lock-dynamodb" {
  name = "test-webserver-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}