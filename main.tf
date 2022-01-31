# Configure the AWS Provider
provider "aws" {
  region = "us-east-1" 
  # Authentication set up (HARD-CODE)
  access_key = ""
  secret_key = ""
}

resource "aws_vpc" "first_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "production"
  }
}

# order doesn't matter; resources can be declared anywhere in the file
resource "aws_subnet" "first_subnet" {
  vpc_id = aws_vpc.first_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}

output "vpc_id" {
    value = aws_vpc.first_vpc.id
}

## To remove a resource, instead of using `terraform destory` remove/comment the block

# Create or provision resource
# resource "aws_instance" "First_server" {
#   ami           = "ami-04505e74c0741db8d"
#   instance_type = "t2.micro"
# }

# How does multi-cloud get implemented?
# Something along the lines of
# provider "genesyscloud" {
#   oauthclient_id     = "client-id"
#   oauthclient_secret = "client-secret"
#   aws_region         = "us-east-1"
# }
