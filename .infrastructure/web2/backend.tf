terraform {
  # https://docs.digitalocean.com/products/spaces/reference/terraform-backend/#use-state-locking-with-spaces
  # AWS_ACCESS_KEY_ID="<your_access_key>"
  # AWS_SECRET_ACCESS_KEY="<your_secret_key>"
  required_version = "~> 1.11"
  backend "s3" {}
}
