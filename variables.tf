variable "vpc_security_group_ids" {
  default = ["sg-01f6d27b7cf60481b"]
}

variable "instances" {
  default = {
    mongodb = {
      ami_id = "ami-0220d79f3f480ecf5"
      instance-type = "t3.small"
    }

    catalogue = {
      ami_id = "ami-0220d79f3f480ecf5"
      instance-type = "t3.small"
    }

    frontend = {
      ami_id = "ami-0220d79f3f480ecf5"
      instance-type = "t3.small"
    }
  }
}

variable "zone_id" {
  default = "Z0318615248O13Q4XTXJ0"
}

variable "env" {
  default = "dev"
}