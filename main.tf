terraform {
  required_version = ">= 0.12" # colocando compatibilidade do terraform para 0.12
}

resource "aws_instance" "web" {
  subnet_id                   = "subnet-0ed82a1bd06d01c40"
  ami                         = "ami-0279c3b3186e54acd"
  instance_type               = var.tipo
  key_name                    = "public_key_simone_bastion_virginia_tf"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["sg-0d64ad87b05bfd46e"]
  root_block_device {
    encrypted   = true
    volume_size = 8
  }
  tags = {
    Name = "${var.nome}",
    Itau = true
  }
}

