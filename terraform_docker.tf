Terraform-Docker
$ mkdir terraform-docker
$ cd  terraform-docker
$ vim main.tf    @terraform init ,terraform plan-error  install docker@
$ sudo apt-get install docker.io
$ sudo docker ps
$ sudo chown $USER /var/run/docker.sock

$ terraform plan
$ terraform validate
$ terraform apply
$ take public IP and paste in new tab in browser

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.23.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {

  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {

  image = docker_image.nginx.latest
  name  = "nginx-tf"
  ports {

    internal = 80
    external = 80
  }
}
