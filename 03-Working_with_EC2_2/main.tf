# Configure the AWS provider
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
  profile = "terraform"
}


# Create a Security Group for an EC2 instance
resource "aws_security_group" "instance" {
  name = "terraform-ec2-instance-sg"
  
  ingress {
    from_port	  = 80
    to_port	      = 80
    protocol	  = "tcp"
    cidr_blocks	= ["0.0.0.0/0"]
  }
  ingress {
    from_port	  = 22
    to_port	      = 22
    protocol	  = "tcp"
    cidr_blocks	= ["0.0.0.0/0"]
  }
  ingress {
    from_port	  = 8080
    to_port	      = 8080
    protocol	  = "tcp"
    cidr_blocks	= ["0.0.0.0/0"]
  }
  egress {
    from_port	  = 0
    to_port	      = 0
    protocol	  = "-1"
    cidr_blocks	= ["0.0.0.0/0"]
  }

}

# Create an EC2 instance
resource "aws_instance" "myinstance" {
  ami           = "ami-0861f4e788f5069dd"
  instance_type = "t3.micro"
  vpc_security_group_ids  = ["${aws_security_group.instance.id}"]
  key_name = "ashwini"
  user_data = "${file("install_apache.sh")}"	  
  tags = {
    Name = "myec2"
  }
}

# Output variable: Public IP address
output "public_ip" {
  value = "${aws_instance.myinstance.public_ip}"
}