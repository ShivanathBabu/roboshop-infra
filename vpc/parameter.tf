resource "aws_ssm_parameter" "vpc" {
  name = "${var.project}-${var.environment}-vpc"
  type = "String"
  value = module.vpc.vpc_id
}

resource "aws_ssm_parameter" "public_subnet" {
  name = "${var.project}-${var.environment}-public-subnet"
  type = "StringList"
  value = join(",", module.vpc.aws_public_subnet_id)
}

resource "aws_ssm_parameter" "private_subnet" {
  name = "${var.project}-${var.environment}-private-subnet"
  type = "StringList"
  value = join(",", module.vpc.aws_private_subnet_id)
}

resource "aws_ssm_parameter" "database_subnet" {
  name = "${var.project}-${var.environment}-database-subnet"
  type = "StringList"
  value = join(",", module.vpc.aws_database_subnet_id)
}