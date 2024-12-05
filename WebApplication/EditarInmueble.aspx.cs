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
    public partial class EditarInmueble : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    InmuebleNegocio negocio = new InmuebleNegocio();
                    CargarMoneda();
                    CargarEstado();
                    CargarUbicaciones();
                    CargarTipoInmueble();

                    int id;
                    if (int.TryParse(Request.QueryString["ID"], out id))
                    {
                        Inmueble inmuebleActual = negocio.obtenerPorId(id);
                        if (inmuebleActual != null)
                        {
                            CargarDatosInmueble(inmuebleActual);
                            Session["InmuebleID"] = id;
                        }
                        else
                        {
                            lblMensaje.Text = "Inmueble no encontrado.";
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
            catch (Exception ex)
            {
                //Session.Add("Error", ex);
                throw ex;
            }
        }
        private void CargarTipoInmueble()
        {
            TipoInmuebleNegocio tipoNegocio = new TipoInmuebleNegocio();
            try
            {
                List<TipoInmueble> listaTipos = tipoNegocio.listar();

                ddlTipo.DataSource = listaTipos;
                ddlTipo.DataTextField = "Descripcion";
                ddlTipo.DataValueField = "ID";
                ddlTipo.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = $"Error al cargar tipos: {ex.Message}";
            }
        }
        private void CargarUbicaciones()
        {
            UbicacionNegocio ubicacionNegocio = new UbicacionNegocio();
            try
            {
                List<Ubicacion> listaUbicaciones = ubicacionNegocio.listar();
                ddlUbicacion.DataSource = listaUbicaciones;
                ddlUbicacion.DataTextField = "Descripcion";
                ddlUbicacion.DataValueField = "ID";
                ddlUbicacion.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al cargar ubicaciones: " + ex.Message;
                lblMensaje.Visible = true;
            }
        }
        private void CargarEstado()
        {
            EstadoNegocio estadoNegocio = new EstadoNegocio();
            try
            {
                List<Estado> listaEstados = estadoNegocio.listar();

                ddlEstado.DataSource = listaEstados;
                ddlEstado.DataTextField = "Descripcion";
                ddlEstado.DataValueField = "ID";
                ddlEstado.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = $"Error al cargar Estados: {ex.Message}";
            }
        }
        private void CargarMoneda()
        {
            MonedaNegocio moneda = new MonedaNegocio();
            try
            {
                List<Moneda> listaMoneda = moneda.listar();

                ddlMoneda.DataSource = listaMoneda;
                ddlMoneda.DataTextField = "Descripcion";
                ddlMoneda.DataValueField = "ID";
                ddlMoneda.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = $"Error al cargar Estados: {ex.Message}";
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    ArticuloNegocio negocio = new ArticuloNegocio();
            //    int id = (int)Session["ArticulosID"];
            //    Articulos articulo = negocio.obtenerPorId(id);

            //    if (articulo != null)
            //    {

            //        // Actualizar otros campos del usuario
            //        articulo.Nombre = txtNombre.Text;
            //        articulo.Descripcion = txtDescripcion.Text;
            //        articulo.Categoria.Id = !string.IsNullOrEmpty(ddlCategoria.SelectedValue) ? Convert.ToInt32(ddlCategoria.SelectedValue) : 0;
            //        articulo.Marca.Id = !string.IsNullOrEmpty(ddlMarca.SelectedValue) ? Convert.ToInt32(ddlMarca.SelectedValue) : 0;
            //        articulo.Precio = float.Parse(txtPrecio.Text);
            //        articulo.ImagenUrl = txtUrl.Text;
            //        articulo.Stock = int.Parse(txtPrecio.Text);

            //        negocio.ActualizarArt(articulo);

            //        lblMensaje.Text = "Usuario actualizado con éxito.";
            //        lblMensaje.CssClass = "text-success";
            //        lblMensaje.Visible = true;
            //    }
            //    else
            //    {
            //        lblMensaje.Text = "Usuario no encontrado para la actualización.";
            //        lblMensaje.Visible = true;
            //    }

            //    Response.Redirect("ArticulosAdmin.aspx", false);
            //}
            //catch (Exception ex)
            //{
            //    //Session.Add("Error", ex);
            //    throw ex;
            //}
        }

        protected void txtUrl_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtUrl.Text;
        }

        private void CargarDatosInmueble(Inmueble inmueble)
        {
            ddlTipo.SelectedValue = inmueble.Tipo.ID.ToString();
            ddlUbicacion.SelectedValue = inmueble.Ubicacion.ID.ToString();
            ddlEstado.SelectedValue = inmueble.Estado.ID.ToString();
            ddlMoneda.SelectedValue = inmueble.Moneda.ID.ToString();
            txtDescripcion.Text = inmueble.Descripcion;
            txtPrecio.Text = inmueble.Precio.ToString();
            txtAmbientes.Text = inmueble.Ambientes.ToString();
            txtGarage.Text = inmueble.Garages.ToString();
            txtDormitorio.Text = inmueble.Dormitorios.ToString();
            txtBano.Text = inmueble.Banos.ToString();
            txtAntiguedad.Text = inmueble.Antiguedad.ToString();
            txtExpensas.Text = inmueble.Expensas.ToString();
            txtSuperficie.Text = inmueble.Superficie.ToString();
            //txtUrl.Text = inmueble.ImagenUrl;

            //imgArticulo.ImageUrl = articulo.ImagenUrl;
        }
        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void btnConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    if (chkConfirmaEliminacion.Checked)
            //    {
            //        ArticuloNegocio negocio = new ArticuloNegocio();
            //        if (negocio.eliminar((int)Session["ArticulosID"]))
            //        {
            //            lblMensaje.Text = "Artículo eliminado";
            //            lblMensaje.Visible = true;
            //            Response.Redirect("FormularioArticulo.aspx?msg=eliminado");
            //            Response.AppendHeader("Refresh", "2;url=ArticulosAdmin.aspx");
            //        }
            //        else
            //        {
            //            lblMensaje.Text = "Error al eliminar el registro.";
            //            lblMensaje.Visible = true;
            //        }
            //    }
            //}
            //catch (Exception ex)
            //{
            //    lblMensaje.Text = "Error: " + ex.Message;
            //    lblMensaje.Visible = true;
            //}
        }
    }
}