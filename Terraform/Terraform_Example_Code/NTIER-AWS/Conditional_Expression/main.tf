resource "aws_s3_bucket" "item" {
  count      = terraform.workspace == "default" ? 1: 0
  bucket     = random_string.bucket_names[count.index].id
  depends_on = [random_string.bucket_names]
}


resource "random_string" "bucket_names" {
  count   = terraform.workspace == "default" ? 1: 0
  length  = 8
  special = false
  lower   = true
  numeric = false
}