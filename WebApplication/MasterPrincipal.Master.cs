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
        public int Cantidad { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["cuenta"] != null)
                {
                    Cuenta usuario = (Cuenta)Session["cuenta"];
                    if (usuario != null)
                    {
                        lblUsuario.Text = usuario.Nombre ?? "Usuario";
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