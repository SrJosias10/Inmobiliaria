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
        public List<Estado> ListaEstados { get; set; }
        public List<Provincia> ListaProvincias { get; set; }

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
                EstadoNegocio estadoNegocio = new EstadoNegocio();
                ListaEstados = estadoNegocio.listar();
                Session["Estados"] = ListaEstados;
                ddlEstados.DataSource = ListaEstados;
                ddlEstados.DataTextField = "Descripcion";
                ddlEstados.DataValueField = "ID";
                ddlEstados.DataBind();
                ddlEstados.Items.Insert(0, new ListItem("Todos los estados", "0"));

                ProvinciaNegocio provinciaNegocio = new ProvinciaNegocio();
                ListaProvincias = provinciaNegocio.listar();
                Session["Provincias"] = ListaProvincias;
                ddlProvincias.DataSource = ListaProvincias;
                ddlProvincias.DataTextField = "Descripcion";
                ddlProvincias.DataValueField = "ID";
                ddlProvincias.DataBind();
                ddlProvincias.Items.Insert(0, new ListItem("Todas las provincias", "0"));
            }
            else
            {
                ListaInmuebles = (List<Inmueble>)Session["Inmuebles"];
                ImagenesPorInmueble = (Dictionary<int, List<Imagen>>)Session["ImagenesPorInmueble"];
                ListaEstados = (List<Estado>)Session["Estados"];
                ListaProvincias = (List<Provincia>)Session["Provincias"];
            }
            FiltrarInmuebles();
        }
        protected void FiltrarInmuebles()
        {
            List<Inmueble> ListaFiltrada = new List<Inmueble>();
            List<Inmueble> Lista = (List<Inmueble>)Session["Inmuebles"];

            int estadoSeleccionado = int.Parse(ddlEstados.SelectedValue);
            int provinciaSeleccionada = int.Parse(ddlProvincias.SelectedValue);
            string filtroUbicacion = tbxFiltro.Text.ToUpper();

            foreach (Inmueble inmueble in Lista)
            {
                bool cumpleEstado = (estadoSeleccionado == 0 || inmueble.Estado.ID == estadoSeleccionado);
                bool cumpleProvincia = (provinciaSeleccionada == 0 || inmueble.Ubicacion.Ciudad.Provincia.ID == provinciaSeleccionada);
                bool cumpleUbicacion = string.IsNullOrEmpty(filtroUbicacion) || inmueble.Ubicacion.Descripcion.ToUpper().Contains(filtroUbicacion) || inmueble.Ubicacion.Ciudad.Descripcion.ToUpper().Contains(filtroUbicacion) || inmueble.Ubicacion.Ciudad.Provincia.Descripcion.ToUpper().Contains(filtroUbicacion);
                if (cumpleEstado && cumpleProvincia && cumpleUbicacion)
                {
                    ListaFiltrada.Add(inmueble);
                }
            }
            ListaInmuebles = ListaFiltrada;
        }


        protected void ddlEstados_SelectedIndexChanged(object sender, EventArgs e)
        {
            FiltrarInmuebles();
        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            FiltrarInmuebles();
        }
        protected void tbxFiltro_TextChanged(object sender, EventArgs e)
        {
            FiltrarInmuebles();
        }
    }
}
