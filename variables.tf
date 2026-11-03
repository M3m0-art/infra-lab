variable "nombre_contenedor" {
  description = "Nombre del contenedor"
  type        = string
  default     = "servidor-lab"
}

variable "puerto_externo" {
  description = "Puerto del host que se expone"
  type        = number
  default     = 8083
}
