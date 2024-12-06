using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Negocio
{
    public class ImagenNegocio
    {
        public List<Imagen> listar()
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select ID, ImagenUrl URL From Imagenes");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Imagen aux = new Imagen();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];

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
        public List<Imagen> listarPorInmueble(int idInmueble)
        {
            List<Imagen> lista = new List<Imagen>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT ID, ImagenUrl FROM Imagenes WHERE IdInmueble = @InmuebleID");
                datos.setearParametro("@InmuebleID", idInmueble);
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Imagen aux = new Imagen();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.ImagenUrl = (string)datos.Lector["ImagenUrl"];
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
        public void agregarImagen(int idInmueble, string imagenUrl)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                // Insertar la imagen en la tabla Imagenes
                datos.setearConsulta("INSERT INTO Imagenes (IdInmueble, ImagenUrl) VALUES (@idInmueble, @imagenUrl)");
                datos.setearParametro("@idInmueble", idInmueble);
                datos.setearParametro("@imagenUrl", imagenUrl);

                datos.ejecutarAccion();  // Ejecuta la consulta de inserción
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
        public void eliminarImagen(int idImagen)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("DELETE FROM Imagenes WHERE ID = @idImagen");
                datos.setearParametro("@idImagen", idImagen);
                datos.ejecutarAccion();
            }
            catch (Exception)
            {
                // Manejo de errores
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
