

/*  # this below code is using count arguments loop created 3 buckets in 3 different region
resource "aws_s3_bucket" "testing25" {
  count  = length(var.buckets)
  bucket = var.buckets[count.index].name
  tags = {
    Name = var.buckets[count.index].region
  }

}  */


# this below code is using for_each arguments loop created 3 buckets in 3 different region
resource "aws_s3_bucket" "testing26" {
  for_each = {
    "bucket1" = "sasaj1"
    "bucket2" = "sasaj2"
    "bucket3" = "sasaj3"
  }

  bucket = each.value

  tags = {
    Name = each.value
  }
}