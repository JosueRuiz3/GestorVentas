using GestorVentas.Data;
using GestorVentas.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace GestorVentas.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        Dto_Productos _daProducto = new Dto_Productos();
        Dto_Clientes _daCliente = new Dto_Clientes();
        Dto_Facturacion _daVenta = new Dto_Facturacion();

        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }


        [HttpGet]
        public JsonResult AutoCompleteProducto(string search)
        {
            List<Autocomplete> autocomplete = new List<Autocomplete>();
            autocomplete = _daProducto.Listar()
                .Where(x => string.Concat(x.Codigo.ToUpper(), x.oCategoria.Descripcion.ToUpper(), x.NombreProducto.ToUpper()).Contains(search.ToUpper()))
                .Select(m => new Autocomplete
                {
                    label = $"{m.Codigo} - {m.oCategoria.Descripcion} - {m.NombreProducto}",
                    value = m.IdProducto
                }
                ).ToList();

            return Json(autocomplete);
        }

        [HttpGet]
        public JsonResult ObtenerProducto(int idproducto)
        {
            Producto? oProducto = new Producto();
            oProducto = _daProducto.Listar().Where(x => x.IdProducto == idproducto).FirstOrDefault();
            return Json(oProducto);
        }

        [HttpGet]
        public JsonResult AutoCompleteCliente(string search)
        {
            List<Autocomplete> autocomplete = new List<Autocomplete>();
            autocomplete = _daCliente.Listar()
                .Where(x => string.Concat(x.Nombre.ToUpper(), x.Apellido.ToUpper()).Contains(search.ToUpper()))
                .Select(m => new Autocomplete
                {
                    label = $"{m.Nombre} - {m.Apellido}",
                    value = m.IdCliente
                }
                ).ToList();

            return Json(autocomplete);
        }

        [HttpGet]
        public JsonResult ObtenerCliente(int idcliente)
        {
            Clientes? oCliente = new Clientes();
            oCliente = _daCliente.Listar().Where(x => x.IdCliente == idcliente).FirstOrDefault();
            return Json(oCliente);
        }
    }
}