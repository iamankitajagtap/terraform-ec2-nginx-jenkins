variable "ami" {
  description = "AMI for web server"
  type        = string
  default     = "ami-0c7632fb77f35db43" ## Ubuntu

}

variable "instance_type" {
  description = "Instance_type for web server"
  type        = string
  default     = "t3.micro"

}