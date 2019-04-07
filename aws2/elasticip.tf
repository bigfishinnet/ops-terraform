resource "aws_eip" "jenkins-master-eip" {
  instance = "${aws_instance.jenkins-master.id}"
  vpc      = true
}
