####### provider #######
provider "aws" {
  region = "us-east-1"
}

######## resource #########
resource "aws_instance" "nginx-server" {
    ami =  "ami-07caf09b362be10b8"
    instance_type = "t2.micro"


  tags = {
    name = "terraform-demo"
  }
  vpc_security_group_ids = ["sg-0d46bbb050b90a91a"]
  subnet_id             = "subnet-0339e03548da3f417"
}