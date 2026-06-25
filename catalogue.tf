resource "aws_instance" "catalogue" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.small"
  vpc_security_group_ids = ["sg-01f6d27b7cf60481b"]

  tags = {
    Name = "catalogue"
  }

  # provisioner "remote-exec" {
  #
  #   connection {
  #     type = "ssh"
  #     user = "ec2-user"
  #     password = "DevOps321"
  #     host = self.public_ip
  #   }
  #
  #   inline = [
  #     "sudo pip3.11 install ansible",
  #     "ansible-pull -i localhost, -u https://github.com/VinayVinna/Roboshop-ansible.git Roboshop.yml -e component_name=catalogue -e env=dev",
  #
  #   ]
  # }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z0318615248O13Q4XTXJ0"
  name    = "catalogue-dev"
  type    = "A"
  ttl     = 10
  records = [aws_instance.catalogue.private_ip ]
}

resource "null_resource" "catalogue" {
  provisioner "remote-exec" {

    connection {
      type = "ssh"
      user = "ec2-user"
      password = "DevOps321"
      host = aws_instance.catalogue.private_ip
    }

    inline = [
      "sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -u https://github.com/VinayVinna/Roboshop-ansible.git Roboshop.yml -e component_name=catalogue -e env=dev",

    ]
  }
}
