resource "aws_instance" "roboshop"{
    #count = 10
    count = length(var.instances)
    instance_type = var.instance_type
    ami = var.ami_id
    vpc_security_group_ids = [aws_security_group.common.id,
                              aws_security_group.roboshop[count.index].id

    ]

    tags = {
        Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
    }

}

resource "aws_security_group" "common" {
    name = "${var.project}-${var.environment}-common"
    description = "A common SG group for all the ${var.project}"

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

        tags = {
            Name = "${var.project}-${var.environment}-common"
                }
    }

resource "aws_security_group" "roboshop" {
    #count = 10
    count=length(var.instances)
    name = "${var.project}-${var.environment}-${var.instances[count.index]}"
    description = "A component SG for the instances of roboshop"

    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
        Name = "${var.project}-${var.environment}-${var.instances[count.index]}"
    }
}



resource "aws_route53_record" "roboshop" {
    count = 10
    #count = length(var.instances)
    zone_id = var.zone_id
    name    = "${var.instances[count.index]}.${var.domain_name}"
    type    = "A"
    ttl     = 60
    records = [aws_instance.roboshop[count.index].private_ip]
    allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
    count = contains(var.instances,"frontend") ? 1 : 0 
    zone_id = var.zone_id
    name = "${var.domain_name}"
    type = "A"
    ttl = 60
    records = [aws_instance.roboshop[index(var.instances,"frontend")].public_ip]
    allow_overwrite = true

}