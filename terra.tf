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

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF

key_name = aws_key_pair.nginx-server-ssh.key_name
}

################# ssh ###################terr
resource "aws_key_pair" "nginx-server-ssh" {
  key_name = "nginx-server-ssh"
  public_key = file("nginx-server.key.pub")
}