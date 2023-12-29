terraform {
    backend "s3" {
        bucket = "terraform-state-7w7obgtx"
        key = "terraform.tfstate"
        region = "us-east-1"
        profile = "terraform"
    }
}
