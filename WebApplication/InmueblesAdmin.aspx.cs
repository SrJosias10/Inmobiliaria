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
    public partial class InmueblesAdmin : System.Web.UI.Page
    {
        public List<Inmueble> listaInmueble { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["listaUsuarios"] == null)
                {
                    InmuebleNegocio negocio = new InmuebleNegocio();
                    listaInmueble = negocio.listarConSP();
                    Session["listaInmueble"] = listaInmueble;

                }
                else
                {
                    listaInmueble = (List<Inmueble>)Session["listaInmueble"];
                }
                dgvInmuebles.DataSource = listaInmueble;
                dgvInmuebles.DataBind();
            }
        }
        protected void tbxFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Inmueble> Lista = (List<Inmueble>)Session["listaInmueble"];
            listaInmueble = Lista.FindAll(x => x.Descripcion.ToUpper().Contains(tbxFiltro.Text.ToUpper()));
            dgvInmuebles.DataSource = listaInmueble;
            dgvInmuebles.DataBind();
        }

        protected void dgvInmuebles_SelectedIndexChanged(object sender, EventArgs e)
        {
            var id = dgvInmuebles.SelectedDataKey.Value.ToString();
            Response.Redirect("EditarInmueble.aspx?ID=" + id);
        }
        protected string GetImageUrl(object imageUrlObj)
        {
            string imageUrl = imageUrlObj as string;
            if (string.IsNullOrEmpty(imageUrl))
            {
                return ResolveUrl("https://asahimotors.com/images/nodisponible.png");
            }
            else
            {
                Uri uriResult;
                bool result = Uri.TryCreate(imageUrl, UriKind.Absolute, out uriResult)
                              && (uriResult.Scheme == Uri.UriSchemeHttp || uriResult.Scheme == Uri.UriSchemeHttps);

                if (!result)
                {
                    // Si la URL no es accesible, devuelve la imagen de no disponible
                    return ResolveUrl("https://asahimotors.com/images/nodisponible.png");
                }
                else
                {
                    return imageUrl;
                }
            }
        }
    }
}