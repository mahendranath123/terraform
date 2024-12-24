variable "file_name" {
  default = "/home/akash/terraform/terraform-variables/devops-var.txt" # Add a filename
}

variable "content" {
  default = "this is auto-generated from variables"
}


variable "devops_op_triner" {}

variable "content_map" {
  type = map(string)
  default = {
    content1 = "this is a content1"
    content2 = "this is a content2"
  }
}


