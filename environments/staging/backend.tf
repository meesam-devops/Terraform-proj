terraform {
  backend "s3" {
    bucket         = "your-org-terraform-state"       # placeholder — replace with your own
    key            = "staging/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"            # placeholder — enables state locking
    encrypt        = true
  }
}
