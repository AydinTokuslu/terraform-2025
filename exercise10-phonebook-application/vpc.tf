
data "aws_vpc" "default" {
  default = true
}

# Get all default subnets for the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}


# resource "aws_default_vpc" "default" {
#   tags = {
#     Name = "Default VPC"
#   }
# }

# resource "aws_default_subnet" "default_az1" {
#   availability_zone = "us-east-1"
#   #public_subnets   = ["10.0.101.0/24", "10.0.102.0/24"]
#   #subnets_ids = [ var.db-subnet-a-us-east-1a-id, var.db-subnet-b-us-east-1a-id ]
#   tags = {
#     Name = "Default subnet for us-east-1"
#   }
# }

# resource "aws_db_subnet_group" "default" {
#   name       = "main"
#   subnet_ids = [ 
#     var.db_subnet_a_us_east_1a_id, 
#     var.db_subnet_b_us_east_1b_id  # Assuming it's in a different AZ
#   ]

#   tags = {
#     Name = "MainDBSubnetGroup"
#   }
# }

resource "aws_db_subnet_group" "default" {
  name       = "default-db-subnet-group"
  #subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]
  subnet_ids = data.aws_subnets.default.ids

  tags = {
    Name = "My DB subnet group"
  }
}

# resource "aws_subnet" "main" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.1.0/24"

#   tags = {
#     Name = "Main"
#   }
# }
# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }