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
                datos.setearConsulta("SELECT I.ID, I.IdTipoInmueble Tipo, I.IdUbicacion Ubicacion, I.IdEstado Estado, I.IdMoneda Moneda, I.Descripcion, I.Precio, I.Ambientes, I.Garage, I.Dormitorios, I.Banos, I.Antiguedad, I.Expensas, I.Superficie FROM Inmueble I, Ciudad CIU, Cuenta CTA, Estado Est, Imagenes IMG, Moneda M, Provincia P, TipoInmueble TI, Ubicacion U Where I.IdTipoInmueble = TI.ID AND I.IdUbicacion = U.ID AND I.IdEstado = EST.ID AND I.IdMoneda = M.ID");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Inmueble aux = new Inmueble();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.Tipo.ID = (int)datos.Lector["IdTipoInmueble"];
                    aux.Ubicacion.ID = (int)datos.Lector["IdUbicacion"];
                    aux.Estado.ID = (int)datos.Lector["IdEstado"];
                    aux.Moneda.ID = (int)datos.Lector["IdMoneda"];
                    aux.Descripcion = (string)datos.Lector["Descripcion"];
                    aux.Precio = (float)(decimal)datos.Lector["Precio"];
                    aux.Ambientes = (int)datos.Lector["Ambientes"];
                    aux.Garages = (int)datos.Lector["Garage"];
                    aux.Dormitorios = (int)datos.Lector["Dormitorios"];
                    aux.Banos = (int)datos.Lector["Banos"];
                    aux.Antiguedad = (int)datos.Lector["Antiguedad"];
                    aux.Expensas = (int)datos.Lector["Expensas"];
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
    }
}
