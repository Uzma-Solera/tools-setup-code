terraform {
  backend "s3" {
    bucket = "terraform-uzma83"
    key    = "vault.secrets/state"
    region = "us-east-1"

  }
}
provider "vault" {
  address = "http://vault-internal.uzma83.shop:8200"
  token   = var.vault_token
}
variable "vault_token" {}

resource "vault_mount" "ssh" {
  path        = "infra"
  type        = "kv"
  options = { version = "2"}
  description = "infra secrets"
}
resource "vault_generic_secret" "example" {
  path = "${vault_mount.ssh.path}/ssh"

  data_json = <<EOT
{
  "username":   "ec2-user",
  "password": "DevOps321"
}
EOT
}