resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-f2g6219"

  tags = {
    Name = "Terraform State"
  }
}


