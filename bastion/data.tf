data "aws_ssm_parameter" "bastion_sg" {
  name = "${var.project}-${var.environment}-bastion"
}

data "aws_ssm_parameter" "vpc" {
  name = "${var.project}-${var.environment}-vpc"
}

data "aws_ssm_parameter" "public_subnet" {
  name = "${var.project}-${var.environment}-public-subnet"
}



data "aws_ami" "joindevops" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}