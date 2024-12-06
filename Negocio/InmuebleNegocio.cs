using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Dominio;


namespace Negocio
{
    public class InmuebleNegocio
    {
        public List<Inmueble> listar()
        {
            List<Inmueble> lista = new List<Inmueble>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT I.ID, TI.ID AS IDTipo, TI.Descripcion AS Tipo, U.ID AS IDUbicacion, U.Descripcion AS Ubicacion, C.ID AS IDCiudad, C.Descripcion AS Ciudad, P.ID AS IDProvincia, P.Descripcion AS Provincia, E.ID AS IDEstado, E.Descripcion AS Estado, M.ID AS IDMoneda, M.Descripcion AS Moneda, I.Descripcion, I.Precio, I.Ambientes, I.Garage, I.Dormitorios, I.Banos, I.Antiguedad, I.Expensas, I.Superficie FROM Inmueble I INNER JOIN TipoInmueble TI ON I.IdTipoInmueble = TI.ID INNER JOIN Ubicacion U ON I.IdUbicacion = U.ID INNER JOIN Estado E ON I.IdEstado = E.ID INNER JOIN Moneda M ON I.IdMoneda = M.ID INNER JOIN Ciudad C ON U.IdCiudad = C.ID INNER JOIN Provincia P ON C.IdProvincia = P.ID");
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    int inmuebleId = (int)datos.Lector["ID"];

                        Inmueble aux = new Inmueble();
                        aux.ID = (int)datos.Lector["ID"];

                        aux.Tipo = new TipoInmueble();
                        aux.Tipo.ID = (int)datos.Lector["IdTipo"];
                        aux.Tipo.Descripcion = (string)datos.Lector["Tipo"];

                        aux.Ubicacion = new Ubicacion();
                        aux.Ubicacion.ID = (int)datos.Lector["IdUbicacion"];
                        aux.Ubicacion.Descripcion = (string)datos.Lector["Ubicacion"];
                        
                        aux.Ubicacion.Ciudad = new Ciudad();
                        aux.Ubicacion.Ciudad.ID = (int)datos.Lector["IdCiudad"];
                        aux.Ubicacion.Ciudad.Descripcion = (string)datos.Lector["Ciudad"];

                        aux.Ubicacion.Ciudad.Provincia = new Provincia();
                        aux.Ubicacion.Ciudad.Provincia.ID = (int)datos.Lector["IdProvincia"];
                        aux.Ubicacion.Ciudad.Provincia.Descripcion = (string)datos.Lector["Provincia"];
                        
                        aux.Estado = new Estado();
                        aux.Estado.ID = (int)datos.Lector["IdEstado"];
                        aux.Estado.Descripcion = (string)datos.Lector["Estado"];

                        aux.Moneda = new Moneda();
                        aux.Moneda.ID = (int)datos.Lector["IdMoneda"];
                        aux.Moneda.Descripcion = (string)datos.Lector["Moneda"];

                        aux.Descripcion = (string)datos.Lector["Descripcion"];
                        aux.Precio = (float)(decimal)datos.Lector["Precio"];
                        aux.Ambientes = (int)datos.Lector["Ambientes"];
                        aux.Garages = (int)datos.Lector["Garage"];
                        aux.Dormitorios = (int)datos.Lector["Dormitorios"];
                        aux.Banos = (int)datos.Lector["Banos"];
                        aux.Antiguedad = (int)datos.Lector["Antiguedad"];
                        aux.Expensas = (float)(decimal)datos.Lector["Expensas"];
                        aux.Superficie = (int)datos.Lector["Superficie"];


                        lista.Add(aux);
                    
                }


                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

        }
        public bool VerificarExistenciaFavoritos(int idCuenta, int idInmueble)
        {
            bool existe = false;
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("SELECT 1 FROM CuentaXinmueble WHERE IdCuenta = @idCuenta AND IdInmueble = @idInmueble");
                datos.setearParametro("@idCuenta", idCuenta);
                datos.setearParametro("@idInmueble", idInmueble);

                datos.ejecutarLectura();

                if (datos.Lector.Read())
                {
                    existe = true;
                }
                return existe;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al verificar la existencia de favoritos.", ex);
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void insertarFavorito(int cuentaActual, int inmuebleActual)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("insertarFavorito");
                datos.setearParametro("@idcuenta", cuentaActual);
                datos.setearParametro("@idinmueble", inmuebleActual);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public void borrarFavorito(int cuentaActual, int inmuebleActual)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("borrarFavorito");
                datos.setearParametro("@idcuenta", cuentaActual);
                datos.setearParametro("@idinmueble", inmuebleActual);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public int obtenerUltimoIdArticulos()
        {
            AccesoDatos datos = new AccesoDatos();
            datos.setearConsulta("select ID from Inmuebles");
            int id = 0;
            try
            {
                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    id = (int)datos.Lector["ID"];
                }
                return id;
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
        public int agregar(Inmueble inmueble)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Inmueble (IdTipoInmueble, IdUbicacion, IdEstado, IdMoneda, Descripcion, Precio, Ambientes, Garage, Dormitorios, Banos, Antiguedad, Expensas, Superficie) " +
                    "VALUES (@IdTipoInmueble, @IdUbicacion, @IdEstado, @IdMoneda, @Descripcion, @Precio, @Ambientes, @Garage, @Dormitorios, @Banos, @Antiguedad, @Expensas, @Superficie); " +
                    "SELECT SCOPE_IDENTITY();");

                datos.setearParametro("@IdTipoInmueble", inmueble.Tipo.ID);
                datos.setearParametro("@IdUbicacion", inmueble.Ubicacion.ID);
                datos.setearParametro("@IdEstado", inmueble.Estado.ID);
                datos.setearParametro("@IdMoneda", inmueble.Moneda.ID);
                datos.setearParametro("@Descripcion", inmueble.Descripcion);
                datos.setearParametro("@Precio", inmueble.Precio);
                datos.setearParametro("@Ambientes", inmueble.Ambientes);
                datos.setearParametro("@Garage", inmueble.Garages);
                datos.setearParametro("@Dormitorios", inmueble.Dormitorios);
                datos.setearParametro("@Banos", inmueble.Banos);
                datos.setearParametro("@Antiguedad", inmueble.Antiguedad);
                datos.setearParametro("@Expensas", inmueble.Expensas);
                datos.setearParametro("@Superficie", inmueble.Superficie);

                return Convert.ToInt32(datos.ejecutarAccionScalar());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public List<Inmueble> listarConSP()
        {
            List<Inmueble> lista = new List<Inmueble>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "SELECT I.ID, T.ID AS IDTipo, T.Descripcion AS Tipo, U.ID AS IDUbicacion, U.Descripcion AS Ubicacion, E.ID AS IDEstado, E.Descripcion AS Estado, M.ID AS IDMoneda, M.Descripcion AS Moneda, I.Descripcion, I.Precio, I.Ambientes, I.Garage, I.Dormitorios, I.Banos, I.Antiguedad, I.Expensas, I.Superficie from Inmueble I, TipoInmueble T, Ubicacion U, Estado E, Moneda M WHERE I.IdEstado = E.ID AND I.IdTipoInmueble = T.ID AND I.IdUbicacion = U.ID AND I.IdEstado = E.ID AND I.IdMoneda = M.ID";
                datos.setearConsulta(consulta);

                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    aux.ID = (int)datos.Lector["ID"];

                    aux.Tipo = new TipoInmueble();
                    aux.Tipo.ID = (int)datos.Lector["IdTipo"];
                    aux.Tipo.Descripcion = (string)datos.Lector["Tipo"];

                    aux.Ubicacion = new Ubicacion();
                    aux.Ubicacion.ID = (int)datos.Lector["IdUbicacion"];
                    aux.Ubicacion.Descripcion = (string)datos.Lector["Ubicacion"];

                    aux.Estado = new Estado();
                    aux.Estado.ID = (int)datos.Lector["IdEstado"];
                    aux.Estado.Descripcion = (string)datos.Lector["Estado"];

                    aux.Moneda = new Moneda();
                    aux.Moneda.ID = (int)datos.Lector["IdMoneda"];
                    aux.Moneda.Descripcion = (string)datos.Lector["Moneda"];

                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Precio = (float)(decimal)datos.Lector["Precio"];
                    aux.Ambientes = (int)datos.Lector["Ambientes"];
                    aux.Garages = (int)datos.Lector["Garage"];
                    aux.Dormitorios = (int)datos.Lector["Dormitorios"];
                    aux.Banos = (int)datos.Lector["Banos"];
                    aux.Antiguedad = (int)datos.Lector["Antiguedad"];
                    aux.Expensas = (float)(decimal)datos.Lector["Expensas"];
                    aux.Superficie = (int)datos.Lector["Superficie"];

                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public Inmueble obtenerPorId(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            Inmueble inmueble = null;

            try
            {
                datos.setearConsulta("SELECT I.ID, T.ID AS IDTipo, T.Descripcion  AS Tipo, U.ID AS IDUbicacion, U.Descripcion AS Ubicacion, E.ID AS IDEstado, E.Descripcion AS Estado, M.ID AS IDMoneda, M.Descripcion AS Moneda, I.Descripcion, I.Precio, I.Ambientes, I.Garage, I.Dormitorios, I.Banos, I.Antiguedad, I.Expensas, I.Superficie FROM Inmueble I INNER JOIN TipoInmueble T ON I.IdTipoInmueble = T.ID INNER JOIN Ubicacion U ON I.IdUbicacion = U.ID INNER JOIN Estado E ON I.IdEstado = E.ID INNER JOIN Moneda M ON I.IdMoneda = M.ID WHERE I.ID = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarLectura();

                if (datos.Lector != null && datos.Lector.Read())
                {
                    inmueble = new Inmueble();
                    inmueble.ID = (int)datos.Lector["ID"];
                    inmueble.Tipo = new TipoInmueble();
                    inmueble.Tipo.ID = (int)datos.Lector["IDTipo"];
                    inmueble.Ubicacion = new Ubicacion();
                    inmueble.Ubicacion.ID = (int)datos.Lector["IDUbicacion"];
                    inmueble.Estado = new Estado();
                    inmueble.Estado.ID = (int)datos.Lector["IDEstado"];
                    inmueble.Moneda = new Moneda();
                    inmueble.Moneda.ID = (int)datos.Lector["IDMoneda"];
                    inmueble.Descripcion = (string)datos.Lector["Descripcion"];
                    inmueble.Precio = (float)(decimal)datos.Lector["Precio"];
                    inmueble.Ambientes = (int)datos.Lector["Ambientes"];
                    inmueble.Garages = (int)datos.Lector["Garage"];
                    inmueble.Dormitorios = (int)datos.Lector["Dormitorios"];
                    inmueble.Banos = (int)datos.Lector["Banos"];
                    inmueble.Antiguedad = (int)datos.Lector["Antiguedad"];
                    inmueble.Expensas = (float)(decimal)datos.Lector["Expensas"];
                    inmueble.Superficie = (int)datos.Lector["Superficie"];
                    //inmueble.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }

            return inmueble;
        }
        public bool ActualizarInmueble(Inmueble inmueble)
        {
            string consulta = "UPDATE Inmueble SET  IdTipoInmueble = @idTipo, IdUbicacion = @idUbicacion, IdEstado = @idEstado, IdMoneda = @idMoneda,  Descripcion = @descripcion, Precio = @precio, Ambientes = @ambientes, Garage = @garage, Dormitorios = @dormitorios, Banos = @banos, Antiguedad = @antiguedad, Expensas = @expensas, Superficie = @superficie WHERE ID = @id";

            using (SqlConnection conexion = new SqlConnection("server=.\\SQLLab3; database=Inmobiliaria; integrated security=true"))
            {
                using (SqlCommand comando = new SqlCommand(consulta, conexion))
                {
                    comando.Parameters.AddWithValue("@idTipo", inmueble.Tipo.ID);
                    comando.Parameters.AddWithValue("@idUbicacion", inmueble.Ubicacion.ID);
                    comando.Parameters.AddWithValue("@idEstado", inmueble.Estado.ID);
                    comando.Parameters.AddWithValue("@idMoneda", inmueble.Moneda.ID);

                    comando.Parameters.AddWithValue("@descripcion", inmueble.Descripcion);
                    comando.Parameters.AddWithValue("@precio", inmueble.Precio);
                    comando.Parameters.AddWithValue("@ambientes", inmueble.Ambientes);
                    comando.Parameters.AddWithValue("@garage", inmueble.Garages);
                    comando.Parameters.AddWithValue("@dormitorios", inmueble.Dormitorios);
                    comando.Parameters.AddWithValue("@banos", inmueble.Banos);
                    comando.Parameters.AddWithValue("@antiguedad", inmueble.Antiguedad);
                    comando.Parameters.AddWithValue("@expensas", inmueble.Expensas);
                    comando.Parameters.AddWithValue("@superficie", inmueble.Superficie);
                    comando.Parameters.AddWithValue("@id", inmueble.ID);
                    //comando.Parameters.AddWithValue("@imagenUrl", inmueble.ImagenUrl);

                    conexion.Open();
                    int filasAfectadas = comando.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
        }
        public bool eliminar(int id)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("delete from Inmueble where ID = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
                return true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }
    }
}
