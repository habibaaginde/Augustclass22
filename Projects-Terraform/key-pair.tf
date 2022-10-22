resource "aws_key_pair" "my-demo-key" {
    key_name = "aws-demo-key"
    public_key = "USER YOUR LOCAL PUBLIC KEY"   # GENERATE AN ID_RSA.public kEY USING ssh-keygen
    tags = {
      "Name" = "aws-demo-key"
    }
  
}