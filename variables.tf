variable "ami_id" {
  description = "The ID of the AMI to run in the cluster. This should be an AMI built from the Packer template under examples/consul-ami/consul.json. To keep this example simple, we run the same AMI on both server and client nodes, but in real-world usage, your client nodes would also run your apps. If the default value is used, Terraform will look up the latest AMI build automatically."
  type        = string
  default     = null
}

variable "ssh_key_name" {
  description = "The name of an EC2 Key Pair that can be used to SSH to the EC2 Instances in this cluster. Set to an empty string to not associate a Key Pair."
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The ID of the VPC in which the nodes will be deployed.  Uses default VPC if not supplied."
  type        = string
  default     = null
}

variable "spot_price" {
  description = "The maximum hourly price to pay for EC2 Spot Instances."
  type        = number
  default     = null
}

variable "region" {
  description = "The region to deploy the instance"
  default     = "us-east-1"
}

# Vault

variable "hosted_zone_domain_name" {
  description = "The domain name of the Route 53 Hosted Zone in which to add a DNS entry for Vault (e.g. example.com). Only used if var.create_dns_entry is true."
  type        = string
  default     = null
}

variable "vault_domain_name" {
  description = "The domain name to use in the DNS A record for the Vault ELB (e.g. vault.example.com). Make sure that a) this is a domain within the var.hosted_zone_domain_name hosted zone and b) this is the same domain name you used in the TLS certificates for Vault. Only used if var.create_dns_entry is true."
  type        = string
  default     = null
}

variable "v_ami_id" {
  description = "The ID of the AMI to run in the cluster. This should be an AMI built from the Packer template under examples/vault-consul-ami/vault-consul.json. If no AMI is specified, the template will 'just work' by using the example public AMIs. WARNING! Do not use the example AMIs in a production setting!"
  type        = string
  default     = null
}
