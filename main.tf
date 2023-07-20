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

/*resource "aws_instance" "my_ec2"{
	ami="ami-0f5ee92e2d63afc18"
	instance_type="t2.micro"
}*/

resource "aws_s3_bucket" "my_s3"{
	# checkov:skip=CKV_AWS_145:Ensure that S3 buckets are encrypted with KMS by default
	# checkov:skip=CKV2_AWS_61:Ensure that an S3 bucket has a lifecycle configuration
	# checkov:skip=CKV2_AWS_62:Ensure S3 buckets should have event notifications enabled
	# checkov:skip=CKV_AWS_144:Ensure that S3 bucket has cross-region replication enabled
	# checkov:skip=CKV_AWS_21:Ensure all data stored in the S3 bucket have versioning enabled
	# checkov:skip=CKV_AWS_18:Ensure the S3 bucket has access logging enabled
	bucket="tfdemobucketnull2023"
	block_public_acls   = true
	block_public_policy = true
}
