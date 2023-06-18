provider "aws" {
  region     = "us-east-1"
  access_key = "my_aws_key"
  secret_key = "my_aws_secret_key"
}

# basic structure 
# resource "<provider>_<resource_type>" "name" {
#     config options...
#     key ="value"
#     key= "another value"
# }

resource "aws_instance" "my-first-server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

resource "aws_vpc" "first-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-first-vpc"
  }
}

resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.first-vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "my-first-subnet"
  }
}

# create another vpc and subnet 
resource "aws_vpc" "second-vpc" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "dev-vpc"
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id     = aws_vpc.second-vpc.id
  cidr_block = "10.1.1.0/24"
  tags = {
    Name = "dev-subnet"
  }
}
