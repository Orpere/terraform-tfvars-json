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

- run terraform plan and you should see the line on the end 
  
```bash
Plan: 98 to add, 0 to change, 0 to destroy.
```

- now you can run terraform apply
  