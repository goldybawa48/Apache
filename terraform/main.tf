provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "goldy" {
  ami             = "ami-04a81a99f5ec58529"
  instance_type   = "t2.micro"
  key_name        = "goldy"
  security_groups = ["default"]
  user_data       = file("${path.module}/userdata.sh")

  tags = {
    Name = "terraform"
  }
}

output "instance_id" {
  value = aws_instance.goldy.id
}

output "instance_public_ip" {
  value = aws_instance.goldy.public_ip
}
