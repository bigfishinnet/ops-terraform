
# Create the EC2 Instance

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical

}

resource "aws_key_pair" "my-key" {
 key_name   = "my-key"
 public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_security_group" "stephen" {
 name = "stephen"
 vpc_id = "${aws_vpc.main.id}"
 
 # SSH access
 ingress {
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
   egress {
   from_port       = 0
   to_port         = 0
   protocol        = "-1"
   cidr_blocks     = ["0.0.0.0/0"]
   }
   # HTTP access
 ingress {
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 }
resource "aws_instance" "web" {
 
  key_name          = "${aws_key_pair.my-key.key_name}"
  ami           = "${data.aws_ami.ubuntu.id}"
  subnet_id = "${aws_subnet.stephen-subnetpublic.id}"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.stephen.id}"]
  #vpc_security_group_ids = ["${aws_security_group.tf-{{ instance['instance'] }}.id}",


  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get upgrade -y
              apt-get install apache2 -y
              EOF
   tags {
     Name = "stephen-apache-ec2"
     }
}