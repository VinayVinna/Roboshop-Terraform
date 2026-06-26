variable "ami_id" {
  default = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  default = "t3.small"
}

variable "vpc_security_group_ids" {
  default = ["sg-01f6d27b7cf60481b"]
}

variable "instances" {
  default = ["catalogue", "frontend", "mongodb"]
}

variable "zone_id" {
  default = "Z0318615248O13Q4XTXJ0"
}

variable "env" {
  default = "dev"
}