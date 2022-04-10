variable "targets" {
  default = "https://cm.1tv.ru/  https://www.1tv.ru/live https://subscr.1tv.ru/ "
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
