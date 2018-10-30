resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.Subnet_1.id}"
#  associate_public_ip_address ="true"
  user_data              = "${file("./userdata.sh")}"
  key_name = "${aws_key_pair.newkey.key_name}"
#  iam_instance_profile   = "${aws_iam_instance_profile.ec2_profile.name}"
  vpc_security_group_ids = ["${aws_security_group.webservers-sg.id}"]

  tags {
    Name = "${var.Public_instance_name}"
  }
}
resource "aws_instance" "web1" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"
  subnet_id = "${aws_subnet.private_subnet_1.id}"
#  associate_public_ip_address ="true"
  # user_data              = "${file("./userdata.sh")}"
  key_name = "${aws_key_pair.newkey.key_name}"
#  iam_instance_profile   = "${aws_iam_instance_profile.ec2_profile.name}"
  vpc_security_group_ids = ["${aws_security_group.webservers-sg.id}"]

  tags {
    Name = "${var.Private_instance_name}"
  }
}


resource "aws_key_pair" "newkey" {
    key_name = "${var.keyname}"
    public_key = "${file("./keytwo.pub")}"
  
}
