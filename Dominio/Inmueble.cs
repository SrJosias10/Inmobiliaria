using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Inmueble
    {
        public int ID { get; set; }
        public TipoInmueble Tipo { get; set; }
        public Ubicacion Ubicacion { get; set; }
        public Estado Estado { get; set; }
        public Moneda Moneda { get; set; }
        public string Descripcion { get; set; }
        public float Precio { get; set; }
        public int Ambientes { get; set; }
        public int Garages { get; set; }
        public int Dormitorios { get; set; }
        public int Banos { get; set; }
        public int Antiguedad { get; set; }
        public float Expensas { get; set; }
        public int Superficie { get; set; }
    }
}
