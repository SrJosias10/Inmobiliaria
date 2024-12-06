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
                datos.setearConsulta("SELECT ID, IdCiudad, Descripcion FROM Ubicacion");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Ubicacion aux = new Ubicacion();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.Ciudad = new Ciudad();
                    aux.Ciudad.ID = (int)datos.Lector["IdCiudad"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];

                    lista.Add(aux);
                }

                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar ubicaciones", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
