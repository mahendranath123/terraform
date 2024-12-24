terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

resource "local_file" "devops" {
  filename = "/home/akash/Terrform/terraform-varibles/devops1test.txt"
  content  = "This is a DevOps file."
}

resource "local_file" "devops-var" {
  filename = var.file_name  # Corrected to reference var.file_name
  content  = var.content    # Corrected to reference var.content
}


