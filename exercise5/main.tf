provider "aws" {
  region = "us-east-1"
}

module "docker_instance" {
    source = "AydinTokuslu/docker-instance/aws"
    key_name = "mykey"
}



output "public_ip" {
  value = module.docker_instance.instance_public_ip
}