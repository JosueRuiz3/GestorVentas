namespace GestorVentas.Models
{
    public class DetalleVenta
    {
        public int IdDetalleVenta { get; set; }
        public int FacturacionId { get; set; }
        public Producto oProductoId { get; set; }
        public int ClienteId { get; set; }
        public decimal PrecioVenta { get; set; }
        public int Cantidad { get; set; }
        public decimal TOTAL { get; set; }
        public DateTime FechaCreacion { get; set; }
    }
}
