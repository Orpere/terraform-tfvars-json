# This repo show how to add a json tfvars on terraform

this repo is based on the documentation

1) [input variables](https://www.terraform.io/docs/configuration/variables.html)
2) [json syntax](https://www.terraform.io/docs/configuration/syntax-json.html)

- [x] Install [git](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
- [x] How to use this repo

## How to use this repo

- In a directory of your choice, clone the github repository :
  
```bash
git clone git@github.com:orlando-pereira/terraform-tfvars-json.git
```

- Change into the directory :
  
```bash
cd terraform-tfvars-json
```

- update your values in terraform.tfvars.json
  
```json
{
	"ami_id": "<consul ami>",
	"ssh_key_name": "<key pair name>",
	"vpc_id": "<vpc>",
	"spot_price": "<price>",
	"region": "us-east-1",
	"hosted_zone_domain_name": "eample.xt",
	"vault_domain_name": "vault.eample.xt",
	"v_ami_id": "<vault ami created with packer>"
}
```

- run terraform init

```bash
terraform init

Initializing modules...

Initializing the backend...

Initializing provider plugins...

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.template: version = "~> 2.1"

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

- run terraform plan
  
```bash
terraform plan
Refreshing Terraform state in-memory prior to plan...
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.

module.vault.data.template_file.user_data_consul: Refreshing state...
module.consul.data.template_file.user_data_server: Refreshing state...
module.consul.data.template_file.user_data_client: Refreshing state...
module.consul.module.consul_servers.module.iam_policies.data.aws_iam_policy_document.auto_discover_cluster: Refreshing state...
module.vault.data.aws_region.current: Refreshing state...
module.consul.module.consul_clients.data.aws_iam_policy_document.instance_role: Refreshing state...
module.vault.data.aws_vpc.default: Refreshing state...
module.consul.data.aws_vpc.default: Refreshing state...
module.vault.module.consul_cluster.data.aws_iam_policy_document.instance_role: Refreshing state...
module.consul.data.aws_region.current: Refreshing state...
module.vault.data.aws_ami.vault_consul: Refreshing state...
module.vault.module.consul_iam_policies_servers.data.aws_iam_policy_document.auto_discover_cluster: Refreshing state...
module.vault.module.vault_cluster.data.aws_iam_policy_document.instance_role: Refreshing state...
module.consul.module.consul_servers.data.aws_iam_policy_document.instance_role: Refreshing state...
module.consul.data.aws_ami.consul: Refreshing state...
module.vault.module.consul_cluster.module.iam_policies.data.aws_iam_policy_document.auto_discover_cluster: Refreshing state...
module.consul.module.consul_clients.module.iam_policies.data.aws_iam_policy_document.auto_discover_cluster: Refreshing state...
module.vault.data.template_file.user_data_vault_cluster: Refreshing state...
module.vault.data.aws_subnet_ids.default: Refreshing state...
module.consul.data.aws_subnet_ids.default: Refreshing state...

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.consul.module.consul_clients.aws_autoscaling_group.autoscaling_group will be created
  + resource "aws_autoscaling_group" "autoscaling_group" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 6
      + force_delete              = false
      + health_check_grace_period = 300
      + health_check_type         = "EC2"
      + id                        = (known after apply)
      + launch_configuration      = (known after apply)
      + load_balancers            = (known after apply)
      + max_size                  = 6
      + metrics_granularity       = "1Minute"
      + min_size                  = 6
      + name                      = (known after apply)
      + name_prefix               = "consul-example-client"
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + tags                      = [
          + {
              + "key"                 = "Name"
              + "propagate_at_launch" = "true"
              + "value"               = "consul-example-client"
            },
          + {
              + "key"                 = "consul-clients"
              + "propagate_at_launch" = "true"
              + "value"               = "consul-example"
            },
        ]
      + target_group_arns         = (known after apply)
      + termination_policies      = [
          + "Default",
        ]
      + vpc_zone_identifier       = [
          + "subnet-293b5725",
          + "subnet-3c4c0111",
          + "subnet-632c5738",
          + "subnet-7e43c142",
          + "subnet-db794b92",
          + "subnet-f0bcc295",
        ]
      + wait_for_capacity_timeout = "10m"
    }

  # module.consul.module.consul_clients.aws_iam_instance_profile.instance_profile[0] will be created
  + resource "aws_iam_instance_profile" "instance_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = (known after apply)
      + name_prefix = "consul-example-client"
      + path        = "/"
      + role        = (known after apply)
      + roles       = (known after apply)
      + unique_id   = (known after apply)
    }

  # module.consul.module.consul_clients.aws_iam_role.instance_role[0] will be created
  + resource "aws_iam_role" "instance_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = (known after apply)
      + name_prefix           = "consul-example-client"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # module.consul.module.consul_clients.aws_launch_configuration.launch_configuration will be created
  + resource "aws_launch_configuration" "launch_configuration" {
      + associate_public_ip_address = false
      + ebs_optimized               = false
      + enable_monitoring           = true
      + iam_instance_profile        = (known after apply)
      + id                          = (known after apply)
      + image_id                    = "ami-0a9b5046374af8659"
      + instance_type               = "t2.micro"
      + key_name                    = "orlando2"
      + name                        = (known after apply)
      + name_prefix                 = "consul-example-client-"
      + security_groups             = (known after apply)
      + spot_price                  = "0.0069"
      + user_data                   = "97e031d0aa6d1e6b2cd1838301fbecde7751eefb"

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + no_device             = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = true
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + volume_size           = 50
          + volume_type           = "standard"
        }
    }

  # module.consul.module.consul_clients.aws_security_group.lc_security_group will be created
  + resource "aws_security_group" "lc_security_group" {
      + arn                    = (known after apply)
      + description            = "Security group for the consul-example-client launch configuration"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "consul-example-client"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "consul-example-client"
        }
      + vpc_id                 = "vpc-bfdc48d9"
    }

  # module.consul.module.consul_clients.aws_security_group_rule.allow_all_outbound will be created
  + resource "aws_security_group_rule" "allow_all_outbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 0
      + id                       = (known after apply)
      + protocol                 = "-1"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 0
      + type                     = "egress"
    }

  # module.consul.module.consul_clients.aws_security_group_rule.allow_ssh_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_ssh_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 22
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 22
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.aws_autoscaling_group.autoscaling_group will be created
  + resource "aws_autoscaling_group" "autoscaling_group" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 3
      + force_delete              = false
      + health_check_grace_period = 300
      + health_check_type         = "EC2"
      + id                        = (known after apply)
      + launch_configuration      = (known after apply)
      + load_balancers            = (known after apply)
      + max_size                  = 3
      + metrics_granularity       = "1Minute"
      + min_size                  = 3
      + name                      = (known after apply)
      + name_prefix               = "consul-example-server"
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + tags                      = [
          + {
              + "key"                 = "Name"
              + "propagate_at_launch" = "true"
              + "value"               = "consul-example-server"
            },
          + {
              + "key"                 = "consul-servers"
              + "propagate_at_launch" = "true"
              + "value"               = "consul-example"
            },
          + {
              + "key"                 = "Environment"
              + "propagate_at_launch" = "true"
              + "value"               = "development"
            },
        ]
      + target_group_arns         = (known after apply)
      + termination_policies      = [
          + "Default",
        ]
      + vpc_zone_identifier       = [
          + "subnet-293b5725",
          + "subnet-3c4c0111",
          + "subnet-632c5738",
          + "subnet-7e43c142",
          + "subnet-db794b92",
          + "subnet-f0bcc295",
        ]
      + wait_for_capacity_timeout = "10m"
    }

  # module.consul.module.consul_servers.aws_iam_instance_profile.instance_profile[0] will be created
  + resource "aws_iam_instance_profile" "instance_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = (known after apply)
      + name_prefix = "consul-example-server"
      + path        = "/"
      + role        = (known after apply)
      + roles       = (known after apply)
      + unique_id   = (known after apply)
    }

  # module.consul.module.consul_servers.aws_iam_role.instance_role[0] will be created
  + resource "aws_iam_role" "instance_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = (known after apply)
      + name_prefix           = "consul-example-server"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # module.consul.module.consul_servers.aws_launch_configuration.launch_configuration will be created
  + resource "aws_launch_configuration" "launch_configuration" {
      + associate_public_ip_address = false
      + ebs_optimized               = false
      + enable_monitoring           = true
      + iam_instance_profile        = (known after apply)
      + id                          = (known after apply)
      + image_id                    = "ami-0a9b5046374af8659"
      + instance_type               = "t2.micro"
      + key_name                    = "orlando2"
      + name                        = (known after apply)
      + name_prefix                 = "consul-example-server-"
      + security_groups             = (known after apply)
      + spot_price                  = "0.0069"
      + user_data                   = "bea44523b6e01d16013cc9699c268cc65005f72f"

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + no_device             = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = true
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + volume_size           = 50
          + volume_type           = "standard"
        }
    }

  # module.consul.module.consul_servers.aws_security_group.lc_security_group will be created
  + resource "aws_security_group" "lc_security_group" {
      + arn                    = (known after apply)
      + description            = "Security group for the consul-example-server launch configuration"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "consul-example-server"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "consul-example-server"
        }
      + vpc_id                 = "vpc-bfdc48d9"
    }

  # module.consul.module.consul_servers.aws_security_group_rule.allow_all_outbound will be created
  + resource "aws_security_group_rule" "allow_all_outbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 0
      + id                       = (known after apply)
      + protocol                 = "-1"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 0
      + type                     = "egress"
    }

  # module.consul.module.consul_servers.aws_security_group_rule.allow_ssh_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_ssh_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 22
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 22
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.aws_autoscaling_group.autoscaling_group will be created
  + resource "aws_autoscaling_group" "autoscaling_group" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 3
      + force_delete              = false
      + health_check_grace_period = 300
      + health_check_type         = "EC2"
      + id                        = (known after apply)
      + launch_configuration      = (known after apply)
      + load_balancers            = (known after apply)
      + max_size                  = 3
      + metrics_granularity       = "1Minute"
      + min_size                  = 3
      + name                      = (known after apply)
      + name_prefix               = "consul-example"
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + tags                      = [
          + {
              + "key"                 = "Name"
              + "propagate_at_launch" = "true"
              + "value"               = "consul-example"
            },
          + {
              + "key"                 = "consul-servers"
              + "propagate_at_launch" = "true"
              + "value"               = "consul-example"
            },
        ]
      + target_group_arns         = (known after apply)
      + termination_policies      = [
          + "Default",
        ]
      + vpc_zone_identifier       = [
          + "subnet-293b5725",
          + "subnet-3c4c0111",
          + "subnet-632c5738",
          + "subnet-7e43c142",
          + "subnet-db794b92",
          + "subnet-f0bcc295",
        ]
      + wait_for_capacity_timeout = "10m"
    }

  # module.vault.module.consul_cluster.aws_iam_instance_profile.instance_profile[0] will be created
  + resource "aws_iam_instance_profile" "instance_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = (known after apply)
      + name_prefix = "consul-example"
      + path        = "/"
      + role        = (known after apply)
      + roles       = (known after apply)
      + unique_id   = (known after apply)
    }

  # module.vault.module.consul_cluster.aws_iam_role.instance_role[0] will be created
  + resource "aws_iam_role" "instance_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = (known after apply)
      + name_prefix           = "consul-example"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # module.vault.module.consul_cluster.aws_launch_configuration.launch_configuration will be created
  + resource "aws_launch_configuration" "launch_configuration" {
      + associate_public_ip_address = false
      + ebs_optimized               = false
      + enable_monitoring           = true
      + iam_instance_profile        = (known after apply)
      + id                          = (known after apply)
      + image_id                    = "ami-05242d11c38cccfc4"
      + instance_type               = "t2.nano"
      + key_name                    = "orlando2"
      + name                        = (known after apply)
      + name_prefix                 = "consul-example-"
      + security_groups             = (known after apply)
      + user_data                   = "469b72bcb233039af79a1e393034a2c490d84096"

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + no_device             = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = true
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + volume_size           = 50
          + volume_type           = "standard"
        }
    }

  # module.vault.module.consul_cluster.aws_security_group.lc_security_group will be created
  + resource "aws_security_group" "lc_security_group" {
      + arn                    = (known after apply)
      + description            = "Security group for the consul-example launch configuration"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "consul-example"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "consul-example"
        }
      + vpc_id                 = "vpc-bfdc48d9"
    }

  # module.vault.module.consul_cluster.aws_security_group_rule.allow_all_outbound will be created
  + resource "aws_security_group_rule" "allow_all_outbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 0
      + id                       = (known after apply)
      + protocol                 = "-1"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 0
      + type                     = "egress"
    }

  # module.vault.module.consul_cluster.aws_security_group_rule.allow_ssh_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_ssh_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 22
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 22
      + type                     = "ingress"
    }

  # module.vault.module.consul_iam_policies_servers.aws_iam_role_policy.auto_discover_cluster[0] will be created
  + resource "aws_iam_role_policy" "auto_discover_cluster" {
      + id     = (known after apply)
      + name   = "auto-discover-cluster"
      + policy = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ec2:DescribeTags",
                          + "ec2:DescribeInstances",
                          + "autoscaling:DescribeAutoScalingGroups",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                      + Sid      = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role   = (known after apply)
    }

  # module.vault.module.security_group_rules.aws_security_group_rule.allow_serf_lan_tcp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_lan_tcp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.vault.module.security_group_rules.aws_security_group_rule.allow_serf_lan_tcp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_lan_tcp_inbound_from_self" {
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.vault.module.security_group_rules.aws_security_group_rule.allow_serf_lan_udp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_lan_udp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.vault.module.security_group_rules.aws_security_group_rule.allow_serf_lan_udp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_lan_udp_inbound_from_self" {
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.vault.module.vault_cluster.aws_autoscaling_group.autoscaling_group will be created
  + resource "aws_autoscaling_group" "autoscaling_group" {
      + arn                       = (known after apply)
      + availability_zones        = (known after apply)
      + default_cooldown          = (known after apply)
      + desired_capacity          = 3
      + force_delete              = false
      + health_check_grace_period = 300
      + health_check_type         = "EC2"
      + id                        = (known after apply)
      + launch_configuration      = (known after apply)
      + load_balancers            = (known after apply)
      + max_size                  = 3
      + metrics_granularity       = "1Minute"
      + min_size                  = 3
      + name                      = (known after apply)
      + name_prefix               = "vault-example"
      + protect_from_scale_in     = false
      + service_linked_role_arn   = (known after apply)
      + target_group_arns         = (known after apply)
      + termination_policies      = [
          + "Default",
        ]
      + vpc_zone_identifier       = [
          + "subnet-293b5725",
          + "subnet-3c4c0111",
          + "subnet-632c5738",
          + "subnet-7e43c142",
          + "subnet-db794b92",
          + "subnet-f0bcc295",
        ]
      + wait_for_capacity_timeout = "10m"

      + tag {
          + key                 = "Name"
          + propagate_at_launch = true
          + value               = "vault-example"
        }
      + tag {
          + key                 = "s3_bucket_id"
          + propagate_at_launch = true
        }
      + tag {
          + key                 = "using_auto_unseal"
          + propagate_at_launch = true
        }
      + tag {
          + key                 = "using_s3_bucket_backend"
          + propagate_at_launch = true
        }
    }

  # module.vault.module.vault_cluster.aws_iam_instance_profile.instance_profile will be created
  + resource "aws_iam_instance_profile" "instance_profile" {
      + arn         = (known after apply)
      + create_date = (known after apply)
      + id          = (known after apply)
      + name        = (known after apply)
      + name_prefix = "vault-example"
      + path        = "/"
      + role        = (known after apply)
      + roles       = (known after apply)
      + unique_id   = (known after apply)
    }

  # module.vault.module.vault_cluster.aws_iam_role.instance_role will be created
  + resource "aws_iam_role" "instance_role" {
      + arn                   = (known after apply)
      + assume_role_policy    = jsonencode(
            {
              + Statement = [
                  + {
                      + Action    = "sts:AssumeRole"
                      + Effect    = "Allow"
                      + Principal = {
                          + Service = "ec2.amazonaws.com"
                        }
                      + Sid       = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + create_date           = (known after apply)
      + force_detach_policies = false
      + id                    = (known after apply)
      + max_session_duration  = 3600
      + name                  = (known after apply)
      + name_prefix           = "vault-example"
      + path                  = "/"
      + unique_id             = (known after apply)
    }

  # module.vault.module.vault_cluster.aws_launch_configuration.launch_configuration will be created
  + resource "aws_launch_configuration" "launch_configuration" {
      + associate_public_ip_address = false
      + ebs_optimized               = false
      + enable_monitoring           = true
      + iam_instance_profile        = (known after apply)
      + id                          = (known after apply)
      + image_id                    = "ami-05242d11c38cccfc4"
      + instance_type               = "t2.micro"
      + key_name                    = "orlando2"
      + name                        = (known after apply)
      + name_prefix                 = "vault-example-"
      + placement_tenancy           = "default"
      + security_groups             = (known after apply)
      + user_data                   = "4f5cba88711e8259eb63785a370b05e61fdaee2e"

      + ebs_block_device {
          + delete_on_termination = (known after apply)
          + device_name           = (known after apply)
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + no_device             = (known after apply)
          + snapshot_id           = (known after apply)
          + volume_size           = (known after apply)
          + volume_type           = (known after apply)
        }

      + root_block_device {
          + delete_on_termination = true
          + encrypted             = (known after apply)
          + iops                  = (known after apply)
          + volume_size           = 50
          + volume_type           = "standard"
        }
    }

  # module.vault.module.vault_cluster.aws_security_group.lc_security_group will be created
  + resource "aws_security_group" "lc_security_group" {
      + arn                    = (known after apply)
      + description            = "Security group for the vault-example launch configuration"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = "vault-example"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "vault-example"
        }
      + vpc_id                 = "vpc-bfdc48d9"
    }

  # module.vault.module.vault_cluster.aws_security_group_rule.allow_all_outbound will be created
  + resource "aws_security_group_rule" "allow_all_outbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 0
      + id                       = (known after apply)
      + protocol                 = "-1"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 0
      + type                     = "egress"
    }

  # module.vault.module.vault_cluster.aws_security_group_rule.allow_ssh_inbound_from_cidr_blocks[0] will be created
  + resource "aws_security_group_rule" "allow_ssh_inbound_from_cidr_blocks" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 22
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 22
      + type                     = "ingress"
    }

  # module.vault.module.vault_elb.aws_autoscaling_attachment.vault will be created
  + resource "aws_autoscaling_attachment" "vault" {
      + autoscaling_group_name = (known after apply)
      + elb                    = (known after apply)
      + id                     = (known after apply)
    }

  # module.vault.module.vault_elb.aws_elb.vault will be created
  + resource "aws_elb" "vault" {
      + arn                         = (known after apply)
      + availability_zones          = (known after apply)
      + connection_draining         = true
      + connection_draining_timeout = 300
      + cross_zone_load_balancing   = true
      + dns_name                    = (known after apply)
      + id                          = (known after apply)
      + idle_timeout                = 60
      + instances                   = (known after apply)
      + internal                    = false
      + name                        = "vault-example"
      + security_groups             = (known after apply)
      + source_security_group       = (known after apply)
      + source_security_group_id    = (known after apply)
      + subnets                     = [
          + "subnet-293b5725",
          + "subnet-3c4c0111",
          + "subnet-632c5738",
          + "subnet-7e43c142",
          + "subnet-db794b92",
          + "subnet-f0bcc295",
        ]
      + tags                        = {
          + "Name" = "vault-example"
        }
      + zone_id                     = (known after apply)

      + health_check {
          + healthy_threshold   = 2
          + interval            = 15
          + target              = "HTTPS:8200/v1/sys/health?standbyok=true"
          + timeout             = 5
          + unhealthy_threshold = 2
        }

      + listener {
          + instance_port     = 8200
          + instance_protocol = "TCP"
          + lb_port           = 443
          + lb_protocol       = "TCP"
        }
    }

  # module.vault.module.vault_elb.aws_security_group.vault will be created
  + resource "aws_security_group" "vault" {
      + arn                    = (known after apply)
      + description            = "Security group for the vault-example ELB"
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = "vault-example-elb"
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + vpc_id                 = "vpc-bfdc48d9"
    }

  # module.vault.module.vault_elb.aws_security_group_rule.allow_all_outbound will be created
  + resource "aws_security_group_rule" "allow_all_outbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 0
      + id                       = (known after apply)
      + protocol                 = "-1"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 0
      + type                     = "egress"
    }

  # module.vault.module.vault_elb.aws_security_group_rule.allow_inbound_api will be created
  + resource "aws_security_group_rule" "allow_inbound_api" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 443
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 443
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.iam_policies.aws_iam_role_policy.auto_discover_cluster[0] will be created
  + resource "aws_iam_role_policy" "auto_discover_cluster" {
      + id     = (known after apply)
      + name   = "auto-discover-cluster"
      + policy = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ec2:DescribeTags",
                          + "ec2:DescribeInstances",
                          + "autoscaling:DescribeAutoScalingGroups",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                      + Sid      = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role   = (known after apply)
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_cli_rpc_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_cli_rpc_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8400
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8400
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_cli_rpc_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_cli_rpc_inbound_from_self" {
      + from_port                = 8400
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8400
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_dns_tcp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_dns_tcp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_dns_tcp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_dns_tcp_inbound_from_self" {
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_dns_udp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_dns_udp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_dns_udp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_dns_udp_inbound_from_self" {
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_http_api_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_http_api_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8500
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8500
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_http_api_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_http_api_inbound_from_self" {
      + from_port                = 8500
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8500
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_serf_wan_tcp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_wan_tcp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_serf_wan_tcp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_wan_tcp_inbound_from_self" {
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_serf_wan_udp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_wan_udp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_serf_wan_udp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_wan_udp_inbound_from_self" {
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_server_rpc_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_server_rpc_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8300
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8300
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.aws_security_group_rule.allow_server_rpc_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_server_rpc_inbound_from_self" {
      + from_port                = 8300
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8300
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.iam_policies.aws_iam_role_policy.auto_discover_cluster[0] will be created
  + resource "aws_iam_role_policy" "auto_discover_cluster" {
      + id     = (known after apply)
      + name   = "auto-discover-cluster"
      + policy = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ec2:DescribeTags",
                          + "ec2:DescribeInstances",
                          + "autoscaling:DescribeAutoScalingGroups",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                      + Sid      = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role   = (known after apply)
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_cli_rpc_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_cli_rpc_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8400
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8400
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_cli_rpc_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_cli_rpc_inbound_from_self" {
      + from_port                = 8400
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8400
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_dns_tcp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_dns_tcp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_dns_tcp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_dns_tcp_inbound_from_self" {
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_dns_udp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_dns_udp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_dns_udp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_dns_udp_inbound_from_self" {
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_http_api_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_http_api_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8500
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8500
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_http_api_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_http_api_inbound_from_self" {
      + from_port                = 8500
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8500
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_serf_wan_tcp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_wan_tcp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_serf_wan_tcp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_wan_tcp_inbound_from_self" {
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_serf_wan_udp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_wan_udp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_serf_wan_udp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_wan_udp_inbound_from_self" {
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_server_rpc_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_server_rpc_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8300
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8300
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.aws_security_group_rule.allow_server_rpc_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_server_rpc_inbound_from_self" {
      + from_port                = 8300
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8300
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.iam_policies.aws_iam_role_policy.auto_discover_cluster[0] will be created
  + resource "aws_iam_role_policy" "auto_discover_cluster" {
      + id     = (known after apply)
      + name   = "auto-discover-cluster"
      + policy = jsonencode(
            {
              + Statement = [
                  + {
                      + Action   = [
                          + "ec2:DescribeTags",
                          + "ec2:DescribeInstances",
                          + "autoscaling:DescribeAutoScalingGroups",
                        ]
                      + Effect   = "Allow"
                      + Resource = "*"
                      + Sid      = ""
                    },
                ]
              + Version   = "2012-10-17"
            }
        )
      + role   = (known after apply)
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_cli_rpc_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_cli_rpc_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8400
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8400
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_cli_rpc_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_cli_rpc_inbound_from_self" {
      + from_port                = 8400
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8400
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_dns_tcp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_dns_tcp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_dns_tcp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_dns_tcp_inbound_from_self" {
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_dns_udp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_dns_udp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_dns_udp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_dns_udp_inbound_from_self" {
      + from_port                = 8600
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8600
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_http_api_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_http_api_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8500
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8500
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_http_api_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_http_api_inbound_from_self" {
      + from_port                = 8500
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8500
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_serf_wan_tcp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_wan_tcp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_serf_wan_tcp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_wan_tcp_inbound_from_self" {
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_serf_wan_udp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_wan_udp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_serf_wan_udp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_wan_udp_inbound_from_self" {
      + from_port                = 8302
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8302
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_server_rpc_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_server_rpc_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8300
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8300
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.aws_security_group_rule.allow_server_rpc_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_server_rpc_inbound_from_self" {
      + from_port                = 8300
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8300
      + type                     = "ingress"
    }

  # module.vault.module.vault_cluster.module.security_group_rules.aws_security_group_rule.allow_api_inbound_from_cidr_blocks[0] will be created
  + resource "aws_security_group_rule" "allow_api_inbound_from_cidr_blocks" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8200
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8200
      + type                     = "ingress"
    }

  # module.vault.module.vault_cluster.module.security_group_rules.aws_security_group_rule.allow_cluster_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_cluster_inbound_from_self" {
      + from_port                = 8201
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8201
      + type                     = "ingress"
    }

  # module.vault.module.vault_cluster.module.security_group_rules.aws_security_group_rule.allow_cluster_inbound_from_self_api will be created
  + resource "aws_security_group_rule" "allow_cluster_inbound_from_self_api" {
      + from_port                = 8200
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8200
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_tcp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_lan_tcp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_tcp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_lan_tcp_inbound_from_self" {
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_udp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_lan_udp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.consul.module.consul_clients.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_udp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_lan_udp_inbound_from_self" {
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_tcp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_lan_tcp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_tcp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_lan_tcp_inbound_from_self" {
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_udp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_lan_udp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.consul.module.consul_servers.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_udp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_lan_udp_inbound_from_self" {
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_tcp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_lan_tcp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_tcp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_lan_tcp_inbound_from_self" {
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "tcp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_udp_inbound[0] will be created
  + resource "aws_security_group_rule" "allow_serf_lan_udp_inbound" {
      + cidr_blocks              = [
          + "0.0.0.0/0",
        ]
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = false
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

  # module.vault.module.consul_cluster.module.security_group_rules.module.client_security_group_rules.aws_security_group_rule.allow_serf_lan_udp_inbound_from_self will be created
  + resource "aws_security_group_rule" "allow_serf_lan_udp_inbound_from_self" {
      + from_port                = 8301
      + id                       = (known after apply)
      + protocol                 = "udp"
      + security_group_id        = (known after apply)
      + self                     = true
      + source_security_group_id = (known after apply)
      + to_port                  = 8301
      + type                     = "ingress"
    }

Plan: 98 to add, 0 to change, 0 to destroy.

------------------------------------------------------------------------

Note: You didn't specify an "-out" parameter to save this plan, so Terraform
can't guarantee that exactly these actions will be performed if
"terraform apply" is subsequently run.
```

- now you can run terraform apply
  
```bash
terraform apply
...

Apply complete! Resources: 98 added, 0 changed, 0 destroyed.
```
  