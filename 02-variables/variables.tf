variable "ami_id" {
    type = string
    default = "ami-0055977a6e828a4f4"
    description = "ami_id for the ec2 instance"
}

variable "instance_type" {
    type = string
    #default = "t3.micro"
    description = "instance type of ec2"    

    validation {
        condition = contains (["t3.micro","t3.small","t3.medium","t3.large"],var.instance_type)
        error_message = "instance type should be in t3.micro, t3.small, t3.medium, t3.large"
    }

}

variable "ec2_tags" {
    type = map
    default = {
        Name = "roboshop-momgodb"
        Environment = "dev"
        Terraform = "true"
        project = "roboshop"
        component = "mongodb"
    }
}

variable "cidr" {
    type = list
    default = ["0.0.0.0/0"]
}

variable "from_port" {
    type = number
    default = 0
}