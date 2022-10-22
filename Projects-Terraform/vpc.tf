# Resource Block
# Create VPC
resource "aws_vpc" "demo-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "demo-vpc"
    "environment" = "Dev"
  }
}



# Create Subnet Block
resource "aws_subnet" "demo-vpc-pub-subnet-1" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-2a"
    map_public_ip_on_launch = true
    tags = {
      "Name" = "demo-vpc-pub-sub-1"
    }
}

# Create Subnet Block
resource "aws_subnet" "demo-vpc-pub-subnet-2" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-2b"
    map_public_ip_on_launch = true
    tags = {
      "Name" = "demo-vpc-pub-sub-2"
    }
}


#IGW Block
resource "aws_internet_gateway" "demo-vpc-igw" {
    vpc_id = aws_vpc.demo-vpc.id
    tags = {
      "Name" = "demo-vpc-igw"
    }
}


#ROUTE TABLE Block

resource "aws_route_table" "demo-vpc-pub-rt" {
  vpc_id = aws_vpc.demo-vpc.id
  tags = {
    "Name" = "demo-vpc-rt"
  }
}


# Route Block
resource "aws_route" "demo-vpc-pub-route" {
    route_table_id = aws_route_table.demo-vpc-pub-rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-vpc-igw.id 
}

# Route Table Association Block
resource "aws_route_table_association" "demo-vpc-rt-association" {
    subnet_id = aws_subnet.demo-vpc-pub-subnet-1.id 
    route_table_id = aws_route_table.demo-vpc-pub-rt.id 
}


# Security Group Block
resource "aws_security_group" "demo-vpc-sec-grp" {
    name = "demo-vpc-security-grp"
    description = " This Seg Grp for demo vpc"
    vpc_id = aws_vpc.demo-vpc.id 
    tags = {
      "Name" = "demo-vpc-sec-grp"
    }


    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow port 22"
      from_port = 22
      protocol = "tcp"
      to_port = 22
    } 

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow port https"
      from_port = 443
      protocol = "tcp"
      to_port = 443
    } 

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow port 80"
      from_port = 80
      protocol = "tcp"
      to_port = 80
    } 


    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow port 80"
      from_port = 8080
      protocol = "tcp"
      to_port = 8080
    } 


        ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow port 80"
      from_port = 9000
      protocol = "tcp"
      to_port = 9000
    }


        ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow port 80"
      from_port = 5432
      protocol = "tcp"
      to_port = 5432
    }


    egress  {
      cidr_blocks = ["0.0.0.0/0" ]
      description = "allowing all ip and port outbound"
      from_port = 0
      protocol = "-1"
      to_port = 0
} 
}
















