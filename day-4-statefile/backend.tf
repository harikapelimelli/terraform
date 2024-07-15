terraform {
backend "s3" {
    bucket = "bucket9505"
    region = "ap-south-1"
    key = "day-3/terraform.tfstate"
 dynamodb_table = "dynamodb-table"
 encrypt = true
}
}