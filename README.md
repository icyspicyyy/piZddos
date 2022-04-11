# piZddos

piZddos is a terraform wrapper for https://github.com/porthole-ascend-cinnamon/mhddos_proxy.git that makes use of AWS Spot instances.


## Installation

Simply clone this repo for installation

```bash
git clone https://github.com/icyspicyyy/piZddos.git
```

## Usage

Firs you must set up  [AWS CLI ](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html) and [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli).
After everything is set up you can put params to `variables.tf` file or run from cli
```bash
terraform plan -var "count=3" -var "ami=test" -var "ssh_key=path/to/your/key-var " -var "region=us-central-1" -var "targets=http://site1.ru http://site2.ru"
terraform apply

```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

Slava Ukraine! Glory to Ukraine!
Русский военный корабль, иди нахуй!
