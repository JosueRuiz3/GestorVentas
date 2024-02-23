namespace GestorVentas.Models
{
    public class VentaRequest
    {
        public string DocCliente { get; set; }
        public decimal MontoPagoCon { get; set; }
        public decimal MontoCambio { get; set; }
        public decimal MontoSubTotal { get; set; }
        public decimal MontoIVA { get; set; }
        public string NumDocumento { get; set; }
        public decimal MontoTotal { get; set; }

        public List<DetalleVenta> Productos { get; set; }
        public List<ClienteVenta> Clientes { get; set; }


    }

}
