variable "ami_id" {
    default = "ami-0055977a6e828a4f4"
    description = "AMI ID for the instances"

}

variable "instance_type" {
    default = "t3.medium"
    description = "Instance type of Ec2"

    validation {
        condition = contains (["t3.micro","t3.small","t3.medium","t3.large"],var.instance_type)
        error_message = "Instance should be one among these t3.micro,t3.small,t3.medium,t3.large"
    }

}
             
variable "environment" {
    default = "prod"
}

variable "project" {
  default = dev
}

variable "instances" {
    type = list
    default = ["mongodb","redis","mysql","rabbitmq","catalogue","user","cart","shipping","payment","frontend"]
} 

