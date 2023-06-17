provider "aws" {
    region = "us-east-1"
    access_key = "my_access_key"
    secret_key = "my_secret_key"
}


# 1. create vpc
resource "aws_vpc" "prod-vpc" {
    cidr_blockk= "10.0.0.0/16"
    tags={
        Name= "Prod-VPC"
    }
}
# 2. create internet gateway
resource "aws_internet_gateway" "gw" {
    vpc_id= aws_vpc.prod-vpc.id 
    tags={
        Name= "Prod-IGW"
    }
}
# 3. Create Custom Route Table
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.prod-vpc.id
    route {
        cidr_blockk="0.0.0.0/0"
        gateway_id= aws_internet_gateway.gw.id
    }
    route {
        ipv6_cidr_blockk="::/0"
        egress_only_gateway_id = aws_internet_gateway.gw.id 
   }
   tags ={
         Name= "Prod-RT"
   }
}
# 4. create a Subnet 
resource "aws_subnet" "subnet-1" {
    vpc_id= aws_vpc.prod-vpc.id 
    cidr_blockk= "10.0.1.0/24"
    availability_zone= "us-east-1a"
    tags={
        Name= "prod-subnet"
    }
}
# 5. associate subnet with route table 
resource "aws_route_table_association" "a" {
    subnet_id= aws_subnet.subnet-1.id
    route_table_id= aws_route_table.prod-route-table.id
}
# 6. create a security group to allow port 22, 80, 443
resource "aws_security_group" "allow_web" {
    name= "allow_web"
    description = "Allow Web inbound traffic"
    vpc_id= aws_vpc.prod-vpc.id
    ingress {
        description= "HTTPS"
        from_port= 443
        to_port= 443
        protocol= "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }
     ingress {
        description= "HTTP"
        from_port= 80
        to_port= 80
        protocol= "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }
     ingress {
        description= "SSH"
        from_port= 22
        to_port= 22
        protocol= "tcp"
        cidr_blocks= ["0.0.0.0/0"]
    }
    egress = {
        from_port =0
        to_port =0
        protocol="-1"
        cidr_blocks= ["0.0.0.0/0"]
    }
    tags = {
        Name= "allow_web"
    }
}
# 7. create network interface with an ip  in subnet that was created in step 4 
resource "aws_network_interface" "web-server-nic" {
    subnet_id = aws_subnet.subnet-1.id 
    private_ips = ["10.0.1.50"]
    security_groups = ["aws_security_group.allow_web"]

  
}

# 8. assign an elastic IP to the network interface created in step 7
# 9. create  Ubuntu server and install/enable apache2

