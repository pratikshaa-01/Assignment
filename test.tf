resource "aws_instance" "web_app" {
  ami           = "ami-005fc0f236362e99f"
  instance_type = "t2.micro"
  key_name      = "deployer-key"

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y docker.io git
    systemctl start docker
    systemctl enable docker


    cd /home/ubuntu
    git clone https://github.com/pratikshaa-01/Assignment


    cd /home/ubuntu/Assignment


    docker build -t my-web-app .


    docker run -d -p 80:3000 my-web-app
  EOF

  tags = {
    Name = "web-app-instance"
  }

  # Attach a security group to allow HTTP traffic
  vpc_security_group_ids = [aws_security_group.web_app_sg.id]
}

resource "aws_security_group" "web_app_sg" {
  name_prefix = "web-app-sg-"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "mention your pub key"
}




