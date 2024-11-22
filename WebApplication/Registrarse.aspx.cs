using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class Registrarse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtEmail.Text;
                string _pass = txtPassword.Text;

                if (!email.Contains("@") || !email.Contains("."))
                {
                    lblErrorMail.Text = "Correo electrónico inválido";
                    lblErrorMail.Visible = true;
                    return;
                }
                if (_pass == "")
                {
                    lblErrorMail.Text = "Por favor registre una contraseña";
                    lblErrorMail.Visible = true;
                    return;
                }

                Cuenta cuenta = new Cuenta();
                CuentaNegocio negocio = new CuentaNegocio();
                EmailService emailService = new EmailService();

                cuenta.Mail = email;
                cuenta.Clave = _pass;
                cuenta.Nombre = txtNombres.Text;
                cuenta.Apellido = txtApellidos.Text;
                cuenta.Telefono = int.Parse(txtTelefono.Text);
                cuenta.ID = negocio.insertarNuevo(cuenta);

                if (cuenta.ID > 0)
                {
                    emailService.armarCorreo(cuenta.Mail, "Bienvenida", "Hola, ¡bienvenido a nuestra aplicación!");
                    emailService.enviarEmail();

                    lblDatosVacios.Text = "¡Ya estás registrado! Se ha enviado un correo de confirmación.";
                    lblDatosVacios.Visible = true;

                    cuenta = new Cuenta(email, _pass);
                    Session.Add("cuenta", cuenta);

                    ScriptManager.RegisterStartupScript(this, GetType(), "redirect", "setTimeout(function(){ window.location.href = 'Inicio.aspx'; }, 2000);", true);
                }
            }
            catch (Exception ex)
            {
                lblErrorIngreso.Text = "Ocurrió un error al intentar registrarse: " + ex.Message;
                lblErrorIngreso.Visible = true;
            }
        }
    }
}