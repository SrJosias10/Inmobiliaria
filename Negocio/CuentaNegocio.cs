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
                datos.setearConsulta("Select ID, Email, Pass, Nombres, Apellidos, Nacimiento, Telefono, Adm From Cuenta");
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
                    aux.admin = (bool)datos.Lector["Adm"];


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
        public int insertarNuevo(Cuenta nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("insertarNuevo");
                datos.setearParametro("@email", nuevo.Mail);
                datos.setearParametro("@pass", nuevo.Clave);
                datos.setearParametro("@nombres", nuevo.Nombre);
                datos.setearParametro("@apellidos", nuevo.Apellido);
                datos.setearParametro("@telefono", nuevo.Telefono);
                datos.setearParametro("@adm", nuevo.admin);
                return datos.ejecutarAccionScalar();
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

        public bool Loguear(Cuenta cuenta)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                // Asegúrate de que los parámetros se están pasando correctamente
                datos.setearConsulta("SELECT ID, Email, Pass, Nombres, Apellidos, Nacimiento, Telefono, Adm FROM Cuenta WHERE Email = @email AND Pass = @pass");

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
                    cuenta.Telefono = datos.Lector["Telefono"] == DBNull.Value ? 0 : Convert.ToInt32(datos.Lector["Telefono"]);
                    cuenta.admin = datos.Lector["Adm"] == DBNull.Value ? false : Convert.ToBoolean(datos.Lector["Adm"]);

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
        public void Actualizar(Cuenta user)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("UPDATE Cuenta SET Pass = @pass, Apellidos = @apellidos, Nombres = @nombres, Telefono = @telefono WHERE ID = @id");
                datos.setearParametro("@pass", string.IsNullOrEmpty(user.Clave) ? (object)DBNull.Value : user.Clave);
                datos.setearParametro("@apellidos", string.IsNullOrEmpty(user.Apellido) ? (object)DBNull.Value : user.Apellido);
                datos.setearParametro("@nombres", string.IsNullOrEmpty(user.Nombre) ? (object)DBNull.Value : user.Nombre);
                datos.setearParametro("@telefono", user.Telefono == int.MinValue ? (object)DBNull.Value : user.Telefono);
                datos.setearParametro("@id", user.ID);

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
