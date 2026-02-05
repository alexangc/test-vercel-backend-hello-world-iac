# This config file must be passed to the `tofu init`command via the
# `-backend-config` option.

# The backend can be migrated to a new bucket using:
# ````
# tofu -chdir=".infrastructure/<app>" init -migrate-state -var-file="env/production.tfvars" -backend-config="../common/_backend_config.tfvars"
# ```

endpoints = {
  s3 = "https://sfo3.digitaloceanspaces.com"
}

bucket = "tmp-opentofu-tests"
key    = "${var.project_name}/${var.environment}/terraform.tfstate"

# Deactivate a few AWS-specific checks
skip_credentials_validation = true
skip_requesting_account_id  = true
skip_metadata_api_check     = true
skip_region_validation      = true
skip_s3_checksum            = true
region                      = "sfo3"

# Enable state locking with a lockfile
use_lockfile = true
