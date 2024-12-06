using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication
{
    public partial class ImagenesAdm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idInmueble = Convert.ToInt32(Request.QueryString["ID"]);
                ImagenNegocio neg = new ImagenNegocio();
                List<Imagen> imagenes = neg.listarPorInmueble(idInmueble);
                repImagenes.DataSource = imagenes;
                repImagenes.DataBind();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtImagen.HasFile)
            {
                string imagenUrl = "/ImgInmuebles/" + txtImagen.FileName;
                string path = Server.MapPath(imagenUrl);
                txtImagen.SaveAs(path);
                ImagenNegocio neg = new ImagenNegocio();
                int idInmueble = Convert.ToInt32(Request.QueryString["ID"]);
                neg.agregarImagen(idInmueble, imagenUrl);
                List<Imagen> imagenes = neg.listarPorInmueble(idInmueble);
                repImagenes.DataSource = imagenes;
                repImagenes.DataBind();
            }
            else
            {
                lblMensaje.Text = "Por favor seleccione una imagen.";
                lblMensaje.Visible = true;
            }
        }

        protected void EliminarImagen_Click(object sender, EventArgs e)
        {
            Button btnEliminar = (Button)sender;
            int idImagen = Convert.ToInt32(btnEliminar.CommandArgument);
            ImagenNegocio neg = new ImagenNegocio();
            neg.eliminarImagen(idImagen);
            int idInmueble = Convert.ToInt32(Request.QueryString["ID"]);
            List<Imagen> imagenes = neg.listarPorInmueble(idInmueble);
            repImagenes.DataSource = imagenes;
            repImagenes.DataBind();
        }
    }
}
