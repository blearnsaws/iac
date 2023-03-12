output "bucket_name" {
    value = resource.aws_s3_bucket.mgt.id
}

output "bucket_arn" {
    value = resource.aws_s3_bucket.mgt.arn
}