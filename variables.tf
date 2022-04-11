variable "targets" {
  default = "https://e-kontur.ru https://install.kontur.ru https://kontur.ru https://zakupki.kontur.ru "
  type    = string
}
variable "workdir" {
  default = "piZddos"
  type    = string
}

variable "ssh_key" {
  default = "ec2-default"
  type    = string
}
variable "ami" {
  default = "ami-0d527b8c289b4af7f"
  type    = string
}

variable "region" {
  default = "eu-central-1"
  type    = string
}
