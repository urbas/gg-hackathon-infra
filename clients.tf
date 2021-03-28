resource "aws_instance" "client" {
  count                       = 1
  ami                         = "ami-0d712b3e6e1f798ef" # amazon linux 2
  instance_type               = "t3a.small"
  key_name                    = aws_key_pair.deploy.id
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = local.main_subnet.id

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "client"
  }
}

resource "null_resource" "provision-clients" {
  count = length(aws_instance.client)

  triggers = {
    hash = uuid()
  }

  provisioner "remote-exec" {
    script = "client-setup.sh"

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("ssh_key")
      host        = aws_instance.client[count.index].public_ip
    }
  }
}
