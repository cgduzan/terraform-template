# Terraform loads all files in the current directory ending in .tf, so you can name your configuration files however you choose.

# main.tf is a best practice as the main configuration file for your Terraform project

# tell Terraform which plugins to install (in this case, the AWS provider)
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# The provider block configures the specified provider.
# A provider is a plugin that Terraform uses to create and manage your resources.
provider "aws" {
  region = "us-west-2"
}

# Use resource blocks to define components of your infrastructure.
resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    # variables can be loaded from a `variables` section in a config file
    # or from the command line using `-var "instance_name=YetAnotherName"`
    Name = var.instance_name
  }
}
