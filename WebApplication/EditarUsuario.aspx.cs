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
    public partial class EditarUsuario : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }
        public List<Cuenta> listaUsuarios { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ConfirmaEliminacion = false;
            if (!IsPostBack)
            {
                int id;
                if (int.TryParse(Request.QueryString["ID"], out id))
                {
                    CuentaNegocio negocio = new CuentaNegocio();
                    Cuenta usuarioActual = negocio.obtenerPorId(id);
                    if (usuarioActual != null)
                    {
                        CargarDatosUsuario(usuarioActual);
                        Session["usuarioID"] = id;
                    }
                    else
                    {
                        lblMensaje.Text = "Usuario no encontrado.";
                        lblMensaje.Visible = true;
                    }
                }
                else
                {
                    lblMensaje.Text = "ID inválido.";
                    lblMensaje.Visible = true;
                }
            }
        }

        private void CargarDatosUsuario(Cuenta usuario)
        {
            txtUser.Text = usuario.Mail;
            txtPass.Text = usuario.Clave;
            txtNombres.Text = usuario.Nombre;
            txtApellidos.Text = usuario.Apellido;
            txtTelefono.Text = usuario.Telefono.ToString();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                CuentaNegocio negocio = new CuentaNegocio();
                int id = (int)Session["usuarioID"];
                Cuenta usuario = negocio.obtenerPorId(id);

                if (usuario != null)
                {
                    usuario.Clave = txtPass.Text;
                    usuario.Nombre = txtNombres.Text;
                    usuario.Apellido = txtApellidos.Text;
                    usuario.Telefono = int.Parse(txtTelefono.Text);
                    negocio.Actualizar(usuario);
                    lblMensaje.Text = "Registro actualizado con éxito.";
                    lblMensaje.CssClass = "text-success";
                    lblMensaje.Visible = true;
                }
                else
                {
                    lblMensaje.Text = "Registro no encontrado para la actualización.";
                    lblMensaje.Visible = true;
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al guardar los datos: " + ex.Message;
                lblMensaje.Visible = true;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void btnConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmaEliminacion.Checked)
                {
                    CuentaNegocio negocio = new CuentaNegocio();
                    if (negocio.eliminar((int)Session["usuarioID"]))
                    {
                        listaUsuarios = negocio.listar();
                        Session["listaUsuarios"] = listaUsuarios;
                        Response.Redirect("Usuarios.aspx?msg=eliminado");
                    }
                    else
                    {
                        lblMensaje.Text = "Error al eliminar el registro.";
                        lblMensaje.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error: " + ex.Message;
                lblMensaje.Visible = true;
            }
        }
    }
}