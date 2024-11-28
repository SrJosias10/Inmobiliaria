using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace WebApplication
{
    public partial class DetalleInmueble : System.Web.UI.Page
    {
        public Inmueble inm { get; set; }
       //public List<Inmueble> favoritos { get; set; }
        public List<Imagen> imagenes { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id))
            {
                // Recupera los datos del inmueble desde la sesión
                var inmuebles = (List<Inmueble>)Session["Inmuebles"];
                var imagenesPorInmueble = (Dictionary<int, List<Imagen>>)Session["ImagenesPorInmueble"];

                inm = inmuebles.FirstOrDefault(x => x.ID == id);
                if (inm != null)
                {
                    imagenes = imagenesPorInmueble.ContainsKey(id) ? imagenesPorInmueble[id] : new List<Imagen>();
                }
            }
        }
    }
}