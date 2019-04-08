
resource "aws_security_group" "stephen" {
 name = "stephen"
 vpc_id = "${aws_vpc.main.id}"

 # SSH access
 ingress {
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["${var.allinternetCIDRblock}"]
   }
   egress {
   from_port       = 0
   to_port         = 0
   protocol        = "-1"
   cidr_blocks     = ["${var.allinternetCIDRblock}"]
   }
   # Jenkins access
 ingress {
   from_port   = 8080
   to_port     = 8080
   protocol    = "tcp"
   cidr_blocks = ["${var.allinternetCIDRblock}"]
   }
    # HTTPD access
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.allinternetCIDRblock}"]
    }
}
