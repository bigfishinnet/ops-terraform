# Create the vpc
resource "aws_vpc" "main" {
	cidr_block = "${var.cidr_block}"

	tags = {
		Name = "stephen"
		}
} # end resource
