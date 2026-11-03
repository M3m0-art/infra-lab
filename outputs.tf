output "nombre_contenedor" {
  value = docker_container.servidor_lab.name
}

output "url_servidor" {
  value = "http://localhost:${var.puerto_externo}"
}
