
# Create the EC2 Instance
data "aws_ami" "amz-jenkins-slave" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
    }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
    }

   owners = ["amazon"] # AMAZON
}

resource "aws_key_pair" "my-slave-key" {
 key_name   = "my-slave-key"
 public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "jenkins-slave" {

  key_name = "${aws_key_pair.my-slave-key.key_name}"
  ami = "${data.aws_ami.amz-jenkins-slave.id}"
  subnet_id = "${aws_subnet.stephen-subnetpublic.id}"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.stephen.id}"]

  user_data = <<-EOF
              #!/bin/bash
              yum remove java* -y
              yum install java-1.8.0-openjdk -y
              #wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
              #rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
              #yum install jenkins -y
              #/etc/init.d/jenkins start
              EOF
   tags {
     Name = "${var.nameslaveTAGS}"
     }
}
