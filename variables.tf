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

variable "v_ami_id" {
  description = "AMI ID to launch the Vault auto scaling group with"
}

variable "v_vpc_id" {
  description = "ID of the AWS VPC to create the Vault cluster in"
}

variable "v_zone_id" {
  description = "Route53 hosted zone ID to create the DNS entry in"
}

variable "v_domain_name" {
  description = "Domain name of DNS entry to create"
}

variable "v_acm_cert_arn" { 
  description = "Cert ARN for NLB TLS termination"
}