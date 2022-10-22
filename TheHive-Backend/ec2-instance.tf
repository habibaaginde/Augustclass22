# Resource-8: Create EC2 Instance
resource "aws_instance" "my-ec2-vm" {
  ami                    = data.aws_ami.amzlinux.id  # Amazon Linux
  instance_type          = var.instance_type
  key_name               = "terraform-key"  # This is a key pair you should create first
  subnet_id              = aws_subnet.vpc-dev-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.dev-vpc-sg.id]
  user_data = file("apache-install.sh")
  availability_zone = "us-east-2a"
  tags = {
    "Name" = "TheHive"
  }
  root_block_device {
    tags = {
      "Name" = "thehive-vol"
    }
    volume_size = 15
    delete_on_termination = true

  }


}



