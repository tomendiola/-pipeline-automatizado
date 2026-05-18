terraform {
     required_providers {
        docker = {
            source = "kreuzwerker/docker"
            version = "~> 3.0.1"
        }
    }
}
provider "docker" {}

# Definimos la imagen que Terraform debe construir
resource "docker_image" "mi_api" {
 name = "mi_api_automatizada:latest"
 build {
    context = "."
 }
}
# Declaramos el contenedor (nuestro "servidor")
resource "docker_container" "api_contenedor" {
 image = docker_image.mi_api.image_id
 name = "servidor_api_produccion"
 ports {
    internal = 5000
    external = 8080
 }
}