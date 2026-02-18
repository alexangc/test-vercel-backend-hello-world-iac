terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }

    vercel = {
      source  = "vercel/vercel"
      version = ">= 2.0"
    }
  }

}

resource "vercel_project" "my_project" {
  auto_assign_custom_domains                        = true
  automatically_expose_system_environment_variables = false
  build_command                                     = null
  build_machine_type                                = null
  customer_success_code_visibility                  = false
  dev_command                                       = var.dev_command
  directory_listing                                 = false
  enable_affected_projects_deployments              = false
  enable_preview_feedback                           = null
  enable_production_feedback                        = false
  environment                                       = null
  framework                                         = "express"
  function_failover                                 = false
  git_comments                                      = null
  git_fork_protection                               = true
  git_lfs                                           = false
  # git_provider_options                              = null.   # gives a lint error in vscode for some reason?
  git_repository = {
    deploy_hooks      = null
    production_branch = "main"
    repo              = "alexangc/test-vercel-backend-hello-world-iac"
    type              = "github"
  }
  ignore_command  = null
  install_command = null
  name            = var.project_name
  node_version    = "22.x"
  oidc_token_config = {
    issuer_mode = "team"
  }
  on_demand_concurrent_builds             = false
  options_allowlist                       = null
  output_directory                        = null
  password_protection                     = null
  preview_deployment_suffix               = null
  preview_deployments_disabled            = true
  prioritise_production_builds            = true
  protection_bypass_for_automation        = null
  protection_bypass_for_automation_secret = null # sensitive
  public_source                           = null
  resource_config = {
    fluid                     = true
    function_default_cpu_type = null
    function_default_regions  = ["iad1"]
    function_default_timeout  = null
  }
  root_directory  = null
  skew_protection = null
  team_id         = null
  trusted_ips     = null
  vercel_authentication = {
    deployment_type = "standard_protection_new"
  }
}
