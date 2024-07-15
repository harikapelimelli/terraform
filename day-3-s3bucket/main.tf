resource "aws_s3_bucket" "example" {
    bucket = "bucket9505"

  
}

  

resource "aws_dynamodb_table" "dynamodb_terraform" {
    name = "dynamodb-table"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20
    attribute {
      name = "LockID"
      type = "S"
    }
  
}
