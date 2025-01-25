# Terraform - AWS Template
This is a [Terraform (Hashicorp)](https://developer.hashicorp.com/terraform) template to use for quick reference. It creates an EC2 instance in AWS (us-west-2).

The `*.tf` files were built following [Terraform's AWS tutorial](https://developer.hashicorp.com/terraform/tutorials/aws-get-started). I've added comments in the file to describe the different components of Terraform and how they're utilized.

# Running Terraform
‼️ Note: running this provisions an EC2 instance which could cost money. I suggest creating/utilizing an AWS free-tier account to minimize any costs.

## Prerequisites
- [Install Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [Instal AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) (assuming you already have an AWS account)

## Run it!
Clone the repo & navigate to the directory:
```
git clone https://github.com/cgduzan/terraform-template.git && \
cd terraform-template
```
Validate the config files: (it should already be good, but just so you know the command)
```
terraform validate
```
Install required plugins:
```
terraform init
```
Apply changes (ie. provision EC2 instance):
```
terraform apply
```
(type "yes" and hit Enter when prompted)

Once completed, you should have 1 new EC2 instance running in the `us-west-2` region (assuming you haven't changed the config).

## Terraform commands reference

| Command | Description |
| --- | --- |
| `terraform init` | Initialize the Terraform configuration by installing any required plugins |
| `terraform fmt` | Format the Terraform configuration files |
| `terraform validate` | Validate the Terraform configuration files |
| `terraform plan` | Show changes required by the current configuration |
| `terraform apply` | Create or update infrastructure |
| `terraform destroy` | Destroy previously-created infrastructure |
| `terraform state list` | List tracked resources in the current state file |
