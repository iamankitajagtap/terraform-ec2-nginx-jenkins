resource "aws_instance" "var-tf-server" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.tf-key.key_name #interpolation
  vpc_security_group_ids = [aws_security_group.tf-server-sg.id]

  root_block_device {
    volume_size           = 10
    volume_type           = "gp2"
    delete_on_termination = true
  }

  user_data = file("install_nginx.sh")

  user_data_replace_on_change = true
  tags = {
    Name = "Web-server"
    ENV  = "Prod"
  }

}

resource "aws_key_pair" "tf-key" {
  key_name   = "tf-server-key"
  public_key = file("tf-server-key.pub")
}

resource "aws_security_group" "tf-server-sg" {
  name        = "tf-server-sg"
  description = "Security group for web server"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

