using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace GestorVentas.Models
{
    public class Login
    {
        public int Id { get; set; }

        [PersonalData]
        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Usuario")]
        public string Usuario { get; set; }

        [PersonalData]
        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Constraseña")]
        public string Contraseña { get; set; }

    }
}
