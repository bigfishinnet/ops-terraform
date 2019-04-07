# create the Public Subnet
resource "aws_subnet" "stephen-subnetpublic" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.subnetpublicCIDRblock}"

tags = {
   Name = "stephen-subnetpublic"
  }
} # end of resource

# Create the Public Route Table
resource "aws_route_table" "stephen_public_route_table" {
    vpc_id = "${aws_vpc.main.id}"

tags {
        Name = "${var.nameTAGS}"
    }
} # end resource

# Associate the Public Route Table with the Public Subnet
resource "aws_route_table_association" "stephen_Public_VPC_association" {
    subnet_id      = "${aws_subnet.stephen-subnetpublic.id}"
    route_table_id = "${aws_route_table.stephen_public_route_table.id}"
} # end resource
