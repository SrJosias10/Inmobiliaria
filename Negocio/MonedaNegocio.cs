using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class MonedaNegocio
    {
        public List<Moneda> listar()
        {
            List<Moneda> lista = new List<Moneda>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select ID, Descripcion From Moneda");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Moneda aux = new Moneda();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
