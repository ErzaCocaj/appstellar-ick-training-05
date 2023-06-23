resource "aws_network_interface" "web" {
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.type

network_interface {
    network_interface_id = aws_network_interface.web.id
    device_index         = var.device_index
  }

  tags = {
    Name = "${var.instance_name}-${var.environment}"
  }
}