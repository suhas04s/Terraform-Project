# backing terraform statefile into s3 bucket 

terraform {
  backend "s3" {
    bucket = "mytpr7456"
    key = "terraform_state_file.terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "terraform_lock"
    encrypt = true
    
  }
}