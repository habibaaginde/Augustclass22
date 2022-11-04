variable "aws_ami_id" {
  ## Amazon Linux 2 AMI (HVM)
  default = "ami-09d3b3274b6c5d4aa"
  ## "ami-0cd31be676780afa7"
}

variable "ssh_key_pair" {
  default = "C:/Users/Administrator/Desktop/cca650.pem.txt"
  #default = "~/.ssh/id_rsa_ansilble_lab"
}

variable "ssh_key_pair_pub" {
  default = "C:/Users/Administrator/Desktop/CCA6400.pub.pub"
  #default = "~/.ssh/id_rsa_ansilble_lab.pub"
}

variable "ansible_node_count" {
  default = 2
}
