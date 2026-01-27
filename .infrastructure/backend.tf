terraform {
  # https://docs.digitalocean.com/products/spaces/reference/terraform-backend/#use-state-locking-with-spaces
  # AWS_ACCESS_KEY_ID="<your_access_key>"
  # AWS_SECRET_ACCESS_KEY="<your_secret_key>"
  required_version = "~> 1.11"
  backend "s3" {
    endpoints = {
      s3 = "https://sfo3.digitaloceanspaces.com"
    }

    bucket = "opentofu-states"
    key    = "${var.environment}/terraform.tfstate"

    # Deactivate a few AWS-specific checks
    skip_credentials_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    skip_s3_checksum            = true
    region                      = "sfo3"

    # Enable state locking with a lockfile
    use_lockfile = true

  }
}
