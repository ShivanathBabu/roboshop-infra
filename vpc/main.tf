module "vpc" {
  source = "git::https://github.com/ShivanathBabu/roboshop-vpc.git"
  project = var.project
  environment = var.environement
  Public_subnet = var.public_subnet
  Private_subnet = var.private_subnet
  database_subnet = var.database_subnet

}