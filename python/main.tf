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

resource "aws_instance" "my_ec2_instance" {
  count          = 5
  ami            = "ami-08c40ec9ead489470"
  instance_type  = "t2.micro"

  tags = {
    Name = "TerraformBatch-Instance-${count.index + 1}" # Unique name for each instance
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "trainwithshubham-tf-test-bucket"

  tags = {
    Name        = "trainwithshubham-bucket"
    Environment = "Dev"
  }
}

output "ec2_public_ips" {
  value = [for instance in aws_instance.my_ec2_instance : instance.public_ip]
}
