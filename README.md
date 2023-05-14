# Terraform-practice
AWS-EC2 ubuntu 22.04-t2.micro-newKP-new SG



steps for installation
https://developer.hashicorp.com/terraform/downloads
or https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli

$mkdir terraform-course
$cd terraform-course
$ls
$vim devops.txt
$cat devops.txt    #want to avoid this all steps use terraform#
now createone folder terraform-local
$mkdir terraform-local
$ cd terraform-local
vim local.tf

resource "local_file" "pet" {

  filename = "/home/practicevm1/Day1/terraform-local/devops_automated.txt"
  content  = "I wants to become a devops engineer who knows terraform"
}

resource "random_string" "rand_str" {

  length           = 16
  special          = true
  override_special = "~!$%^*()_+<>:?{}|"
}

output "rand_str" {

  value = random_string.rand_str
}


$ terraform init
$ terraform validate 
$ terraform plan
$ terraform apply
$ ls
$ cat devops_automated.txt
