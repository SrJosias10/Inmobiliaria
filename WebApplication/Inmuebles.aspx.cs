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
    public partial class Inmuebles : System.Web.UI.Page
    {
        public List<Inmueble> ListaInmuebles { get; set; }
        public Dictionary<int, List<Imagen>> ImagenesPorInmueble { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();
                ListaInmuebles = inmuebleNegocio.listar();
                foreach (Inmueble verificar in ListaInmuebles)
                {

                }
                Session["Inmuebles"] = ListaInmuebles;

                ImagenesPorInmueble = new Dictionary<int, List<Imagen>>();
                ImagenNegocio imagenNegocio = new ImagenNegocio();

                foreach (var inmueble in ListaInmuebles)
                {
                    var imagenes = imagenNegocio.listarPorInmueble(inmueble.ID);
                    ImagenesPorInmueble[inmueble.ID] = imagenes;
                }
                Session["ImagenesPorInmueble"] = ImagenesPorInmueble;
            }
            else
            {
                ListaInmuebles = (List<Inmueble>)Session["Inmuebles"];
                ImagenesPorInmueble = (Dictionary<int, List<Imagen>>)Session["ImagenesPorInmueble"];
            }
        }
    }
}
