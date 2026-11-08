locals {
  common_tags = {
    project = var.project
    environment = var.environment
  }

  vpc = data.aws_ssm_parameter.vpc.value
  sg = data.aws_ssm_parameter.bastion_sg
  ami = data.aws_ami.joindevops.id
  subnet = split(",", data.aws_ssm_parameter.public_subnet.value)[0]
}