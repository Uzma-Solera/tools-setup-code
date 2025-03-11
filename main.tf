terraform {
  backend "s3" {
    bucket         = "terraform-uzma83"
    key            = "tools/state"
    region         = "us-east-1"
  }
}
variable "ami_id" {
  default = ami-09c813fb71547fc4f
}
variable "zone_id" {
  default = "Z01537493BA6YJ34JEG5T"
}

variable "tools" {
  default = {

    vault = {
      instance_type = "t2.small"
      port          = 8200
    }
  }
}

module "modules.infra" {
  source = "./modules.infra"
  for_each = var.tools

  ami_id  = var.ami_id
  zone_id = var.zone_id
  name    = each.key
  port    = each.value["port"]
  instance_type = each.value["instance_type"]



}