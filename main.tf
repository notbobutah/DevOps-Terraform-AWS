
provider "aws" {
  region = var.region
}

module "vpc" {
  source     = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=master"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.vpc_name
  cidr_block = "${var.vpc_cidr}"
}

module "subnets" {
  source               = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/0.15.0"
  availability_zones   = var.availability_zones
  namespace            = var.namespace
  stage                = var.stage
  name                 = var.subnet_name
  vpc_id               = module.vpc.vpc_id
  igw_id               = module.vpc.igw_id
  cidr_block           = module.vpc.vpc_cidr_block
  nat_gateway_enabled  = false
  nat_instance_enabled = false
}
data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [module.vpc.vpc_id]
  }
}
# data "aws_route_table" "selected" {
#   subnet_id = "${var.subnet_id}"
# }

# resource "aws_route" "route" {
#   route_table_id            = "${data.aws_route_table.selected.id}"
#   destination_cidr_block    = "10.0.1.0/22"
#   vpc_peering_connection_id = "pcx-45ff3dc1"
# }

data "aws_subnet_ids" "subnets" {
  vpc_id = module.vpc.vpc_id
}

# data "aws_subnet" "subnets" {
#   for_each = data.aws_subnet_ids.subnets.ids
#   id       = each.value
# }

