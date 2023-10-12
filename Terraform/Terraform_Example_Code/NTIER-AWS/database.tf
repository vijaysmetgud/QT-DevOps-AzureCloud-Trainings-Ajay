

# datasource to fetch the details 
data "aws_subnets" "db" {
  filter {
    name   = "tag:Name"
    values = var.aws_db_subnet_names
  }
  depends_on = [aws_subnet.subnets]
}


# here below code db subnets group  
resource "aws_db_subnet_group" "rds" {
  name       = "rds"
  subnet_ids = data.aws_subnets.db.ids

  tags = {
    Name = "rds"
  }

  depends_on = [aws_subnet.subnets, data.aws_subnets.db]
}

# below code is for rds instance 
resource "aws_db_instance" "rds_ntier" {
  allocated_storage      = 20
  db_name                = "emp"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "root"
  password               = "rootroot"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.rds.name
  identifier             = "qtntierfromtf"
  vpc_security_group_ids = [aws_security_group.dbsg.id]

  depends_on = [aws_db_subnet_group.rds, aws_vpc.ntier_vpc, aws_subnet.subnets]

}
