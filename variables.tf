variable "targets" {
  default     = "https://sbis.ru/ https://webmail.sbis.ru/ https://taxcom.ru/ https://ofd.ru/ https://lk.ofd.ru/ "
  type        = string
  description = "List of targets to attack."
}
variable "workdir" {
  default = "piZddos"
  type    = string
}

variable "ssh_key" {
  sensitive   = true
  type        = string
  description = "SSH public key content"
}
variable "ami" {
  default     = "ami-0d527b8c289b4af7f"
  type        = string
  description = "AMI to launch instance from"
}

variable "region" {
  default = "eu-central-1"
  type    = string
}


variable "instance_count" {
  default     = 3
  description = "The number of attacking instances to be launched."
}

variable "price" {
  default     = "0.0017"
  type        = string
  description = "Price bid for AWS EC2 spot instance."
}
