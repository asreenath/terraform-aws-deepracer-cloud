# provider

provider "aws" {
  region = var.region
  # shared_credentials_file = "/Users/Sairam/.aws/credentials"
  # profile                 = "adfs"
  # skip_metadata_api_check = "true"
  # access_key              = ""
  # secret_key              = ""
  # assume_role {
  #   role_arn = "arn:aws:iam::070596614028:role/l1-developers"
  # }
  access_key = "test"
  secret_key = "test"
  token      = "test"
}
