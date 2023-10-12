resource "aws_vpc" "ntier" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "workshop"
  }

}


