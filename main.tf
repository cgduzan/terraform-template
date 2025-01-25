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

# data blocks allow us to query AWS for information about a resource that is
# not managed by Terraform (e.g. an AMI we created with Packer 😉)
data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

# Use resource blocks to define components of your infrastructure.
resource "aws_instance" "app_server" {
  # we can specify a specific AMI id here
  # but, more commonly, we'll use a "data" block to find the latest version of a given image
  # ami           = "ami-08d70e59c07c61a3a"
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    # variables can be loaded from a `variables` section in a config file
    # or from the command line using `-var "instance_name=YetAnotherName"`
    Name = var.instance_name
  }
}
