using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class CuentaNegocio
    {
        public List<Cuenta> listar()
        {
            List<Cuenta> lista = new List<Cuenta>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("Select ID, Email, Pass, Nombres, Apellidos, Nacimiento, Telefono From Cuenta");
                datos.ejecutarLectura();

                while (datos.Lector.Read())
                {
                    Cuenta aux = new Cuenta();
                    aux.ID = (int)datos.Lector["ID"];
                    aux.Mail = (string)datos.Lector["Email"];
                    aux.Clave = (string)datos.Lector["Pass"];
                    aux.Nombre = (string)datos.Lector["Nombres"];
                    aux.Apellido = (string)datos.Lector["Apellidos"];
                    aux.Telefono = (int)datos.Lector["Telefono"];

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

        public bool Loguear(Cuenta cuenta)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                // Asegúrate de que los parámetros se están pasando correctamente
                datos.setearConsulta("SELECT ID, Email, Pass, Nombres, Apellidos, Nacimiento, Telefono FROM Cuenta WHERE Email = @email AND Pass = @pass");

                // Asegúrate de agregar los parámetros correctamente con los valores de la cuenta
                datos.setearParametro("@email", cuenta.Mail);
                datos.setearParametro("@pass", cuenta.Clave);

                datos.ejecutarLectura();

                // Si se encuentra el usuario, asignamos los datos
                if (datos.Lector.Read())
                {
                    cuenta.ID = Convert.ToInt32(datos.Lector["ID"]);
                    cuenta.Nombre = datos.Lector["Nombres"] == DBNull.Value ? string.Empty : Convert.ToString(datos.Lector["Nombres"]);
                    cuenta.Apellido = datos.Lector["Apellidos"] == DBNull.Value ? string.Empty : Convert.ToString(datos.Lector["Apellidos"]);
                    cuenta.Telefono = Convert.ToInt32(datos.Lector["Telefono"]);
                    return true;
                }

                // Si no se encuentra el usuario, devolvemos false
                return false;
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
