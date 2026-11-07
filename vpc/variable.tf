variable "Public_subnet" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "Private_subnet" {
  default = ["10.0.12.0/24", "10.0.24.0/24"]
}

variable "database_subnet" {
  default = ["10.0.21.0/24", "10.0.22.0/24"]
}

variable "project" {
  default = "roboshop"
}

variable "environement" {
  default = "dev"
}


