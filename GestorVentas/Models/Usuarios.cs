﻿using System.ComponentModel.DataAnnotations;

namespace GestorVentas.Models
{
    public class Usuarios
    {
        public int Id { get; set; }

        public string Nombre { get; set; }

        public string Apellido { get; set; }

        public string Direccion { get; set; }

        public string Telefono { get; set; }

      
    }
}
