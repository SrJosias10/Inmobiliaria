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
    public partial class Usuarios : System.Web.UI.Page
    {
        public List<Cuenta> listaUsuarios { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["listaUsuarios"] == null)
                {
                    CuentaNegocio negocio = new CuentaNegocio();
                    listaUsuarios = negocio.listar();
                    Session["listaUsuarios"] = listaUsuarios;
                }
                else
                {
                    listaUsuarios = (List<Cuenta>)Session["listaUsuarios"];
                }
                dgvUsuarios.DataSource = listaUsuarios;
                dgvUsuarios.DataBind();
            }
        }
        protected void dgvUsuarios_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvUsuarios.SelectedDataKey.Value.ToString();
            Response.Redirect("EditarUsuario.aspx?ID=" + id);
        }
        protected void chkAdmin_CheckedChanged(object sender, EventArgs e)
        {
            GridViewRow row = (GridViewRow)((CheckBox)sender).NamingContainer;
            int idUsuario = Convert.ToInt32(dgvUsuarios.DataKeys[row.RowIndex].Value);
            CheckBox chkAdmin = (CheckBox)sender;
            bool esAdmin = chkAdmin.Checked;
            CuentaNegocio negocio = new CuentaNegocio();
            if (esAdmin)
            {
                negocio.esADM(idUsuario);
            }
            else
            {
                negocio.esCliente(idUsuario);
            }
            listaUsuarios = negocio.listar();
            Session["listaUsuarios"] = listaUsuarios;
            dgvUsuarios.DataSource = listaUsuarios;
            dgvUsuarios.DataBind();
        }


    }
}