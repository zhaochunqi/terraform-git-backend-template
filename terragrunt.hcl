locals {
  repo_path = "${regex("^git@([^:]+):(.+)\\.git$", get_env("GIT_REPO_URL"))[0]}/${regex("^git@([^:]+):(.+)\\.git$", get_env("GIT_REPO_URL"))[1]}"
  state_path = path_relative_to_include() == "." ? "state.json" : "${path_relative_to_include()}/state.json"
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "http" {
    address        = "http://localhost:6061/?type=git&repository=${get_env("GIT_REPO_URL")}&ref=${get_env("GIT_REPO_BRANCH")}&state=${local.repo_path}/${local.state_path}"
    lock_address   = "http://localhost:6061/?type=git&repository=${get_env("GIT_REPO_URL")}&ref=${get_env("GIT_REPO_BRANCH")}&state=${local.repo_path}/${local.state_path}"
    unlock_address = "http://localhost:6061/?type=git&repository=${get_env("GIT_REPO_URL")}&ref=${get_env("GIT_REPO_BRANCH")}&state=${local.repo_path}/${local.state_path}"
  }
}
EOF
}
