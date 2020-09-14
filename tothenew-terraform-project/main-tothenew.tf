##    Terraform v0.11.13
# Provide's details and Configured AWS Profile with Mumbai Region .
provider "aws" {
	region = "${var.aws_region}"
	profile = "tothenew"
}


