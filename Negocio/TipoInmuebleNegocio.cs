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
                datos.setearConsulta("SELECT ID, Descripcion FROM TipoInmueble");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    TipoInmueble tipo = new TipoInmueble
                    {
                        ID = (int)datos.Lector["ID"],
                        Descripcion = (string)datos.Lector["Descripcion"]
                    };
                    lista.Add(tipo);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al listar tipos de inmueble.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}