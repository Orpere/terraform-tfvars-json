provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

module "consul" {
  source  = "hashicorp/consul/aws"
  version = "0.7.3"
  # insert the 4 required variables here
  ami_id       = var.ami_id
  ssh_key_name = var.ssh_key_name
  vpc_id       = var.vpc_id
  spot_price   = var.spot_price
}

module "vault" {
  source  = "hashicorp/vault/aws"
  version = "0.13.3"
  # insert the 4 required variables here
  hosted_zone_domain_name = var.hosted_zone_domain_name
  ami_id                  = var.v_ami_id
  vault_domain_name       = var.vault_domain_name
  ssh_key_name            = var.ssh_key_name
}

