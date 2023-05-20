data "aws_ami" "ubuntu" {
  most_recent = true
  owners      ={"amazon"}
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "myapp-server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = "Jenkins server"
  user_data = file("jenkins-server-script.sh")
  tags = {
    Name = "ojinitech"
  }
}