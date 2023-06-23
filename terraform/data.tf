data "aws_ami" "ubuntu" {
  most_recent = true
  
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}