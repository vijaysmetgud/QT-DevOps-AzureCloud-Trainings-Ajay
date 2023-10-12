
/* # general way of writing the terraform code below
resource aws_vpc "ntier_vpc"{
    cidr_block = "10.10.0.0/16"
    tags = {
        name = "my_vpc"
    }
} */

/* # here i am using inputs.tf variable to call cidr range below example code
resource aws_vpc "ntier_vpc"{
    cidr_block = var.vpc_cidr
    tags = {
        name = "my_vpc"
    }
} */

# here below code we have used locals block, calling the local name assigned  
resource "aws_vpc" "ntier_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = local.name
  }
}

# here all variables assigned the vlaues we have called it 
resource "aws_subnet" "subnets" {
  vpc_id = aws_vpc.ntier_vpc.id
  # so here i have comment subnet count in the variable and added length function 
  # count = length(var.subnet_cidr_ranges)
  # here below code is change because we are suing format function and calling that format function from variables inputs.tf
  count = length(var.subnet_names)
  # cidr_block = var.subnet_cidr_ranges[count.index]
  # here below code we have used format function to call the variable values subnet cider format from the inputs.tf file
  # cidr_block = format(var.subnet_cider_format, count.index)
  # here below we are using cidrsubnet function to call variable vpc_cidr or create multiple subnets 
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, count.index)
  availability_zone = var.subnet_azs[count.index]
  tags = {
    Name = var.subnet_names[count.index]
  }

  depends_on = [aws_vpc.ntier_vpc]
}


/* # added here below code for subnet 
resource "aws_subnet" "web1" {
  vpc_id = aws_vpc.ntier_vpc.id
  cidr_block = var.web1_subnet_cidr
  tags = {
    name = "web1"
  }

  depends_on = [aws_vpc.ntier_vpc]
} */


data "aws_route_table" "default" {
  vpc_id     = aws_vpc.ntier_vpc.id
  depends_on = [aws_vpc.ntier_vpc]

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ntier_vpc.id
  tags = {
    name = "my_vpc_igw"
  }
  depends_on = [aws_vpc.ntier_vpc]
}

resource "aws_route" "igw_route" {
  route_table_id         = data.aws_route_table.default.id
  destination_cidr_block = local.anywhere
  gateway_id             = aws_internet_gateway.igw.id


  depends_on = [aws_vpc.ntier_vpc, aws_internet_gateway.igw]

}


