using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class CiudadNegocio
    {
        public List<Ciudad> listar()
        {
            List<Ciudad> lista = new List<Ciudad>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select ID, Nombre From Categoria");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Ciudad aux = new Ciudad();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.Provincia.ID = (int)datos.Lector["IdProvincia"];
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

