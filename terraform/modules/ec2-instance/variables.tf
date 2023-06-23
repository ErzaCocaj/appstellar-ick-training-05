variable "subnet_id" {
   type = string

}

variable "security_groups" {
   type = list(string)

}

variable "type" {
    type = string

}

variable "instance_name" {
   type = string
}

variable "device_index" {
    type = number

}

variable "environment" {
    type = string

}



