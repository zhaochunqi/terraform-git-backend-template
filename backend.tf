# Generated by Terragrunt. Sig: nIlQXj57tbuaRZEa
terraform {
  backend "http" {
    address        = "http://localhost:6061/?type=git&repository=git@github.com:zhaochunqi/terraform-states.git&ref=main&state=github.com/zhaochunqi/terraform-states/state.json"
    lock_address   = "http://localhost:6061/?type=git&repository=git@github.com:zhaochunqi/terraform-states.git&ref=main&state=github.com/zhaochunqi/terraform-states/state.json"
    unlock_address = "http://localhost:6061/?type=git&repository=git@github.com:zhaochunqi/terraform-states.git&ref=main&state=github.com/zhaochunqi/terraform-states/state.json"
  }
}
