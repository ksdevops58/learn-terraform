output "instance_info" {
    value = aws_instance.roboshop[0].primary_network_interface_id
}