provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "goldy" {
  ami           = "ami-04a81a99f5ec58529"  # Replace with a valid Ubuntu AMI ID for your region
  instance_type = "t2.micro"

  # User data script to install Apache on Ubuntu
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              EOF

  tags = { Name = "goldy" }
}

output "instance_id" {
  value = aws_instance.goldy.id
}

output "instance_public_ip" {
  value = aws_instance.goldy.public_ip
}
