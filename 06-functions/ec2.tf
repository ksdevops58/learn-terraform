resource "aws_instance" "f {
    ami = "ami-0055977a6e828a4f4"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.web.id]
    tags = {
        Name = "roboshop-web"
    }

}

resource "aws_security_group" "web" {
    name = "web"
    description = "Allow all TLS inbound and outbound traffic"
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port =0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
        name = "roboshop-web"

    }
}