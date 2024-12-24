terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

locals {
  instances = toset(["Devendra", "Braj", "Abrar", "Nimo"]) # Set of instance names
}

resource "aws_instance" "aws_ec2_test" {
  for_each      = local.instances
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"

  tags = {
    Name = each.key # Use the instance name from the local.instances set
  }
}

output "ec2_instance_names" {
  value = [for instance in aws_instance.aws_ec2_test : instance.tags.Name]
}

output "ec2_instance_ids" {
  value = [for instance in aws_instance.aws_ec2_test : instance.id]
}
