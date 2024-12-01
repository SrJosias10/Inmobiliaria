using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Net.Mail;
using System.Net;

namespace WebApplication
{
    public partial class DetalleInmueble : System.Web.UI.Page
    {
        public Inmueble inm { get; set; }
        public List<Inmueble> favoritos { get; set; }
        public List<Imagen> imagenes { get; set; }
        Cuenta usuario = new Cuenta();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cuenta"] != null)
            {
                usuario = (Cuenta)Session["cuenta"];
            }
            if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out int id))
            {
                var inmuebles = (List<Inmueble>)Session["Inmuebles"];
                var imagenesPorInmueble = (Dictionary<int, List<Imagen>>)Session["ImagenesPorInmueble"];

                inm = inmuebles.FirstOrDefault(x => x.ID == id);
                if (inm != null)
                {
                    imagenes = imagenesPorInmueble.ContainsKey(id) ? imagenesPorInmueble[id] : new List<Imagen>();
                    favoritos = Session["Favoritos"] as List<Inmueble> ?? new List<Inmueble>();
                    bool esFavorito = favoritos.Any(x => x.ID == inm.ID);
                    ViewState["EsFavorito"] = esFavorito;
                }
            }
        }
        protected void AgregarFavoritos_Click(object sender, EventArgs e)
        {
            int IdCuenta = usuario.ID;
            int IdInmueble = inm.ID;
            InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();

            bool existe = inmuebleNegocio.VerificarExistenciaFavoritos(IdCuenta, IdInmueble);
            if (existe == false)
            {
                inmuebleNegocio.insertarFavorito(IdCuenta, IdInmueble);
                favoritos = Session["Favoritos"] as List<Inmueble> ?? new List<Inmueble>();
                favoritos.Add(inm);
                Session["Favoritos"] = favoritos;
            }
        }
    }
}
