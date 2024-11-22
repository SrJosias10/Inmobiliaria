using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace WebApplication
{
    public partial class MiPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cuenta aux = (Cuenta)Session["cuenta"];
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["cuenta"]))
                    {
                        txtUser.Text = aux.Mail;
                        txtClave.Text = aux.Clave;
                        txtApellidos.Text = aux.Apellido;
                        txtNombres.Text = aux.Nombre;
                        txtTelefono.Text = aux.Telefono.ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                CuentaNegocio negocio = new CuentaNegocio();
                Cuenta aux = (Cuenta)Session["cuenta"];

                aux.Mail = txtClave.Text;
                aux.Nombre = txtNombres.Text;
                aux.Apellido = txtApellidos.Text;
                aux.Telefono = int.Parse(txtTelefono.Text);

                negocio.Actualizar(aux);
                // Opcional: Mostrar mensaje de éxito
                lblMensaje.Text = "Usuario actualizado con éxito.";
                lblMensaje.CssClass = "text-success";
                lblMensaje.Visible = true;
            }
            catch (Exception ex)
            {
                Session.Add("Error", ex.ToString());
            }
        }
    }
}