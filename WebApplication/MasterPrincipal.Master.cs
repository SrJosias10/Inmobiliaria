using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class MasterPrincipal : System.Web.UI.MasterPage
    {
        Cuenta user = new Cuenta();
        public int Cantidad { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Cuenta usuario = (Cuenta)Session["cuenta"];
            if (!IsPostBack)
            {
                if (Session["cuenta"] != null)
                {
                    if (!string.IsNullOrEmpty(usuario.Nombre) && !string.IsNullOrEmpty(usuario.Apellido))
                    {
                        txtUser.Text = usuario.Nombre + " " + usuario.Apellido;
                    }
                    else
                    {
                        txtUser.Text = usuario.Mail;
                    }
                }
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Inicio.aspx");
        }
    }
}