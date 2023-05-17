ubuntu-ec2
mkdir terraaaform-variables
cd terraform-variables
vim main.tf

resource "local_file" "devops" {
  filename = "/home/ubuntu/terraform-variable/devopstest.txt"
  content  = "This is yasmeen"
}
terraform init
terraform validate 
terraform plan
terraform apply

vim terraform-variables.tf
variable "filename" {
  default = "/home/practicevm1/Day1/terraform-variables/devops_automated.txt"
}
variable "content" {
  default = "This is auto generated from a variable"
}


vim main.tf (edit)

resource "local_file" "devops" {
  filename = "/home/ubuntu/terraform-variable/devopstest.txt"
  content  = "This is yasmeen"
}
resource "local_file" "devops-var" {
  filename = var.filename
  content  = var.content
}
===================
  terraform plan
terraform apply
cat devops_automated.txt 

vim terraform-variables.tf
variable "filename" {
  default = "/home/practicevm1/Day1/terraform-variables/devops_automated.txt"
}
variable "content" {
  default = "This is auto generated from a variable"
}
variable "devops_op_trainer" {}
output "devops_op_trainer" {
  value = var.devops_op_trainer
}
:wq
ubuntu@ip-172-31-90-232:~/terraform-variable$ export TF_VAR_devops_op_trainer=Yasmeen
terraform apply

#change name last-here without changing code we can maniculate by terraforms#
ubuntu@ip-172-31-90-232:~/terraform-variable$ export TF_VAR_devops_op_trainer=Dr.Yasmeen
terraform apply
click yes
==============================
  terraform data types
vim terraform-variables.tf
variable "filename" {
  default = "/home/practicevm1/Day1/terraform-variables/devops_automated.txt"
}
variable "content" {
  default = "This is auto generated from a variable"
}
variable "devops_op_trainer" {}
output "devops_op_trainer" {
  value = var.devops_op_trainer
}
variable "content_map" {
  type = map(any)
  default = {
    "content1" = "This is Content1"
    "content2" = "This is Content2"
  }
}
:wq
vim main.tf (edit)

resource "local_file" "devops" {
  filename = "/home/ubuntu/terraform-variable/devopstest.txt"
  content  = var.content_map["content2"]
}
resource "local_file" "devops-var" {
  filename = var.filename
  content  = var.content_map["content2"]
}
:wq
terraform plan
terraform apply
cat devopstest.txt
=========================================================
 

vim terraform-variables.tf
variable "filename" {
  default = "/home/practicevm1/Day1/terraform-variables/devops_automated.txt"
}
variable "content" {
  default = "This is auto generated from a variable"
}
variable "devops_op_trainer" {}
output "devops_op_trainer" {
  value = var.devops_op_trainer
}
variable "content_map" {
  type = map(any)
  default = {
    "content1" = "This is Content1"
    "content2" = "This is Content2"
  }
}
variable "file_list" {
  type = list
  default = ["/home/practicevm1/Day1/terraform-variables/file1.txt","/home/practicevm1/Day1/terraform-variables/file2.txt"                                                                          icevm1/Day1/terraform-variables/file2.txt"]
}
:wq
vim main.tf
resource "local_file" "devops" {
  filename = var.file_list[0]
  content  = var.content_map["content1"]
}
resource "local_file" "devops-var" {
  filename = var.file_list[1]
  content  = var.content_map["content2"]
}
:wq
terraform plan
terraform apply
ls #file name changed filename1,filenme2#


resource "local_file" "devops" {
  filename = "/home/practicevm1/Day1/terraform-variables/devopstest.txt"
  content  = var.content_map["content1"]
}

resource "local_file" "devops-var" {
  filename = var.filename
  content  = var.content_map["content2"]
}

output "devops_op_trainer" {
  value = var.devops_op_trainer
}

output "aws_ec2_instance" {
  value = var.aws_ec2_object
}
practicevm1@practicevm1:~/Day1/terraform-variables$ cat variables.tf
variable "filename" {
  default = "/home/practicevm1/Day1/terraform-variables/devope_automated.txt"
}

variable "content" {
  default = "This is auto generated from a variable"
}

variable "devops_op_trainer" {}

variable "content_map" {
  type = map(any)
  default = {
    "content1" = "This is Content1"
    "content2" = "This is Content2"
  }
}

variable "file_list" {
  type = list
  default = ["/home/practicevm1/Day1/terraform-variables/file1.txt","/home/pract                                                                             icevm1/Day1/terraform-variables/file2.txt"]
}

variable "aws_ec2_object" {
  type = object({
    name = string
    instances = number
    keys = list(string)
    ami = string
})

default = {
  name = "test_ec2_instance"
  instances = 2
  keys = ["key1.pem","key2.pem"]
  ami = "ubuntu-aaw3reoiasddv"
}
}

output "tf_batch_students" {
  value = var.no_of_students
}
