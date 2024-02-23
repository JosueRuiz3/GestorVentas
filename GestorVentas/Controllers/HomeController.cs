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
        Dto_Facturacion _daFacturacion = new Dto_Facturacion();
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

        [HttpPost]
        public IActionResult RealizarVenta([FromBody] VentaRequest ventaRequest)
        {
            try
            {
                // Validate the ventaRequest object
                if (ventaRequest == null || ventaRequest.Productos == null || ventaRequest.Clientes == null)
                {
                    return BadRequest("Invalid request.");
                }

                // Create a new Facturacion object and populate it with data from the request
                Facturacion venta = new Facturacion
                {
                    NumDocumento = GenerateNumeroDocumento(), // You need to implement a method to generate a unique document number
                    DocCliente = ventaRequest.Clientes.First().DocCliente, // Assuming only one client is selected
                    MontoPagoCon = ventaRequest.MontoPagoCon,
                    // Populate other properties based on your requirements
                };

                // Process each selected product and create DetalleFactura objects
                foreach (var producto in ventaRequest.Productos)
                {
                    DetalleFactura detalle = new DetalleFactura
                    {
                        oProductoId = producto.oProductoId,
                        PrecioVenta = producto.PrecioVenta,
                        Cantidad = producto.Cantidad,
                        TOTAL = producto.PrecioVenta * producto.Cantidad,
                        // Populate other properties based on your requirements
                    };

                    venta.oDetalleFactura.Add(detalle);
                }

                // Insert the venta object into the database
                int idFacturacion = _daFacturacion.InsertarFacturacion(venta);

                if (idFacturacion > 0)
                {
                    // Update the document number with the generated one
                    _daFacturacion.ActualizarNumeroDocumento(idFacturacion, venta.NumDocumento);

                    return Ok(new { IdFacturacion = idFacturacion, NumeroDocumento = venta.NumDocumento });
                }
                else
                {
                    return StatusCode(500, "Error while processing the sale.");
                }
            }
            catch (Exception ex)
            {
                // Log the exception or handle it appropriately
                return StatusCode(500, "An error occurred while processing the sale.");
            }
        }

        private string GenerateNumeroDocumento()
        {
            // You can implement your own logic to generate a unique document number.
            // For example, you can combine a prefix with a timestamp or use a GUID.

            string prefix = "DOC";
            string timestamp = DateTime.Now.ToString("yyyyMMddHHmmssfff");

            // Concatenate prefix and timestamp to form the document number
            string numeroDocumento = prefix + timestamp;

            return numeroDocumento;
        }
    }
}