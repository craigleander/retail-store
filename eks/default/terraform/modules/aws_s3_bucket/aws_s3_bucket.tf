resource "aws_s3_bucket" "this" {
  bucket              = var.bucket
  force_destroy       = var.force_destroy
  object_lock_enabled = var.object_lock_enabled
  tags                = var.tags
}

resource "aws_s3_bucket_public_access_block" "retail_store_compliance_logs" {
  bucket                  = aws_s3_bucket.retail_store_compliance_logs.id
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
  ignore_public_acls      = true
}


