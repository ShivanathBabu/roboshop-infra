locals {
  common_tags = {
    project = var.project
    environment = var.environment
  }

  vpc = data.aws_ssm_parameter.vpc.value
}