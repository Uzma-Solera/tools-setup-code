terraform {
  backend "s3" {
    bucket = "terraform-uzma83"
    key    = "tools/state"
    region = "us-east-1"
  }
}

module "tool-infra" {
  source = "./modules-infra"
  for_each = var.tools

  ami_id  = var.ami_id
  zone_id = var.zone_id
  name    = each.key
  port    = each.value["port"]
  instance_type = each.value["instance_type"]
  root_block_device = each.value["root_block_device"]
  iam_policy = each.value["iam_policy"]



}