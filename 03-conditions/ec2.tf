resource "aws_instance" "condition" {
    ami = "ami-0055977a6e828a4f4"
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.medium"
    vpc_security_group_ids = [aws_security_group.condition.id]
    tags = {
        Name = "roboshop-condition"
    }

}

resource "aws_security_group" "condition" {
    name = "condition"
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
        name = "roboshop-condition"

    }
}