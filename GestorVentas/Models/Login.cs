using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace GestorVentas.Models
{
    public class Login
    {
        public int Id { get; set; }

        public string Usuario { get; set; }

        public string Contrasena { get; set; }

    }
}
