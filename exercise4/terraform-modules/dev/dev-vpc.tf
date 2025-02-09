module "tf-vpc" {
  source = "../modules"
  environment = "DEV"
}

output "vpc_cidr-block" {
  value = module.tf-vpc.vpc_cidr
}