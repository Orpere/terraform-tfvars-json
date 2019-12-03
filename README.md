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

- apply terraform
  
```bash
terraform apply
```

- it should show the below

```bash
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

test_result = hello world
```
