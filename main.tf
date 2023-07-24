provider "aws" {
   region = "eu-north-1"
   access_key = "AKIAWJ6AVFSKKY4TWIPD"
   secret_key = "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"
}

# if not assign deafult when the script run terraform will ask from user the value from command prompt
variable "subnet_prefix" {
  description = "this is a variable example"
  type = string
}

resource "aws_vpc" "first-vpc" {
  cidr_block = var.subnet_prefix
  tags = {
    Name = "prod"
  }
}


resource "aws_vpc" "second-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "dev"
  }
}



resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id     = aws_vpc.second-vpc.id
  cidr_block = "10.1.1.0/24"

  tags = {
    Name = "dev-subnet"
  }
}


# resource "aws_instance" "my-first-server" {
#   ami           = "ami-0989fb15ce71ba39e"
#   instance_type = "t3.micro"
#   tags = {
#     # Name = "ubuntu"
#   }
# }