using GestorVentas.Data;
using GestorVentas.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace GestorVentas.Controllers
{
    public class AccesoController : Controller
    {
        Dto_Login _dtoLogin = new Dto_Login();

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Index(string usuario, string contraseña)
        {
            Login ouser = new Login();
            ouser = _dtoLogin.Listar().Where(u => u.Usuario == usuario && u.Contraseña == contraseña).FirstOrDefault();

            if (ouser == null)
            {
                ViewData["mensaje"] = "Usuario no encontrado";
                return View();
            }

            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, ouser.Usuario),
                new Claim(ClaimTypes.Role, "Administrador"),
            };

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);

            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));

            //SESIONES
            //HttpContext.Session.SetString("correo", correo);

            return RedirectToAction("Index", "Home");
        }

        public async Task<IActionResult> Salir()
        {
            // Clear the existing external cookie
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            return RedirectToAction("Index", "Acceso");
        }
    }
}
