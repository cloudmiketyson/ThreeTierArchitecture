# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "xxxxx" # your s3 bucket
    key       = "xxxxx" # your tf state file name
    region    = "xxxx"
    # profile   = "xxxx" # your aws credentials
  }
}
