using Microsoft.AspNetCore.Mvc;

namespace GestorVentas.Controllers
{
    public class ProductoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
