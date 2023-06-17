provider "aws" {
    region = "us-east-1"
    access_key = "my_access_key"
    secret_key = "my_secret_key"
}


# 1. create vpc
# 2. create internet gateway
# 3. Create Custom Route Table
# 4. create a Subnet 
# 5. associate subnet with route table 
# 6. create a security group to allow port 22, 80, 443
# 7. create network interface with an ip  in subnet that was created in step 4 
# 8. assign an elastic IP to the network interface created in step 7
# 9. create  Ubuntu server and install/enable apache2

