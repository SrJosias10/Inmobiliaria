using System;
using System.Collections.Generic;
using System.Linq;
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
    }
}
