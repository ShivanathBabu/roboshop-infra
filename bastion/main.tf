resource "aws_instace" "bastion" {
  ami = local.ami
  instance_type = var.instance_type
  vpc_security_group_ids = [local.sg]
  subnet_id = local.subnet

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }
  user_data = file("bastion.sh")

   tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-eip"
    }
  )

}