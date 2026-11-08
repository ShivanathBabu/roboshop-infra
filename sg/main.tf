module "frontend" {
  source = "git::https://github.com/ShivanathBabu/roboshop-sg.git"
  sg_name = "frontend-allow"
  sg_description = "allow-all"
  project = var.project
  environment = var.environment
  vpc_id = local.vpc
}

module "catalogue" {
  source = "git::https://github.com/ShivanathBabu/roboshop-sg.git"
  sg_name = "catalogue-allow"
  sg_description = "catalogue-allow-all"
  project = var.project
  environment = var.environment
  vpc_id = local.vpc
}

module "user" {
  source = "git::https://github.com/ShivanathBabu/roboshop-sg.git"
  sg_name = "user-allow"
  sg_description = "user-allow-all"
  project = var.project
  environment = var.environment
  vpc_id = local.vpc
}

module "cart" {
  source = "git::https://github.com/ShivanathBabu/roboshop-sg.git"
  sg_name = "cart-allow"
  sg_description = "cart-allow-all"
  project = var.project
  environment = var.environment
  vpc_id = local.vpc
}

module "shipping" {
  source = "git::https://github.com/ShivanathBabu/roboshop-sg.git"
  sg_name = "shipping-allow"
  sg_description = "shipping-allow-all"
  project = var.project
  environment = var.environment
  vpc_id = local.vpc
}

module "payment" {
  source = "git::https://github.com/ShivanathBabu/roboshop-sg.git"
  sg_name = "payment-allow"
  sg_description = "payment-allow-all"
  project = var.project
  environment = var.environment
  vpc_id = local.vpc
}

module "bastion" {
  source = "git::https://github.com/ShivanathBabu/roboshop-sg.git"
  sg_name = "bastion-allow"
  sg_description = "bastion-allow-all"
  project = var.project
  environment = var.environment
  vpc_id = local.vpc
}


module "vpn" {
  source = "git::https://github.com/ShivanathBabu/roboshop-sg.git"
  sg_name = "vpn-allow"
  sg_description = "vpn-allow-all"
  project = var.project
  environment = var.environment
  vpc_id = local.vpc
}


module "frontend_alb" {
  source = "git::https://github.com/ShivanathBabu/roboshop-sg.git"
  sg_name = "frontend_alb-allow"
  sg_description = "frontend-alb-allow-all"
  project = var.project
  environment = var.environment
  vpc_id = local.vpc
}

module "backend_alb" {
  source = "git::https://github.com/ShivanathBabu/roboshop-sg.git"
  sg_name = "backend_alb-allow"
  sg_description = "backend-alb-allow-all"
  project = var.project
  environment = var.environment
  vpc_id = local.vpc
}





resource "aws_security_group_rule" "frontend_fronted_alb" {
  type = "ingress"
  from_port = "443"
  to_port = "443"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.frontend_alb.sg_id
}

resource "aws_security_group_rule" "frontend_backend_alb" {
  type = "ingress"
  from_port = "80"
  to_port = "80"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.backend_alb.sg_id
}

resource "aws_security_group_rule" "bastion_ssh" {
  type = "ingress"
  from_port = "22"
  to_port = "22"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.bastion.sg_id
}

resource "aws_security_group_rule" "vpn_ssh" {
  type = "ingress"
  from_port = "22"
  to_port = "22"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_1194" {
  type = "ingress"
  from_port = "1194"
  to_port = "1194"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}

resource "aws_security_group_rule" "vpn_943" {
  type = "ingress"
  from_port = "943"
  to_port = "943"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = module.vpn.sg_id
}



