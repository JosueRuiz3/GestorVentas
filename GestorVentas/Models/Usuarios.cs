using System.ComponentModel.DataAnnotations;

namespace GestorVentas.Models
{
    public class Usuarios
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Nombre Del Empleado")]
        [StringLength(25, ErrorMessage = "No más de 25 caracteres")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Apellido Del Empleado")]
        [StringLength(25, ErrorMessage = "No más de 25 caracteres")]
        public string Apellido { get; set; }

        [Required(ErrorMessage = "{0} es un campo obligatorio")]
        [Display(Name = "Dirección")]
        [StringLength(50, ErrorMessage = "No más de 50 caracteres")]
        public string Direccion { get; set; }

        [Display(Name = "Teléfono")]
        [StringLength(20, ErrorMessage = "No más de 20 caracteres")]
        public string Telefono { get; set; }

      
    }
}
