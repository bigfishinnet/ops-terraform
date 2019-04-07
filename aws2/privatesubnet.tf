# create the Private Subnet
resource "aws_subnet" "stephen-subnetprivate" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.subnetprivateCIDRblock}"

tags = {
   Name = "stephen-subnetprivate"
  }
} # end resource

# Create the Private Route Table
resource "aws_route_table" "stephen_private_route_table" {
    vpc_id = "${aws_vpc.main.id}"

tags {
        Name = "${var.nameTAGS}"
    }
} # end resource


# Associate the Private Route Table with the Private Subnet
resource "aws_route_table_association" "stephen_Private_VPC_association" {
    subnet_id      = "${aws_subnet.stephen-subnetprivate.id}"
    route_table_id = "${aws_route_table.stephen_private_route_table.id}"
} # end resource
