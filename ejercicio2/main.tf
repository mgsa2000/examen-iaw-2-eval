# Configuramos el proveedor de AWS
provider "aws" {
  region = "us-east-1"
}

# Creamos un grupo de seguridad
resource "aws_security_group" "grupo_seguridad_ejercicio_2" {
  name        = "grupo_seguridad_ejercicio_2"
  description = "Grupo de seguridad para la instancia de ejercicio2 02"

  # Reglas de entrada para permitir el tráfico SSH, HTTP y HTTPS
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Reglas de salida para permitir todas las conexiones salientes
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }  
}

# Creamos una instancia EC2
resource "aws_instance" "instancia_ejercicio_2" {
  ami             = "ami-02457590d33d576c3"
  instance_type   = "t2.medium"
  key_name        = "vockey"
  security_groups = [aws_security_group.grupo_seguridad_ejercicio_2.name]

  tags = {
    Name = "instancia_ejercicio_2"
  }
}

# Creamos una variable de salida con la IP pública de la instancia
output "ip_publica" {
  value = aws_instance.instancia_ejercicio_2.public_ip
}