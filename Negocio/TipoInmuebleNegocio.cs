using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class TipoInmuebleNegocio
    {
        public List<TipoInmueble> listar()
        {
            List<TipoInmueble> lista = new List<TipoInmueble>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select ID, Descripcion From TipoInmueble");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    TipoInmueble aux = new TipoInmueble();
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
