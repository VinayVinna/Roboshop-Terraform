resource "aws_instance" "frontend" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-01f6d27b7cf60481b"]

  tags = {
    Name = "frontend"
  }
}