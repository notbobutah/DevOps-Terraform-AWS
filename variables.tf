variable "region" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "vpc_cidr" {
  type = string
}

variable "subnets_cidr" {
  type = list
}


variable "namespace" {
  type = string
}

variable "name" {
  type = string
}

variable "key_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "stage" {
  type = string
}
