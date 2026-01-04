terraform {
  backend "s3" {
    bucket         = "game-mario-bucket"  # Ensure this is your actual S3 bucket

    key            = "eks/terraform.tfstate"  # Standardized directory naming
    region         = "us-east-1"
    encrypt        = true  # Ensures state file is encrypted
    dynamodb_table = "samiracavalcanti-terraform"  # Enables state locking to prevent conflicts
  }
}
