resource "aws_instance" "frontend" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-01f6d27b7cf60481b"]

  tags = {
    Name = "frontend"
  }

  provisioner "remote-exec" {

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = self.public_ip
    }

    inline = [
      "sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -u https://github.com/VinayVinna/Roboshop-shell.git Roboshop.yml -e component_name=frontend -e env=dev"

    ]
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z0318615248O13Q4XTXJ0"
  name    = "frontend-dev"
  type    = "A"
  ttl     = 10
  records = [aws_instance.frontend.private_ip ]
}