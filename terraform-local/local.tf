resource "local_file" "devops"{
    filename = "/home/akash/Terraform/terraform-local/devops_auto.txt "
    content =  "  I  want  to become  a  King of  India"

}


resource "random_string" "rand-str" {

length = 16

special = true

override_special ="!#$%&*() -= +[l}<> :? "

}

output  "rand-str" {
value = random_string.rand-str[*].result

}
