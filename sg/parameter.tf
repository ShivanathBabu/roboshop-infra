resource "aws_ssm_parameter" "bastion" {
  name = "${var.project}-${var.environment}-bastion"
  type = "String"
  value = module.bastion.sg_id
}