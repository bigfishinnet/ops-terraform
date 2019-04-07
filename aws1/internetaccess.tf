
# Create the Internet Access
resource "aws_route" "stephen_VPC_internet_access" {
  route_table_id        = "${aws_route_table.stephen_public_route_table.id}"
  destination_cidr_block = "${var.allinternetCIDRblock}"
  gateway_id             = "${aws_internet_gateway.stephen_VPC_GW.id}"
} # end resource

# Create the Internet Gateway
resource "aws_internet_gateway" "stephen_VPC_GW" {
  vpc_id = "${aws_vpc.main.id}"

tags {
        Name = "${var.nameTAGS}"
    }
} # end resource