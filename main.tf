provider "aws" {
  version = "~> 2.0"
  region  = var.region
}

module "consul" {
  source  = "hashicorp/consul/aws"
  version = "0.7.3"
  # insert the 4 required variables here
  ami_id = var.ami_id
  ssh_key_name = var.ssh_key_name
  vpc_id = var.vpc_id
  spot_price = var.spot_price
}

module "vault" {
  source  = "pbar1/vault/aws"
  version = "0.0.1"
  # insert the 6 required variables here
  ami_id = var.v_ami_id
  vpc_id = var.v_vpc_id
  ssh_key_name = var.ssh_key_name
  zone_id = var.v_zone_id
  domain_name = var.v_domain_name
  acm_cert_arn = var.v_acm_cert_arn
}