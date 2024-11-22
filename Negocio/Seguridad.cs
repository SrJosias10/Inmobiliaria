using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class Seguridad
    {
        public static bool sesionActiva(object user)
        {
            Cuenta aux = user != null ? (Cuenta)user : null;
            if (aux != null && aux.ID != 0)
                return true;
            else
                return false;
        }

        public static bool esAdmin(object user)
        {
            Cuenta aux = user != null ? (Cuenta)user : null;
            return aux.admin;
        }
    }
}
