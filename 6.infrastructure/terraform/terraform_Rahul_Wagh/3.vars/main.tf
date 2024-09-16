provider "aws" {
  region =  "us-central-1"
  access_key = "YOUR_ACCESS"
    secret_key = "YOUR_SECRET"
}

resource "aws_instance" "ec2_example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.instance_type
  tags = var.project_environment
}

variable "project_environment" {
    type = map(string)
    default = {
        project_name = "my-project"
        environment = "dev"
    }
    description = "Map of project environment"
}

variable "instance_type" {
  default = "t2.micro"
  type = string
  description = "value of instance type"
  
}