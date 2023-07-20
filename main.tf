# To provision EC2 instance
terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.9.0"
    }
  }
}

variable "accesskey" {
  type = string
}

variable "secretkey" {
  type = string
}

provider "aws" {
	access_key=var.accesskey
	secret_key=var.secretkey
	region="ap-south-1"
}

resource "aws_instance" "my_ec2"{
	ami="ami-0f5ee92e2d63afc18"
	instance_type="t2.micro"
}
