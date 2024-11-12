using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class UbicacionNegocio
    {
        public List<Ubicacion> listar()
        {
            List<Ubicacion> lista = new List<Ubicacion>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select ID, IdCiudad, Descripcion URL From Ubicacion");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Ubicacion aux = new Ubicacion();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.Ciudad.ID = (int)datos.Lector["IdCiudad"];
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
