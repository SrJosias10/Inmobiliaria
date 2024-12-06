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

            //if (!string.IsNullOrEmpty(usuario.ImagenUrl))
            //{
            //    imgNuevoPerfil.ImageUrl = "~/Images/" + usuario.ImagenUrl;
            //}
            //else
            //{
            //    imgNuevoPerfil.ImageUrl = "https://cdn.icon-icons.com/icons2/3298/PNG/512/ui_user_profile_avatar_person_icon_208734.png";
            //}
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                CuentaNegocio negocio = new CuentaNegocio();

                // Recuperar el ID del usuario desde la sesión
                int id = (int)Session["usuarioID"];
                Cuenta usuario = negocio.obtenerPorId(id);

                if (usuario != null)
                {
                    //string ruta = Server.MapPath("~/Images/");

                    //// Verificar si se ha seleccionado un archivo para la imagen
                    //if (txtImagen.PostedFile != null && txtImagen.PostedFile.ContentLength > 0)
                    //{
                    //    // Guardar el archivo de imagen
                    //    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + usuario.Id + ".png");
                    //    usuario.ImagenUrl = "perfil-" + usuario.Id + ".png";
                    //}

                    // Actualizar otros campos del usuario
                    usuario.Clave = txtPass.Text;
                    usuario.Nombre = txtNombres.Text;
                    usuario.Apellido = txtApellidos.Text;
                    usuario.Telefono = int.Parse(txtTelefono.Text);

                    // Actualizar en la base de datos
                    negocio.Actualizar(usuario);

                    // Opcional: Mostrar mensaje de éxito
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