resource "aws_key_pair" "mykey" {
  key_name   = "tkey"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "example" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  # the VPC subnet
subnet_id = aws_subnet.main-public-1.id

# the security group
vpc_security_group_ids = [aws_security_group.allow-ssh.id]
}

resource "aws_instance" "example2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name      = aws_key_pair.mykey.key_name
  # the VPC subnet
subnet_id = aws_subnet.main-public-2.id

# the security group
vpc_security_group_ids = [aws_security_group.allow-ssh.id]
}
