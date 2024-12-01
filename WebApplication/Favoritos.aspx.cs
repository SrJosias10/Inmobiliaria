using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace WebApplication
{
    public partial class Favoritos : System.Web.UI.Page
    {
        public List<Inmueble> ListaFavoritos { get; set; }
        public Dictionary<int, List<Imagen>> ImagenesPorFavoritos { get; set; }
        public Cuenta usuario = new Cuenta();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Validación de sesión
            if (Session["cuenta"] != null)
            {
                usuario = (Cuenta)Session["cuenta"];
            }
            else
            {
                Response.Redirect("Login.aspx");
                return;
            }

            // Cargar favoritos si no es un postback
            if (!IsPostBack)
            {
                CargarFavoritos();
                if (Request.QueryString["id"] != null)
                {
                    int idInmueble = int.Parse(Request.QueryString["id"]);
                    EliminarFavorito(idInmueble);
                }
            }
            else
            {
                ListaFavoritos = (List<Inmueble>)Session["Favoritos"];
                ImagenesPorFavoritos = (Dictionary<int, List<Imagen>>)Session["ImagenesPorFavoritos"];
            }
        }

        private void CargarFavoritos()
        {
            ListaFavoritos = new List<Inmueble>();
            InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();
            List<Inmueble> todosLosInmuebles = inmuebleNegocio.listar();

            foreach (var inmueble in todosLosInmuebles)
            {
                bool existe = inmuebleNegocio.VerificarExistenciaFavoritos(usuario.ID, inmueble.ID);
                if (existe)
                {
                    ListaFavoritos.Add(inmueble);
                }
            }

            // Guardar favoritos en sesión
            Session["Favoritos"] = ListaFavoritos;

            // Cargar imágenes asociadas
            ImagenesPorFavoritos = new Dictionary<int, List<Imagen>>();
            ImagenNegocio imagenNegocio = new ImagenNegocio();
            foreach (var inmueble in ListaFavoritos)
            {
                var imagenes = imagenNegocio.listarPorInmueble(inmueble.ID);
                ImagenesPorFavoritos[inmueble.ID] = imagenes;
            }

            Session["ImagenesPorFavoritos"] = ImagenesPorFavoritos;
        }

        private void EliminarFavorito(int idInmueble)
        {
            ListaFavoritos.RemoveAll(inm => inm.ID == idInmueble);
            InmuebleNegocio inmuebleNegocio = new InmuebleNegocio();
            inmuebleNegocio.borrarFavorito(usuario.ID, idInmueble);
            Session["Favoritos"] = ListaFavoritos;

        }
    }
}
