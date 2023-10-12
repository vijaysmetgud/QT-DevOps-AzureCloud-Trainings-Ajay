
# this below is for web a security group creationg calling the variable which is there in the inputs.tf file
resource "aws_security_group" "websg" {
  name        = var.web_sg_config.name
  description = var.web_sg_config.description
  vpc_id      = aws_vpc.ntier_vpc.id
  depends_on  = [aws_vpc.ntier_vpc]
}



# this below code is for security rule for web we are accessig from inputs.tf file variable web_sg_config
resource "aws_security_group_rule" "web_sg_rules" {
  count             = length(var.web_sg_config.rules)
  type              = var.web_sg_config.rules[count.index].type
  from_port         = var.web_sg_config.rules[count.index].from_port
  to_port           = var.web_sg_config.rules[count.index].to_port
  protocol          = var.web_sg_config.rules[count.index].protocol
  cidr_blocks       = [var.web_sg_config.rules[count.index].cidr_block]
  security_group_id = aws_security_group.websg.id
  depends_on        = [aws_security_group.websg]
}



# this below is for db a security group creationg calling the variable which is there in the inputs.tf file
resource "aws_security_group" "dbsg" {
  name        = var.db_sg_config.name
  description = var.db_sg_config.description
  vpc_id      = aws_vpc.ntier_vpc.id
  depends_on  = [aws_vpc.ntier_vpc]
}



# this below code is for db security rule for web we are accessig from inputs.tf file variable web_sg_config
resource "aws_security_group_rule" "db_sg_rules" {
  count             = length(var.db_sg_config.rules)
  type              = var.db_sg_config.rules[count.index].type
  from_port         = var.db_sg_config.rules[count.index].from_port
  to_port           = var.db_sg_config.rules[count.index].to_port
  protocol          = var.db_sg_config.rules[count.index].protocol
  cidr_blocks       = [var.db_sg_config.rules[count.index].cidr_block]
  security_group_id = aws_security_group.dbsg.id
  depends_on        = [aws_security_group.dbsg]
}




# this below is for app a security group creationg calling the variable which is there in the inputs.tf file
resource "aws_security_group" "appsg" {
  name        = var.app_sg_config.name
  description = var.app_sg_config.description
  vpc_id      = aws_vpc.ntier_vpc.id
  depends_on  = [aws_vpc.ntier_vpc]
}



# this below code is for app security rule for web we are accessig from inputs.tf file variable web_sg_config
resource "aws_security_group_rule" "app_sg_rules" {
  count             = length(var.app_sg_config.rules)
  type              = var.app_sg_config.rules[count.index].type
  from_port         = var.app_sg_config.rules[count.index].from_port
  to_port           = var.app_sg_config.rules[count.index].to_port
  protocol          = var.app_sg_config.rules[count.index].protocol
  cidr_blocks       = [var.app_sg_config.rules[count.index].cidr_block]
  security_group_id = aws_security_group.appsg.id
  depends_on        = [aws_security_group.appsg]
}








/* # this below code is for security rule for web nothing access variable it is raw for http inbound
resource "aws_security_group_rule" "web_sg_http" {
  type              = "ingress"
  from_port         =  80
  to_port           =  80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
  depends_on        = [aws_security_group.web]
}

# this below code is for security rule for web nothing access variable it is raw for ssh inbound
resource "aws_security_group_rule" "web_sg_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
  depends_on        = [aws_security_group.web]

}

# this below code is for security rule for web nothing access variable it is raw for outbound
resource "aws_security_group_rule" "web_sg_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1" 
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web.id
  depends_on        = [aws_security_group.web]

}
 */
