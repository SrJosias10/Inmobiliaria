using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Cuenta
    {
        public int ID { get; set; }
        public string Mail { get; set; }
        public string Clave { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int Telefono { get; set; }

        public Cuenta(string cuenta, string pass)
        {
            Mail = cuenta;
            Clave = pass;
        }
        public Cuenta()
        {

        }
    }
}
