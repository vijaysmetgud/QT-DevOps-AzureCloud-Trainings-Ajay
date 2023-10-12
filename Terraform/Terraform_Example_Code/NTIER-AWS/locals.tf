

# locals are used because instead using tags in main.tf for mutiple time use can use local block and assing the name and call mutiple time
locals {
  name     = "my_vpc"
  anywhere = "0.0.0.0/0"

}