using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Ubicacion
    {
        public int ID { get; set; }
        public Ciudad Ciudad { get; set; }
        public string Descripcion { get; set; }
    }
}
